---
title: UCSB.sapflow v1.5
subtitle: Custom sapflow sensor hardware — a Beslity et al. (2022) Js⁵ derivative, built because commercial units cost more than the budget allowed.
year: 2024
status: In use
featured: true
cover: /assets/img/covers/installing-sapflux1.jpg
thumb: /assets/img/cards/sapflux1.jpg
role: Hardware design, firmware, calibration
stack: [KiCAD, Arduino, MicroPython, Sensor calibration]
---

Sapflow sensors measure transpiration directly, by tracking how heat moves
through the sapwood of a stem. Commercial units are excellent and priced
accordingly — instrumenting a full transect with them was never going to
happen on a graduate budget.

UCSB.sapflow v1.5 is our in-house alternative: a derivative of the Beslity et
al. (2022) Js⁵ design, adapted for the enclosure, power and telemetry
constraints of the Dangermond deployment.

<figure class="figure-wide">
  <img src="{{ '/assets/img/cards/installing-sapflux2.jpg' | relative_url }}" alt="Installing a sapflow sensor into the sapwood of an oak" loading="lazy">
  <figcaption>Installation. The sensor has to sit in the sapwood, not the heartwood, and the tree gets a vote.</figcaption>
</figure>

## What the work actually involved

Adapting a published design is less about the schematic and more about
everything around it: matching the probe geometry to the species, getting a
thermal reference that stays stable through a coastal diurnal cycle, and
calibrating against pressure chamber measurements taken on the same trees.

Sensors that report plausible numbers and sensors that report correct numbers
look identical until you check. Most of the effort here went into checking.
