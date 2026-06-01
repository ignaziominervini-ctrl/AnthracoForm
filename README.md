# AnthracoForm

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20487674.svg)](https://doi.org/10.5281/zenodo.20487674)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

**A single-file, offline tool for anthracological determination and analysis.**

AnthracoForm is a self-contained HTML application for recording, managing and
analysing wood-charcoal (anthracological) data. It runs entirely in the browser
with no installation and no internet connection required, and stores data in a
CSV format designed to be analysis-ready in R.

## Features

- Charcoal fragment data entry with IAWA anatomical feature coding
- Taxon determination with a customisable taxa dictionary
- Automatic saturation (species-accumulation) curves per stratigraphic unit (SU),
  with a Chabal (1990) stop criterion
- SU summary and whole-assemblage views
- Offline taxon comparison tool based on published IAWA reference data
- Export of publication-ready figures (B&W, 170 mm, 300 DPI)
- CSV import/export compatible with R workflows

## Usage

Open `AnthracoForm.html` in a modern browser (Chrome recommended, for File System
Access API support). No server, no dependencies, no internet connection needed.

## How to cite

If you use AnthracoForm in your research, please cite it as:

> Minervini, I. (2026). *AnthracoForm: Offline single-file tool for anthracological
> determination and analysis* (v1.0). Zenodo.
> https://doi.org/10.5281/zenodo.20487674

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

## References

- Chabal, L. (1990). L'étude paléo-écologique de sites protohistoriques à partir
  des charbons de bois : la question de l'unité de mesure.
- Wheeler, E.A., Baas, P., Gasson, P.E. (1989). IAWA list of microscopic features
  for hardwood identification.
- Lancelotti, C. (2018). [IAWA reference dataset used in the comparison tool.]
