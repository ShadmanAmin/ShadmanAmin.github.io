---
title: "Seven Models, One Forcing Dataset"
description: Why assembling the inputs for an evapotranspiration model intercomparison turned out to be harder than running the models.
cover: /assets/img/covers/metstation.jpg
tags: [hpc, methods]
---

The plan was straightforward. Take seven evapotranspiration models — PT-JPL,
PT-JPL-SM, STIC, MOD16, TSEB, SSEBop, GeeSEBAL — run them against NEON tower
sites, and compare how each responds as land surface temperature is coarsened.
The models are all published. The tower data is all public. How hard could the
input assembly be?

Reader, it was the entire project for a while.

## Every model wants the same thing differently

Each of these models needs broadly the same meteorology: radiation, air
temperature, humidity, wind, and something about the surface. What differs is
units, temporal resolution, gap-filling expectations, variable naming, and —
most quietly damaging — which quality flags each one implicitly assumes have
already been applied.

Handling that by hand for a handful of sites is tedious. Handling it for enough
sites and periods to say something general is not a data-wrangling task, it is
a small software project with a correctness requirement.

## Why it had to be staged

The first version was a single script. It worked, right up until a download
failed forty minutes in and took the whole run with it.

The rewrite — `slurm_metforcing_download` — is multi-stage and checkpointed at
every boundary. Retrieval, quality control and bundle assembly are separate,
and each writes its output before the next begins. A failure now costs one
stage. That sounds like an obvious design, and it is, but it only became
obvious after the third time I babysat a run.

Running on SLURM adds its own constraint: your job has a wall clock, and a
stage that cannot resume is a stage that must fit inside it. Checkpointing is
not just resilience, it is what lets the pipeline scale past a single
allocation.

## The lesson I keep relearning

The interesting scientific question here is about scale and thermal variance.
Almost none of my time went there. It went into making sure that when the seven
models disagree, the disagreement is about the models and not about which of
them silently received wind speed in the wrong units.

Intercomparison studies live or die on that guarantee. It is unglamorous
infrastructure work, and it is the part of the study I would defend hardest.
