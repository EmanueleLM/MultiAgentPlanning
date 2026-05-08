(define (problem hanoi-6-orchestrated)
  (:domain tower-of-hanoi-orchestrated)

  (:objects
    ;; disks: a = smallest (A), b = B, c = C, d = D, e = E, f = largest (F)
    a b c d e f - disk

    ;; pegs
    left mid right - peg

    ;; slots: top = 1, bottom = 6 for each peg
    l1 l2 l3 l4 l5 l6
    m1 m2 m3 m4 m5 m6
    r1 r2 r3 r4 r5 r6 - slot
  )

  (:init
    ;; typing (redundant but explicit)
    (disk a) (disk b) (disk c) (disk d) (disk e) (disk f)
    (peg left) (peg mid) (peg right)

    ;; slot-of relations
    (slot-of l1 left) (slot-of l2 left) (slot-of l3 left) (slot-of l4 left) (slot-of l5 left) (slot-of l6 left)
    (slot-of m1 mid)  (slot-of m2 mid)  (slot-of m3 mid)  (slot-of m4 mid)  (slot-of m5 mid)  (slot-of m6 mid)
    (slot-of r1 right) (slot-of r2 right) (slot-of r3 right) (slot-of r4 right) (slot-of r5 right) (slot-of r6 right)

    ;; above relations (immediate above -> below)
    (above l1 l2) (above l2 l3) (above l3 l4) (above l4 l5) (above l5 l6)
    (above m1 m2) (above m2 m3) (above m3 m4) (above m4 m5) (above m5 m6)
    (above r1 r2) (above r2 r3) (above r3 r4) (above r4 r5) (above r5 r6)

    ;; bottom-slot-of relations
    (bottom-slot-of l6 left) (bottom-slot-of m6 mid) (bottom-slot-of r6 right)

    ;; Initial occupancy: ALL disks start stacked on the right peg, topmost a down to bottom f.
    ;; Stack (from top to bottom): a, b, c, d, e, f on r1..r6 respectively.
    (in a r1) (occupied r1)
    (in b r2) (occupied r2)
    (in c r3) (occupied r3)
    (in d r4) (occupied r4)
    (in e r5) (occupied r5)
    (in f r6) (occupied r6)

    ;; The topmost occupied slot on the right peg is r1 initially
    (top-occupied r1)

    ;; Left and Mid pegs are empty initially
    (peg-empty left)
    (peg-empty mid)

    ;; Right peg is not empty (peg-empty right absent)
    ;; Explicitly ensure consistency: slots on left and mid are unoccupied (no (occupied ...)).

    ;; Disk size ordering (strict): a < b < c < d < e < f
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)
  )

  (:goal (and
    ;; Final required terminal conditions: left peg holds a..f in correct order (a topmost, f bottom)
    (in a l1)
    (in b l2)
    (in c l3)
    (in d l4)
    (in e l5)
    (in f l6)

    ;; left peg top occupied should be l1
    (top-occupied l1)

    ;; middle and right pegs empty
    (peg-empty mid)
    (peg-empty right)
  ))