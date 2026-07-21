---
title: "What the Wildlife Taught Me About Enclosure Design"
description: A field note on the gap between a system that works and a system that keeps working, written mostly while replacing cable.
cover: /assets/img/covers/bleedingoak.jpg
tags: [fieldwork, hardware]
---

There is a version of environmental sensing that exists in the methods section,
where instruments are *deployed* and data is *collected*. Then there is the
version where you drive two hours, hike the last stretch because the road has
become a creek, and find that something with teeth has spent the winter
redesigning your wiring harness.

I have now replaced enough cable at the Dangermond Preserve to have opinions.

## The failure is never the sensor

In three field seasons, I do not think a single sapflow probe has failed on its
own terms. What fails is everything around it: the cable run, the connector,
the enclosure seal, the strain relief, the mounting that was fine until the
branch it was attached to moved four centimetres.

This is not a complaint about the design of sensors. It is an observation that
the thing you spend your time designing and the thing that determines your
uptime are usually different objects.

<figure class="figure-wide">
  <img src="{{ '/assets/img/cards/chewedcable.jpg' | relative_url }}" alt="Cable insulation stripped away by an animal" loading="lazy">
  <figcaption>Exhibit A.</figcaption>
</figure>

## What I do differently now

A few things that have survived contact with reality:

- **Assume the cable is the weak point, and make it replaceable in the field.**
  A connectorised run that a cold, tired person can swap in ten minutes beats
  an elegant sealed one that requires a bench.
- **Armour the runs that touch the ground.** Conduit is heavy to carry in and
  cheaper than a lost month.
- **Log locally, always.** A node that keeps writing to its own storage when
  the uplink drops turns a data loss into a data delay. This one change has
  recovered more of my dataset than any other.
- **Design the enclosure as habitat.** Not to keep animals out — you will lose
  that fight — but so that when something moves in, it cannot reach anything
  load-bearing.

## The part I did not expect

The maintenance cycle changed how I read my own data. When you personally
replaced the connector on node four in March, you look at the March
discontinuity in node four differently than if you had inherited the time
series as a CSV.

I would not describe hiking a battery bank up a hill as a *research method*.
But knowing exactly which of my measurements I trust, and why, comes almost
entirely from having been the one standing there when it broke.
