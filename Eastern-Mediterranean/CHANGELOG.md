# Changelog

All notable changes to AnthracoForm – Eastern Mediterranean (Lebanon), formerly Lebanon, are documented here.
This project follows simple incremental versioning; v0.x are pre-release builds,
to be promoted to v1.0 once validated on real assemblages.

## [v0.5.1] - 2026-10-10

Dichotomous Key checked against the original pages of Akkemik & Yaman (2012, pp. 293–296).

### Added
- Saturation panel next to the determination fields, always visible: one row for each of the three curves — HF+LF of the SU (saturation curve), DS of the SU (CDC) and HC of the site (TDC) — with number of taxa and number of fragments on the curve, shown against the next step (100, 200, 250, 300, 400) with a bar coloured grey, amber from 50 and green from 100; the last step reached is marked (e.g. "→200 ✓100"). 100 is a minimum on the arid-zone assemblages of Sindh and Iranian Sistan; 200–400 follow the sample sizes in Kabukcu & Chabal (2021). The row of the channel being recorded is highlighted; STR and C14 have no curve. The panel follows the SU, site and channel in the form (when the SU is empty, those of the last record)
- Curve windows (saturation, TDC, CDC, summary): dashed lines at the steps reached, and the number of fragments left out of the curve

### Changed
- Cumulative curves (saturation curve, `curv_sat`, SU summary, TDC, CDC) follow Kabukcu & Chabal (2021): only fragments with a taxon are on the curve. Indeterminate fragments, *cf.* determinations and determinations with "/" (e.g. *Senegalia/Prosopis* type) are recorded as before but are no longer counted as fragments of the curve (before they counted as fragments, not as taxa); `curv_sat` is empty for them. The curves are computed by one function
- KEEP row, channel: more than one channel can be ticked at the same time. The channel of a record passes to the next record if it is ticked (tick HF, LF, DS and HC and the channel always carries over); with a single channel ticked, the next record starts with that channel, as before. Ticking a channel no longer changes the channel of the current record, unless it has none

### Fixed
- Section C, couplets 14–16 as in the book (p. 295): couplet 14 "Vessels solitary and/or in radial multiples" / "All vessels in dendritic pattern"; couplet 15 "All vessels mostly in radial multiples" (→ 16: *Nerium* / *Olea*) / "Vessels solitary and/or in radial multiples" (→ 17). Before, couplet 14 carried the text of couplet 15, and couplets 15 and 16 were merged into one three-way couplet. The results do not change.
- Gymnosperms: "in earlywood" restored in the cross-field pitting couplets (G2, G2a.1); couplet G2a is labelled as the *Pinus* step, as in the book.

### Removed
- The stop criterion "no new taxon in 50 consecutive fragments" and its line on the curves: the plateau of an accumulation curve has no mathematically defined end point (Kabukcu & Chabal 2021); the panel and the curves show the steps on the number of fragments instead
- The warnings "check against the original" on the Picea/Pinus block and on couplets 15–16 of section C.
- The yellow "new taxon" note under the determination field (it read "new taxon → update saturation curve"): the saturation panel replaces it

## [v0.5] - 2026-10-08

### Added
- Open CSV: in browsers without folder access (File System Access API) an existing file can be opened from disk and saved with Download CSV; the file bar shows whether there are changes not yet downloaded, and the browser warns before closing the page if there are
- `tipo_resolved` column: when a provisional morphological type is resolved, the type is kept in this column (with its description in `tipo_desc`) instead of being lost; the form shows "resolved from tipo_n"

### Fixed
- Interface text left in Italian now in English: file bar ("No folder selected", "Last saved"), photo placeholders ("load TRV photo", ...), message when a taxon is added to the taxa dictionary, tooltips of the morphology dots and of the taxa list
- SU summary, Taphonomy tab: the subtitle no longer refers to the old 1–3 scale ("% presence over fragments where it was recorded")
- Notes written on several lines broke the record into two when the file was read again (Reload CSV or a new session); the CSV reader now keeps line breaks inside quoted values
- Download CSV quotes values that contain a line break
- Resolve dialog title in English

### Changed
- Module renamed **Eastern Mediterranean (Lebanon)** (formerly Lebanon), file `AnthracoForm_Eastern-Mediterranean.html`: module names follow floristic regions (Loidi & Vynokurov 2024), and the place in brackets is where the reference collection was made. Page title and header read "AnthracoForm – Eastern Mediterranean (Lebanon)"; the header title wraps on narrow screens
- Column `ossidation` renamed `oxidation` (CSV schema v1.3, 220 columns). Files written with earlier versions are converted on load and rewritten in the new schema at the first save
- SU summary: Richness, Simpson and Ecology use HF and LF fragments only, the channels that share a known volume; taxa found only in other channels are listed under the Richness chart
- Taxa dictionary: where the reference database (mostly Turkish material) and the present-day vegetation of Lebanon disagree, the Lebanese vegetation takes precedence. *Quercus* sp.: maquis and pine woodland (was deciduous woodland; *Q. calliprinos* is the dominant oak in Lebanon). *Pyrus* sp.: deciduous woodland, as *P. syriaca*, the Lebanese species (was empty)

## [v0.4] - 2026-10-07

### Added
- Source of the reference database: Akkemik, Ü. & Yaman, B. (2012). *Wood Anatomy of Eastern Mediterranean Species*. Verlag Kessel (badge in IAWA Reverse Lookup; cited under Compare Taxa)
- Sources: sampling of present-day vegetation and creation of the reference collection (I. Minervini)
- Dichotomous Key tab: key to genera of Akkemik & Yaman (2012, pp. 293–296), from the transcription, in English — gymnosperms and angiosperms (sections A–C by perforation plates); each result lists the reference-database species of that genus. The Picea/Pinus block and couplets 15–16 of section C are flagged in the tab, to be checked against the original
- Taxa dictionary (auto-fill of family and ecology): the 93 species of the reference database, with the ecology validated on 7 October 2026; the determinations given by the Dichotomous Key and the genera of the database (*Genus* sp.), with the family shared by their species and the most frequent ecology among them — ecology left empty only where the species are evenly split (*Buxus*, *Pyrus*, *Rosa*, *Coronilla*/*Gonocytisus* type)
- Taxa dictionary: the eight genera the key reaches that have no species in the reference database — *Celtis*, *Tilia* and *Ulmus* (deciduous woodland), *Daphne*, *Ephedra* and *Styrax* (maquis and pine woodland), *Salix*/*Populus* and *Tamarix* (riverine). Their ecology comes from the distribution of the genus in Lebanon and the Levant, not from the reference database.
- Ecological categories of the module in the ecological composition chart: maquis and pine woodland, deciduous woodland, mountain forest, riverine, other

### Changed
- IAWA Reverse Lookup as in the Sindh module: results sorted by, and showing only, % covered
- A determination with *cf.* no longer adds a taxon to the cumulative curves (saturation curves, `curv_sat`, SU summary, TDC, CDC); the fragment itself is still counted
- PDF record sheet: html2canvas 1.4.1 and jsPDF 2.5.1 (both MIT) are embedded in the file instead of being downloaded from a CDN, so the tool never uses the internet
- Same code as the Sindh module: the regional data (module name, sources, ecological categories, taxa dictionary, reference database, dichotomous key) are in the REGIONAL MODULE DATA block at the top of the file, and the rest of the file is identical in the two modules
- CSV files with numeric IAWA columns (`iawa_1`, ..., module v0.1) are converted on load to `iawa_A1`, ... with wood type angiosperm, as in the Sindh module

### Fixed
- Moving between records (arrows, search by id_det or SU) no longer re-saves a record that was not edited: the form is written back only if something changed after the record was loaded.
- Label of IAWA feature A141 (IAWA Committee 1989): "prismatic crystals in non-chambered axial parenchyma cells"; it showed the definition of feature 140.
- Alt+←/→ works from any tab (it switches to the Form) and warns when no records are loaded

### Removed
- Compare Taxa: "powered by Claude" from the empty screen; the tool is offline and uses no AI

## [v0.3] - 2026-10-03

### Added
- 19 taxa in the reference database (74 → 93), each with its IAWA Index from the
  reference atlas, available in IAWA Reverse Lookup and Compare Taxa:
  - Rosaceae: *Sorbus torminalis*, *Rosa dumalis* subsp. *boissieri*, *Rosa canina*,
    *Pyrus syriaca*, *Pyrus serikensis*, *Prunus cocomilia*, *Crataegus monogyna*,
    *Crataegus aronia*
  - Rhamnaceae: *Rhamnus thymifolius*, *Rhamnus pyrellus*, *Rhamnus pichleri*,
    *Rhamnus nitidus*, *Rhamnus hirtellus*, *Paliurus spina-christi*
  - Other angiosperms: *Platanus orientalis*, *Phillyrea latifolia*, *Olea europaea*,
    *Fraxinus angustifolia* subsp. *oxycarpa*
  - Gymnosperms: *Juniperus phoenicea*

### Pending
- Dichotomous Key tab still disabled (transcribed key not yet verified against the
  original and without IAWA codes of its own).
- Citation of the reference atlas still to be confirmed.

## [v0.2] - 2026-09-23

### Changed
- TRV/TAN/RAD checklist rebuilt on the IAWA softwood list (IAWA Committee 2004;
  Richter, Grosser, Heinz & Gasson eds.), replacing the earlier hardwood-only
  checklist. Angiosperm and gymnosperm records use separate checklists, with
  A-/G-prefixed codes in the reference database.
