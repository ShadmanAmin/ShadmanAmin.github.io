#!/usr/bin/env bash
# Regenerate web-ready derivatives from the originals in _media_src/.
#
# Originals (some over 20 MB) live in _media_src/, which Jekyll excludes from
# the build. Only the outputs below are ever served.
#
#   assets/img/covers/  1900px wide  — full-bleed page headers
#   assets/img/cards/   1100px wide  — card thumbnails and in-body figures
#   assets/video/       720p h264    — plus a poster frame per clip
#
# Logos keep their original PNG/SVG form so transparency survives.
#
# Must run inside the pixi environment, which supplies magick and ffmpeg:
#   pixi run media
set -euo pipefail

SRC="_media_src"
COVERS="assets/img/covers"
CARDS="assets/img/cards"
VIDEO="assets/video"

mkdir -p "$COVERS" "$CARDS" "$VIDEO"

# Images that read well as a wide banner get a cover derivative too.
COVER_LIST="landscapeview1 landscapeview2 landscapeview3 sunrisearmycamp \
TNC18014_Dangermond-3554 fieldwork1 fieldwork2 fieldcourse1 fieldcourse2 \
metstation gatewaystarlink solar installing_sapflux1 droneflying1 \
droneteaching1 fieldcrew1 fieldcrew3 labworkleafwaterpotential \
hardwaretroubleshooting1 bleedingoak"

slug () { echo "$1" | tr '[:upper:]' '[:lower:]' | tr -c 'a-z0-9\n' '-' | sed 's/-\{2,\}/-/g; s/^-//; s/-$//'; }

# Logos are line art with transparency — never route them through the JPEG path.
is_logo () { case "$1" in *logo*) return 0 ;; *) return 1 ;; esac; }

echo "==> Cards (1100px)"
for f in "$SRC"/*.[jJ][pP][gG] "$SRC"/*.[jJ][pP][eE][gG] "$SRC"/*.[pP][nN][gG]; do
  [ -e "$f" ] || continue
  base="$(basename "$f")"; name="${base%.*}"
  is_logo "$name" && continue
  out="$CARDS/$(slug "$name").jpg"
  magick "$f" -auto-orient -resize '1100x1100>' -strip -interlace Plane \
         -sampling-factor 4:2:0 -quality 80 "$out"
done

echo "==> Covers (1900px)"
for name in $COVER_LIST; do
  f=$(ls "$SRC/$name".* 2>/dev/null | head -1) || true
  [ -n "${f:-}" ] && [ -e "$f" ] || { echo "   skip (missing): $name"; continue; }
  out="$COVERS/$(slug "$name").jpg"
  magick "$f" -auto-orient -resize '1900x1900>' -strip -interlace Plane \
         -sampling-factor 4:2:0 -quality 78 "$out"
done

echo "==> Portrait"
if [ -e "$SRC/personal_headshot.JPG" ]; then
  magick "$SRC/personal_headshot.JPG" -auto-orient -resize '800x800>' -strip \
         -quality 85 "$CARDS/personal-headshot.jpg"
fi

echo "==> Logos (kept lossless, transparency intact)"
for f in "$SRC"/*logo*.png "$SRC"/*logo*.svg; do
  [ -e "$f" ] || continue
  cp "$f" "assets/img/$(basename "$f")"
done

echo "==> Video (720p h264 + poster)"
for f in "$SRC"/*.[mM][pP]4; do
  [ -e "$f" ] || continue
  base="$(basename "$f")"; name="$(slug "${base%.*}")"
  ffmpeg -nostdin -loglevel error -y -i "$f" \
    -vf "scale='min(1280,iw)':-2" -c:v libx264 -preset slow -crf 28 \
    -profile:v high -pix_fmt yuv420p -movflags +faststart -an \
    "$VIDEO/$name.mp4"
  ffmpeg -nostdin -loglevel error -y -ss 00:00:01 -i "$f" -frames:v 1 \
    -vf "scale='min(1600,iw)':-2" -q:v 4 "$VIDEO/$name-poster.jpg"
done

echo "==> Done"
du -sh "$COVERS" "$CARDS" "$VIDEO"
