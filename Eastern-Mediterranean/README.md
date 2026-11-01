# AnthracoForm – Eastern Mediterranean (Lebanon)

**A single-file, offline tool for anthracological determination and analysis —
Eastern Mediterranean regional module (reference collection: Lebanon).**

AnthracoForm is a self-contained HTML application for recording, managing and
analysing wood-charcoal (anthracological) data. It runs entirely in the browser
with no installation and no internet connection required, and stores data in a
CSV format designed to be analysis-ready in R.

AnthracoForm has two regional modules, Saharo-Sindian (Sindh) and Eastern
Mediterranean (Lebanon), that run the same code:
their files differ only in the REGIONAL MODULE DATA block at the top of the HTML
(reference database, taxa dictionary and ecological categories, dichotomous key,
sources). This module is configured for the Eastern Mediterranean: reference database of 93
taxa (gymnosperms and angiosperms) and key to genera from Akkemik & Yaman (2012);
ecological categories maquis and pine woodland, deciduous woodland, mountain forest,
riverine and other. Taxon names follow Plants of the World Online (POWO 2026);
the names changed from the source are listed in the CHANGELOG.

Module names follow floristic regions (Loidi & Vynokurov 2024); the place in
brackets is where the reference collection was made. Until v0.4 this module was
called Lebanon.

## Features

- Charcoal fragment data entry with IAWA anatomical feature coding: hardwood list
  (IAWA Committee 1989) for angiosperms, softwood list (IAWA Committee 2004) for
  gymnosperms; each feature is recorded as absent (0), present (1), required present (2, present and diagnostic),
  required absent (3, absent and diagnostic) or not assessed (empty), as in the p/a/r/e searches of InsideWood
- Taphonomic alterations (among them xylophagous activity and fungal hyphae) and morphology
  (twig, pith, bark, reaction wood, measurable ring curvature) recorded for each fragment
- Help mode for new users: an explanation appears when the mouse rests on any element
  (can be switched off)
- Taxon determination with a customisable taxa dictionary (auto-fill of family and
  ecology)
- IAWA reverse lookup, dichotomous key and taxon comparison against the reference
  database of the module; the comparison also offers the provisional types of the open file
- Automatic saturation (taxon accumulation) curves per stratigraphic unit (SU), or per SU
  and context when the context is filled in, as in
  Kabukcu & Chabal (2021): indeterminate, *cf.* and "/" determinations stay out of the
  curves
- Saturation panel in the form: the curve of the current fragment drawn up to the next step,
  with taxa and fragments on the HF+LF and DS curves of the SU and on the HC curve of the site
  (steps at 100, 200, 250, 300 and 400 fragments)
- SU summary and whole-assemblage views, including the ecological composition
- Quick record lookup by SU or id_det, for editing existing records
- Photographs linked from a project photo folder (several per section; Chrome, Edge)
- A4 PDF reports of one record, of a taxon or of a provisional type, with all their photographs;
  export of publication-ready figures (B&W, 170 mm, 300 DPI)
- CSV import/export compatible with R workflows

The dichotomous key tab uses the key to genera of Akkemik & Yaman (2012, pp. 293–296), transcribed and
checked against the original pages.

## Usage

Open `AnthracoForm_Eastern-Mediterranean.html` in a modern browser (Chrome or Edge recommended,
for File System Access API support: the CSV file is written directly at each
save). No server, no dependencies, no internet connection
needed. In browsers without file access, open an existing file with Open CSV and save
it with Download CSV.

## How to cite

If you use AnthracoForm – Eastern Mediterranean (Lebanon) in your research, please cite it as:

> Minervini, I. (2026). *AnthracoForm – Eastern Mediterranean (Lebanon): Offline
> single-file tool for anthracological determination and analysis* (v0.7).
> Zenodo. https://doi.org/10.5281/zenodo.20487673

## Authors

Ignazio Minervini, CASEs Research Group (Culture, Archaeology and Socio-Ecological
Dynamics), Universitat Pompeu Fabra, Barcelona.

## AI Acknowledgement

AnthracoForm was developed with the assistance of Claude (Anthropic), an AI
assistant used throughout the design, coding, and testing of the tool. The
authors acknowledge the role of AI-assisted development in this work, in the
spirit of transparency encouraged by the scientific community.

## License

Released under the MIT License. See the [LICENSE](LICENSE) file for details.

The PDF record sheet uses html2canvas 1.4.1 (© Niklas von Hertzen) and jsPDF 2.5.1
(© James Hall, yWorks GmbH and contributors), both released under the MIT License
and embedded in the HTML file, so the tool never needs the internet.

## References

- Akkemik, Ü., and Yaman, B. (2012). *Wood Anatomy of Eastern Mediterranean Species*. Verlag Kessel.
  ISBN 978-3-941300-59-0.

- IAWA Committee (1989). IAWA list of microscopic features for hardwood
  identification. Wheeler, E.A., Baas, P., and Gasson, P.E. (eds.).
  *IAWA Bulletin*, 10(3), 219–332.

- IAWA Committee (2004). IAWA list of microscopic features for softwood
  identification. Richter, H.G., Grosser, D., Heinz, I., and Gasson, P.E. (eds.).
  *IAWA Journal*, 25(1), 1–70.

- Kabukcu, C., and Chabal, L. (2021). Sampling and quantitative analysis methods in
  anthracology from archaeological contexts: achievements and prospects. *Quaternary
  International*, 593–594, 6–18. https://doi.org/10.1016/j.quaint.2020.11.004

- Loidi, J., and Vynokurov, D. (2024). The biogeographical kingdoms and regions of
  the world. *Mediterranean Botany*, 45(2), e92333.
  https://doi.org/10.5209/mbot.92333

- POWO (2026). *Plants of the World Online*. Royal Botanic Gardens, Kew.
  https://powo.science.kew.org/ (accessed 19–20 October 2026).
