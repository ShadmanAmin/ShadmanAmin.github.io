---
title: A LoRa/Starlink Field Observatory
subtitle: An autonomous telemetry network streaming met, soil moisture and sapflow data off a remote coastal preserve in near real time.
year: 2024
status: Deployed
featured: true
cover: /assets/img/covers/gatewaystarlink.jpg
thumb: /assets/img/cards/gatewaystarlink.jpg
role: Design, deployment and maintenance
stack: [LoRa, Starlink, MicroPython, ZephyrRTOS, Solar]
---

The Dangermond Preserve has no mains power and no cellular coverage worth the
name. Getting continuous data off a transect there means building the
infrastructure yourself.

This is that infrastructure: a network of meteorological stations, soil
moisture sensors and sapflow loggers distributed across the slope transect,
each reporting over LoRa to a gateway, which forwards to lab servers over
Starlink. Everything runs on solar.

<figure class="figure-wide">
  <img src="{{ '/assets/img/cards/solar.jpg' | relative_url }}" alt="Solar panel powering a field node" loading="lazy">
  <figcaption>Power budget: whatever the sun provides, minus what the fog takes back.</figcaption>
</figure>

## Design constraints

LoRa was the obvious choice for the sensor tier — long range, very low power,
and tolerant of the terrain between nodes. The trade is bandwidth, which means
every node has to be thoughtful about what it actually needs to transmit rather
than dumping raw samples upstream.

The harder constraints were environmental. Enclosures need to survive coastal
salt, summer heat and animals that regard a warm, dry box as an amenity. Power
budgets have to hold through a run of foggy days. And the whole system has to
degrade gracefully: a node that loses its uplink should keep logging locally
rather than losing the interval entirely.

<figure class="figure-wide">
  <img src="{{ '/assets/img/cards/soilmoisturesensor.jpg' | relative_url }}" alt="A soil moisture sensor installed in the field" loading="lazy">
  <figcaption>Soil moisture probe, installed and backfilled.</figcaption>
</figure>

## Maintenance is the project

The deployment is not the milestone; the uptime is. In practice that has meant
re-outfitting the site every few months against wildlife damage to protective
caging, replacing chewed cable runs, and occasionally carrying substantial
equipment in on foot when storm damage closes the access roads.

The network now underpins both my dissertation measurements and the
[live digital twin]({{ '/projects/dangermond-digital-twin/' | relative_url }})
of the transect.
