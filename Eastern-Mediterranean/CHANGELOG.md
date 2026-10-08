# Changelog

All notable changes to AnthracoForm – Eastern Mediterranean (Lebanon), formerly Lebanon, are documented here.
This project follows simple incremental versioning; v0.x are pre-release builds,
to be promoted to v1.0 once validated on real assemblages.

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
