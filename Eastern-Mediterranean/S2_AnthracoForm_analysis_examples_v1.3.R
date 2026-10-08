# =============================================================================
# AnthracoForm — example analyses in R (supplementary material S2)
# CSV schema v1.3 — see the data dictionary (S1)
#
# The script reads one or more AnthracoForm CSV files and shows that they can
# be analysed directly, without conversion:
#   1. reading and merging files
#   2. saturation curves per SU, recomputed with the rule used by the app
#   3. list of taxa per SU (all channels) and abundances (HF + LF only)
#   4. diversity per SU (Simpson 1 - D, Shannon) with vegan
#   5. taphonomy frequencies on the fragments where they were recorded
#   6. empirical IAWA profiles per taxon
#
# Requirements: R >= 4.0, package vegan. Tested with R 4.3.3, vegan 2.6-4.
# =============================================================================

library(vegan)

# ---- settings ---------------------------------------------------------------
files <- c("site.csv")      # one or more AnthracoForm CSV files of a region
stop_run <- 50              # stop criterion: fragments without a new taxon

# ---- 1. reading and merging -------------------------------------------------
# Empty cells mean "not recorded": read them as NA, never as 0.
# Files are UTF-8; files downloaded from the browser start with a BOM,
# which is removed from the first column name.
read_af <- function(f) {
  d <- read.csv(f, na.strings = "", colClasses = "character",
                encoding = "UTF-8", check.names = FALSE)
  names(d)[1] <- sub("^\ufeff", "", names(d)[1])
  # files written before schema v1.3 call the oxidation column "ossidation"
  names(d)[names(d) == "ossidation"] <- "oxidation"
  if (!"tipo_resolved" %in% names(d)) d$tipo_resolved <- NA_character_
  d$id_det <- as.integer(d$id_det)
  d
}
d <- do.call(rbind, lapply(files, read_af))

# 0/1 columns: IAWA features, taphonomy, morphology, observation status
bin_cols <- c(grep("^iawa_[AG][0-9]+$", names(d), value = TRUE),
              "undetermined", "twig", "bark", "curv",
              "radial_crack", "wood_compression", "xylophagous_activity",
              "oxidation", "mineralisation", "cell_deformation", "vitrification",
              "trv_view", "tan_view", "rad_view", "photo_done", "photo_todo")
d[bin_cols] <- lapply(d[bin_cols], as.integer)

# site_code + id_det identifies a fragment across merged files;
# site_code + su identifies an SU (SU numbers can repeat across sites)
stopifnot(!any(duplicated(paste(d$site_code, d$id_det))))
d$unit <- paste(d$site_code, d$su, sep = " / ")

# ---- helper rules (the same as in AnthracoForm) ---------------------------
# A determination adds a taxon to a curve only if it is not empty, not
# "undetermined", does not cover several taxa ("/") and has no "cf.".
is_countable   <- function(det) !is.na(det) & trimws(det) != "" &
                                trimws(det) != "undetermined" & !grepl("/", det, fixed = TRUE)
is_curve_taxon <- function(det) is_countable(det) &
                                !grepl("(^|\\s)cf\\.?(\\s|$)", trimws(det), ignore.case = TRUE)
is_hflf        <- function(ch) !is.na(ch) & toupper(trimws(ch)) %in% c("HF", "LF")

# ---- 2. saturation curves per SU ------------------------------------------
# HF + LF fragments of one SU, in order of determination (id_det).
saturation <- function(d, su, site = NULL) {
  x <- d[d$su %in% su & is_hflf(d$channel), ]
  if (!is.null(site)) x <- x[x$site_code %in% site, ]
  x <- x[order(x$id_det), ]
  seen <- character(0); k <- integer(nrow(x)); new <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    t <- trimws(x$det[i])
    if (is_curve_taxon(t) && !(t %in% seen)) { seen <- c(seen, t); new[i] <- TRUE }
    k[i] <- length(seen)
  }
  # fragments since the last new taxon: the stop criterion is met at stop_run
  run <- if (any(new)) nrow(x) - max(which(new)) else nrow(x)
  list(n = seq_len(nrow(x)), taxa = k, new = new, run = run,
       stop_met = run >= stop_run)
}

# Check: the recomputed curve matches the curv_sat column written by the app
check_curv_sat <- function(d) {
  bad <- 0
  for (s in unique(paste(d$site_code, d$su))) {
    x <- d[paste(d$site_code, d$su) == s, ]
    x <- x[order(x$id_det), ]
    seen <- character(0)
    for (i in seq_len(nrow(x))) {
      if (!is_hflf(x$channel[i])) { exp <- NA } else {
        t <- trimws(x$det[i])
        if (is_curve_taxon(t)) seen <- union(seen, t)
        exp <- if (length(seen) > 0) length(seen) else NA
      }
      obs <- suppressWarnings(as.integer(x$curv_sat[i]))
      if (!identical(exp, obs) && !(is.na(exp) && is.na(obs))) bad <- bad + 1
    }
  }
  bad
}
cat("Records whose curv_sat differs from the rule:", check_curv_sat(d), "\n")

# Plot the curve of one SU (black and white, for print)
plot_saturation <- function(d, su, site = NULL) {
  s <- saturation(d, su, site)
  plot(s$n, s$taxa, type = "s", xlab = "HF + LF fragments (order of determination)",
       ylab = "Cumulative number of taxa", main = paste("SU", su), las = 1)
  points(s$n[s$new], s$taxa[s$new], pch = 19, cex = 0.7)
  mtext(sprintf("%d fragments since the last new taxon; stop criterion (%d) %s",
                s$run, stop_run, if (s$stop_met) "met" else "not met"),
        side = 3, line = 0.2, cex = 0.8)
}
# Example: plot_saturation(d, su = d$su[1], site = d$site_code[1])

# ---- 3. taxa per SU and abundances ----------------------------------------
# Richness: every determined fragment, from any channel, enters the list of
# taxa of its SU. Abundances: only HF and LF, which share a known volume.
taxa_by_su <- tapply(trimws(d$det[is_countable(d$det)]),
                     d$unit[is_countable(d$det)],
                     function(v) sort(unique(v)))

ab <- d[is_hflf(d$channel) & is_countable(d$det), ]
abund <- as.matrix(table(ab$unit, trimws(ab$det)))       # counts, SU x taxon
perc  <- round(100 * prop.table(abund, 1), 1)            # percentages per SU

# ---- 4. diversity per SU (HF + LF) ----------------------------------------
div <- data.frame(site_su = rownames(abund),
                  n = rowSums(abund),
                  taxa = rowSums(abund > 0),
                  simpson = round(diversity(abund, index = "simpson"), 3),  # 1 - D
                  shannon = round(diversity(abund, index = "shannon"), 3))
print(div, row.names = FALSE)

# ---- 5. taphonomy ------------------------------------------------------------
# Frequencies on the fragments where each alteration was recorded (NA excluded).
taph_cols <- c("radial_crack", "wood_compression", "xylophagous_activity",
               "oxidation", "mineralisation", "cell_deformation", "vitrification")
taph <- sapply(taph_cols, function(v) c(recorded = sum(!is.na(d[[v]])),
                                        present = sum(d[[v]] == 1, na.rm = TRUE)))
taph <- t(taph)
taph <- cbind(taph, percent = round(100 * taph[, "present"] / taph[, "recorded"], 1))
print(taph)

# ---- 6. empirical IAWA profiles per taxon --------------------------------------
# Share of the fragments of each taxon in which each feature was observed.
# A feature visible in one section only is informative where that section was
# examined (trv_view, tan_view, rad_view): see the IAWA sheets of S1.
iawa_cols <- grep("^iawa_[AG][0-9]+$", names(d), value = TRUE)
prof_d <- d[is_countable(d$det) & rowSums(d[iawa_cols], na.rm = TRUE) > 0, ]
if (nrow(prof_d) > 0) {
  prof <- aggregate(prof_d[iawa_cols], by = list(taxon = trimws(prof_d$det)),
                    FUN = function(v) round(mean(v, na.rm = TRUE), 2))
  prof <- prof[, c(TRUE, colSums(prof[-1] > 0, na.rm = TRUE) > 0)]  # keep features seen at least once
  print(prof)
} else {
  cat("No fragment with recorded IAWA features.\n")
}
