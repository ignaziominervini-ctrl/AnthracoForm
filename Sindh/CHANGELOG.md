# Changelog

All notable changes to AnthracoForm are documented here.
This project follows simple incremental versioning (v1.0, v1.1, ...).

## [v1.0] - 2026-06-01

First public release.

### Features
- Charcoal fragment data entry with IAWA feature coding
- Taxon determination with customisable taxa dictionary (localStorage-persistent)
- Per-SU saturation curves with Chabal (1990) stop criterion (50-fragment plateau)
- SU summary and whole-assemblage analysis views
- Offline taxon comparison tool (IAWA reference data)
- Publication-ready figure export (B&W, 170 mm, 300 DPI)
- R-compatible CSV import/export

## [v1.1] - 2026-09-15

### Added
- Quick record lookup by SU or id_det (SU search cycles through multiple matches)

## [v1.2] - 2026-10-07

### Added
- Wood type selection (angiosperm / gymnosperm), as in the Lebanon module: the form shows the matching IAWA checklist
- Softwood checklist from the IAWA list of microscopic features for softwood identification (IAWA Committee 2004), codes prefixed G
- `wood_type` column in the CSV
- Sources: the reference collection (started by C. Lancelotti, expanded by I. Minervini) is credited next to Lancelotti (2018)
- Source badge (Lancelotti 2018 · S2) also in IAWA Reverse Lookup
- Taxa dictionary: the seven taxa of the reference database that had no entry, all dry thorn scrubland — Anacardiaceae (the family-level result of couplet 22), *Balanites aegyptiaca*, *Rotheca multiflora*, *Salvadora oleoides*, *Suaeda monoica*, *Vachellia ferruginea*, *V. leucophloea*. Every taxon of the database and every result of the key now fills in family and ecology.

### Changed
- IAWA codes carry a prefix (A = hardwood list, IAWA Committee 1989; G = softwood list): CSV columns `iawa_A1`, ..., `iawa_G40`, ...
- Hardwood checklist taken from the Lebanon module: 102 characters, grouped by anatomical category
- CSV files from earlier versions (`iawa_1`, ..., no `wood_type`) are converted on load and rewritten in the new layout at the first save
- A determination with *cf.* no longer adds a taxon to the cumulative curves (saturation curves, `curv_sat`, SU summary, TDC, CDC); the fragment itself is still counted
- PDF record sheet: html2canvas 1.4.1 and jsPDF 2.5.1 (both MIT) are embedded in the file instead of being downloaded from a CDN, so the tool never uses the internet
- Taxa dictionary (auto-fill of family and ecology): added *Capparis* sp., *Pistacia* sp., *Senna* cf. *siamea*, *Senna* sp., *Suaeda fruticosa*, *Vachellia* cf. *farnesiana* (dry thorn scrubland), *Populus* sp. and *Ficus* sp. (riverine); Arecaceae removed (palms need dedicated keys)
- Same code as the Lebanon module: the regional data (module name, sources, ecological categories, taxa dictionary, reference database, dichotomous key) are in the REGIONAL MODULE DATA block at the top of the file, and the rest of the file is identical in the two modules
- Compare Taxa: quantitative IAWA features labelled with the IAWA wording (e.g. "vessels per square millimetre: 5–20"); features of the checklist take the checklist label and section (A141, A154 and A155 under RAD)

### Fixed
- Moving between records (arrows, search by id_det or SU) no longer re-saves a record that was not edited: the form is written back only if something changed after the record was loaded. Before, browsing rewrote every record visited (e.g. empty IAWA cells of older records became 0).
- Alt+←/→ works from any tab (it switches to the Form) and warns when no records are loaded
- Dichotomous Key: the result *Senegalia* cf. *senegal* shows the IAWA codes of *Senegalia senegal* (it showed none)

### Removed
- *Prosopis juliflora* and *Leucaena leucocephala* from the reference database: both are modern introductions in Sindh. Neither is a result of the dichotomous key, which is unchanged and still reproduces the published one (Lancelotti 2018, S2) couplet by couplet. The database holds 25 taxa (was 27).
- Compare Taxa: "powered by Claude" from the empty screen; the tool is offline and uses no AI

<!--
Template for future entries — copy this block when you make a new release:

## [v1.1] - YYYY-MM-DD

### Added
- ...

### Changed
- ...

### Fixed
- ...
-->
