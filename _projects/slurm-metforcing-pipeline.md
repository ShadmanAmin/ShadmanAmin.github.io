---
title: slurm_metforcing_download
subtitle: A multi-stage HPC pipeline that assembles meteorological forcing bundles for cross-validating seven evapotranspiration models.
year: 2025
status: Maintained
cover: /assets/img/covers/hardwaretroubleshooting1.jpg
thumb: /assets/img/cards/uav-specs.jpg
role: Author and maintainer
stack: [Python, SLURM, HPC, NEON]
---

Running seven evapotranspiration models against NEON tower sites means feeding
each of them meteorological forcing data in the shape it expects, for every
site and every period of interest. Done by hand, this is a week of tedium and a
reliable source of silent errors.

`slurm_metforcing_download` is the multi-stage pipeline that replaced that
process. It runs on UCSB's GRIT cluster, handles retrieval, quality control and
assembly of the forcing bundles, and produces inputs for **PT-JPL**,
**PT-JPL-SM**, **STIC**, **MOD16**, **TSEB**, **SSEBop** and **GeeSEBAL**.

Staging matters here more than raw speed. Downloads fail, sites have gaps, and
a pipeline that cannot resume from the middle is a pipeline you will end up
babysitting. Each stage checkpoints so a failure costs one stage rather than
the whole run.

A side effect of spending this much time inside SLURM is that I have become many of my
peers informal first stop for HPC troubleshooting and workflow
questions. This is a role that truly makes me think coming to grad school was worth it, and one I enjoy more than any
scientific analysis.
