---
title: A Modular UAS Datalogger
subtitle: Custom airborne instrumentation for atmospheric boundary layer profiling — wind, radiation, temperature, humidity and imagery on one payload.
year: 2025
status: In use
featured: true
cover: /assets/img/covers/droneflying1.jpg
thumb: /assets/img/cards/thermalcameradronefitting1.jpg
role: Hardware design, firmware, debugging
stack: [KiCAD, ZephyrRTOS, MicroPython, DJI M600 Pro]
---

Profiling the atmospheric boundary layer above a canopy requires measuring
several things at once, from a moving platform, with enough time resolution to
be useful. No off-the-shelf payload did what I needed, so this one is modular
by design: sensor boards can be swapped depending on the flight.

Current channels are wind speed and direction, shortwave and longwave
radiation, thermal and multispectral imagery, air temperature and relative
humidity.

<figure class="figure-wide">
  <img src="{{ '/assets/img/cards/thermalcameragimbalfitting.jpg' | relative_url }}" alt="Fitting a thermal camera to a drone gimbal" loading="lazy">
  <figcaption>Fitting the thermal camera to the gimbal — a surprisingly large fraction of the project.</figcaption>
</figure>

## The debugging story

Two problems dominated development, both on the temperature and relative
humidity breakout board.

The first was **variable gain offsets**: readings that were internally
consistent but drifted against reference in a way that depended on the
amplification stage rather than the sensor. The second was **voltage ripple**
riding on the supply rail, which showed up as noise that looked convincingly
like real atmospheric structure — the most dangerous kind of artefact, because
you can publish it.

Both were solved on the bench with a scope before they ever reached a flight
dataset. That sequence matters: an instrument you have not characterised is a
random number generator with a serial port.

<figure class="figure-wide">
  <img src="{{ '/assets/img/cards/pcbtroubleshooting.jpg' | relative_url }}" alt="Troubleshooting a custom PCB on the bench" loading="lazy">
  <figcaption>Bench work. This is where the ripple was found.</figcaption>
</figure>
