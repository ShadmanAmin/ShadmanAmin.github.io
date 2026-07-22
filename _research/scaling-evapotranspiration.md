---
title: Scaling Evapotranspiration Across Thermal Scales
subtitle: How much of the variability in dryland ET disappears when you coarsen land surface temperature — and which of seven ET models notice.
year: 2025
status: Ongoing
featured: true
cover: /assets/img/covers/labworkleafwaterpotential.jpg
thumb: /assets/img/cards/3d-remodelling-tree.jpg
role: Lead author (poster), co-author (EGU oral)
stack: [Python, SLURM, NEON, Google Earth Engine]
---

Evapotranspiration is the largest terrestrial water flux after precipitation,
and we mostly estimate it from land surface temperature observed at whatever
resolution the satellite happens to offer. In drylands, where a single pixel
can contain both a transpiring canopy and bare soil at forty degrees, that
choice is not innocent.

This strand of my work asks how the variance in land surface temperature
propagates into ET estimates as you move across scales — from centimetre-scale
UAS thermal imagery up to the kilometre-scale pixels most models are actually
run on.

## Computer Vision in remote sensing

My primary hypothesis lies in using different convolusion filters (e.g. a wavelet decomposition)
across different resolutions to narrow down the spatial patterns, clusters, components, and configurations
of an ecosystem that affect the landscape heterogeneity. By inferring the ecosystem processes underlying these
convolusion patterns and remote sensing products, we can inch closer to a mechanistic understanding of
what natural processes and feedbacks affect the uncertainty in our evapotranspiration estimation across scales.

## Model intercomparison

To test this properly, seven ET models are cross-validated against NEON tower
sites: **PT-JPL**, **PT-JPL-SM**, **STIC**, **MOD16**, **TSEB**, **SSEBop** and
**GeeSEBAL**. Each makes different assumptions about how surface temperature
relates to water stress, so each degrades differently as resolution coarsens.

Assembling the meteorological forcing data for that comparison turned into a
project in its own right — see
[the forcing pipeline]({{ '/projects/slurm-metforcing-pipeline/' | relative_url }}).

## Where it has been presented

- Caylor, K., **Amin, S.**, Morgan, B., Trugman, A. (2025). *Capturing
  Fine-Scale Variability in Dryland Evapotranspiration Through Multi-Scale
  Thermal Image Analysis.* EGU General Assembly, Vienna. EGU25-16088.
- **Amin, S.**, Morgan, B.E., Trugman, A.T., Caylor, K.K. (2024). *Scaling
  Evapotranspiration: Impact of Land Surface Temperature Variance Across
  Ecosystems.* AGU Fall Meeting, Washington, D.C. H33I-1037.
