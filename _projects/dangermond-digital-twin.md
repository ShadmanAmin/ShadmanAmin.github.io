---
title: Dangermond Digital Twin
subtitle: A full-stack, real-time web map of the field transect showing the live status of individual trees.
year: 2025
status: Live
featured: true
cover: /assets/img/covers/landscapeview1.jpg
thumb: /assets/img/cards/layout-armycamp.jpg
role: Full-stack development (backend and frontend)
stack: [Python, JavaScript, Web mapping]
links:
  - label: Open the live map
    url: https://dangermond-map.onrender.com/
---

A telemetry network that nobody can see the output of is a telemetry network
that quietly fails. This is the front end for the
[LoRa/Starlink observatory]({{ '/projects/lora-starlink-observatory/' | relative_url }}):
an interactive digital twin of the transect where each instrumented tree
appears at its real position with its current status.

I built both halves — the backend that ingests and serves the incoming sensor
streams, and the frontend map and dashboard that render them.

<figure class="figure-wide">
  <img src="{{ '/assets/img/cards/3d-remodelling-tree.jpg' | relative_url }}" alt="A three-dimensional reconstruction of an individual tree canopy" loading="lazy">
  <figcaption>Individual canopy reconstruction — the geometry behind a point on the map.</figcaption>
</figure>

## Why it earns its keep

The obvious use is outreach, and it does that well. The unglamorous use is
operational: when a node stops reporting, the map shows it immediately, which
turns a silent multi-week data gap into a scheduled site visit. Given how far
the site is from campus, that has probably saved more data than any single
analysis decision I have made.

<p><a href="https://dangermond-map.onrender.com/" rel="noopener">View the live map &rarr;</a></p>
