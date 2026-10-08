# AnthracoForm — Lebanon

**A single-file, offline tool for anthracological determination and analysis —
Lebanon/Levant regional module.**

AnthracoForm is a self-contained HTML application for recording, managing and
analysing wood-charcoal (anthracological) data. It runs entirely in the browser
with no installation and no internet connection required, and stores data in a
CSV format designed to be analysis-ready in R.

AnthracoForm has two regional modules, Sindh and Lebanon, that run the same code:
their files differ only in the REGIONAL MODULE DATA block at the top of the HTML
(reference database, taxa dictionary and ecological categories, dichotomous key,
sources). This module is configured for Lebanon/Levant: reference database of 93
taxa (gymnosperms and angiosperms) and key to genera from Akkemik & Yaman (2012);
ecological categories maquis and pine woodland, deciduous woodland, mountain forest,
riverine and other.

## Features

- Charcoal fragment data entry with IAWA anatomical feature coding: hardwood list
  (IAWA Committee 1989) for angiosperms, softwood list (IAWA Committee 2004) for
  gymnosperms
- Taxon determination with a customisable taxa dictionary (auto-fill of family and
  ecology)
- IAWA reverse lookup, dichotomous key and taxon comparison against the reference
  database of the module
- Automatic saturation (species-accumulation) curves per stratigraphic unit (SU),
  with a Chabal (1990) stop criterion; *cf.* determinations do not add taxa to the
  curves
- SU summary and whole-assemblage views, including the ecological composition
- Quick record lookup by SU or id_det, for editing existing records
- PDF record sheet; export of publication-ready figures (B&W, 170 mm, 300 DPI)
- CSV import/export compatible with R workflows

The dichotomous key tab uses the key to genera of Akkemik & Yaman (2012, pp. 293–296), transcribed; two passages
(Picea/Pinus block; couplets 15–16 of section C) are flagged in the tab and still to be checked against the original.

## Usage

Open `AnthracoForm_Lebanon_<date>.html` in a modern browser (Chrome recommended, for
File System Access API support). No server, no dependencies, no internet connection
needed.

## How to cite

If you use AnthracoForm — Lebanon in your research, please cite it as:

> Minervini, I. (2026). *AnthracoForm — Lebanon: Offline single-file tool for
> anthracological determination and analysis, Lebanon/Levant module* (v0.4).
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

- Allué, E., Euba Rementeria, I., and Solé, A. (2009). Charcoal taphonomy: the
  study of the cell structure and surface deformations of *Pinus sylvestris* type
  for the understanding of formation processes of archaeological charcoal
  assemblages. *Journal of Taphonomy*, 7(2–3), 57–72.

- Chabal, L. (1990). L'étude paléo-écologique de sites protohistoriques à partir
  des charbons de bois : la question de l'unité de mesure. *Bulletin de la Société
  Botanique de France — Actualités Botaniques*, 137(2), 117–129.

- IAWA Committee (2004). IAWA list of microscopic features for softwood
  identification. Richter, H.G., Grosser, D., Heinz, I., and Gasson, P.E. (eds.).
  *IAWA Journal*, 25(1), 1–70.

- Ruiz-Giralt, A., Bouchaud, C., Salavert, A., Lancelotti, C., and D'Andrea, A.C.
  (2021). Human-woodland interactions during the Pre-Aksumite and Aksumite periods
  in northeastern Tigray, Ethiopia: insights from the wood charcoal analyses from
  Mezber and Ona Adi. *Vegetation History and Archaeobotany*, 30(6), 713–728.
  https://doi.org/10.1007/s00334-021-00825-2

- Wheeler, E.A., Baas, P., and Gasson, P.E. (eds.) (1989). IAWA list of
  microscopic features for hardwood identification. *IAWA Bulletin*, 10(3),
  219–332.
