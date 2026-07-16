# AnthracoForm

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20487673.svg)](https://doi.org/10.5281/zenodo.20487673)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**Offline, single-file tool for anthracological determination and analysis.**
No installation, no server: one HTML file that runs entirely in the browser and stores data as CSV on disk.

<!-- Add a screenshot here, e.g. the saturation curve or a coded record:
![AnthracoForm — saturation curve](docs/screenshot.png)
-->

## Features

- **Record coding** — sample metadata, taxonomic determination, IAWA descriptors (transverse / radial / tangential), taphonomy, ring curvature, vitrification, morphology (twig / bark).
- **Recovery channels** — every fragment is tagged with a recovery channel: `HF`, `LF`, `HC`, `DS`, `STR`, `C14`.
- **Saturation curve (HF + LF)** — per SU, cumulative taxa vs. fragment order, Chabal (1990) plateau rule. Anchored to HF + LF only; DS / STR / C14 never enter it.
- **TDC — Taxonomic Discovery Curve** — site-level, HC only, cumulative across SUs. A practical operator-recognition curve (not a statistical saturation test), with HC coverage per SU (target 20).
- **CDC — Conditional Discovery Curve** — DS per SU. Inherits the HF + LF taxa list of the same SU as a seed (counter reset); the line starts at the HF + LF plateau, with a dashed baseline. Falls back to a plain saturation curve when the SU has no HF + LF.
- **Export** — CSV (one row per fragment) and 170 mm / 300 DPI B&W PNG charts for print.
- **Fully offline** — no external dependencies, no network calls, no data leaves the machine.

## Requirements

Google **Chrome (v86+)** or another Chromium-based browser. AnthracoForm uses the **File System Access API** to read and write the CSV in a folder you choose; this API is currently Chromium-only.

## Usage

1. Open `AnthracoForm.html` in Chrome.
2. Click **Select folder** and pick the working folder for the project (the CSV is created/read there).
3. Code fragments one by one; use the **KEEP** locks to carry constant fields (site, SU, channel…) to the next record.
4. Open the curve views from the metadata bar: **📊** (SU summary, incl. the HF + LF saturation curve), **TDC**, **CDC**.

## Output (CSV)

One row per determined fragment. Columns include the sample metadata (`site_code`, `trench`, `su`, `layer`, `context`, `id_samp`, `id_det`…), the recovery **`channel`** (`HF` / `LF` / `HC` / `DS` / `STR` / `C14`), the size `fraction`, the taxonomic determination, one binary column per IAWA code (`iawa_*`), taphonomy and morphology flags, and the operator/date fields.

> **Note (column rename).** As of this version the recovery-channel column is named **`channel`** (previously `hflf`). CSVs exported by older versions are read back with backward compatibility: an `hflf` header is automatically mapped to `channel` on import. Downstream R / Python scripts that read the old `hflf` column should be updated to `channel`.

## Citation

If you use AnthracoForm in your research, please cite the specific version you used (each Zenodo release has its own version DOI). General/concept DOI (always resolves to the latest version):

> Minervini, I. *AnthracoForm* (software). Zenodo. https://doi.org/10.5281/zenodo.20487673

ORCID: [0009-0003-8064-1659](https://orcid.org/0009-0003-8064-1659)

## License

Released under the **MIT License** — see [LICENSE](LICENSE).
