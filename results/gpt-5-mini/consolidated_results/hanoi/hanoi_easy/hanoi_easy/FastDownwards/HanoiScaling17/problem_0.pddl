(define (problem hanoi-4-problem)
  (:domain hanoi-4-domain)
  (:objects
    d1 d2 d3 d4 - disk
    pegA pegB pegC - peg
  )
  (:init
    ;; initial all disks on pegA
    (disk-on-peg d1 pegA)
    (disk-on-peg d2 pegA)
    (disk-on-peg d3 pegA)
    (disk-on-peg d4 pegA)

    ;; stacking relations on pegA: d1 top, then d2, d3, d4 bottom
    (top-of-peg d1 pegA)
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-disk d3 d4)

    ;; no-under facts: only the bottom disk has no-under initially
    (no-under d4)
    ;; other disks have under-disks so no no-under facts for them

    ;; peg emptiness
    (peg-empty pegB)
    (peg-empty pegC)

    ;; size ordering: d1 < d2 < d3 < d4
    (smaller-than d1 d2) (smaller-than d1 d3) (smaller-than d1 d4)
    (smaller-than d2 d3) (smaller-than d2 d4)
    (smaller-than d3 d4)
  )
  (:goal (and
    ;; all disks must be on pegC in the correct stack order
    (disk-on-peg d1 pegC)
    (disk-on-peg d2 pegC)
    (disk-on-peg d3 pegC)
    (disk-on-peg d4 pegC)

    ;; stacking relations on pegC: d1 top, then d2,d3,d4
    (top-of-peg d1 pegC)
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-disk d3 d4)

    ;; other pegs must be empty at goal
    (peg-empty pegA)
    (peg-empty pegB)
  ))
)