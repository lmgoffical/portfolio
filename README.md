# LMG Builds

Apps, websites and games I make vibe coding. Live at https://lmgoffical.github.io/portfolio/

The page is one file, `index.html`. A 3D scene (three.js, in `vendor/`) sits behind it and the camera
flies down a corridor as you scroll, stopping at one floating screen per project. Each stop has its own
colour, scenery and a small looping demo. Without WebGL, or with reduced motion turned on, the same page
shows as flat cards.

Extras: a 15 second aim warm-up in the hero, sound (off until you turn it on), and RGB mode, which
unlocks after 25 target hits.

## Data

- The request form saves to the `build_requests` table in Supabase.
- "On the bench right now" shows only the type and status of recent requests. It needs the
  `public_board` function: run `supabase/public_board.sql` once in the Supabase SQL editor. Until then
  the strip stays hidden.
- The "Updated … · downloads" line on each card comes from the public GitHub API and is cached for an hour.
