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
  - label: Open the live dashboard
    url: https://weather-dashboard-48ei.onrender.com/dashboard/
---

A telemetry network that nobody can monitor realtime is useless. This is the front end for the
[LoRa/Starlink observatory]({{ '/projects/lora-starlink-observatory/' | relative_url }}):
an interactive digital twin of the transect where each instrumented tree
appears at its real position with its current status.
** It is a project still in progress!**
I built both the backend that ingests and serves the incoming sensor
streams, and the frontend map and dashboard that render them.

<figure class="figure-wide">
  <img src="{{ '/assets/img/cards/3d-remodelling-tree.jpg' | relative_url }}" alt="A three-dimensional reconstruction of an individual tree canopy" loading="lazy">
  <figcaption>Individual canopy reconstruction — the geometry behind a point on the map.</figcaption>
</figure>

## Why do this?

There is no LTE network in the Dangermond Preserve. Other than outreach, the practical purpose is
to notice when a node stops reporting, the map shows it immediately, which
turns a silent multi-week data gap into a scheduled site visit. Given how far
the site is from campus, that has probably saved more data than any single
analysis decision we have made.

<p><a href="https://weather-dashboard-48ei.onrender.com/dashboard/" rel="noopener">View the live dashboard &rarr;</a></p>
