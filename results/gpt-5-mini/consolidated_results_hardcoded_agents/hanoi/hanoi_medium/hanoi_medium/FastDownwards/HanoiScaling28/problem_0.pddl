(define (problem hanoi-3-multiagent)
  (:domain hanoi-multiagent)

  (:objects
    ;; disks (names indicate size: d1 smallest, d3 largest)
    d1 d2 d3

    ;; pegs
    pegA pegB pegC

    ;; numbered step objects (7 moves required for 3 disks)
    s1 s2 s3 s4 s5 s6 s7
  )

  (:init
    ;; Initial tower configuration (all disks on pegA: d3 bottom on pegA, d2 on d3, d1 on d2)
    (on d3 pegA)
    (on d2 d3)
    (on d1 d2)

    ;; Clearness: only topmost disk and empty pegs are clear
    (clear d1)
    (not (clear d2))
    (not (clear d3))
    (not (clear pegA))
    (clear pegB)
    (clear pegC)

    ;; Disk size ordering (hard constraints)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d2 d3)

    ;; Step sequencing
    (step-next s1 s2)
    (step-next s2 s3)
    (step-next s3 s4)
    (step-next s4 s5)
    (step-next s5 s6)
    (step-next s6 s7)

    ;; Mark final step
    (final-step s7)

    ;; Start at first step: operator must act first
    (awaiting-operator s1)

    ;; All other awaiting flags are false by default (not listed)

    ;; Utility: declare distinctness facts among places (pegs and disks) to forbid no-op moves
    ;; Forbid moves where from == to by asserting (different x y) for all ordered pairs of distinct place objects.
    ;; Places here are: d1 d2 d3 pegA pegB pegC
    ;; d1 distinct to others
    (different d1 d2) (different d2 d1)
    (different d1 d3) (different d3 d1)
    (different d1 pegA) (different pegA d1)
    (different d1 pegB) (different pegB d1)
    (different d1 pegC) (different pegC d1)

    ;; d2 distinct pairs
    (different d2 d3) (different d3 d2)
    (different d2 pegA) (different pegA d2)
    (different d2 pegB) (different pegB d2)
    (different d2 pegC) (different pegC d2)

    ;; d3 distinct pairs with pegs
    (different d3 pegA) (different pegA d3)
    (different d3 pegB) (different pegB d3)
    (different d3 pegC) (different pegC d3)

    ;; pegs pairwise distinct
    (different pegA pegB) (different pegB pegA)
    (different pegA pegC) (different pegC pegA)
    (different pegB pegC) (different pegC pegB)
  )

  (:goal
    (and
      ;; Final tower must be entirely on pegC with correct stacking (d3 bottom, then d2, then d1)
      (on d3 pegC)
      (on d2 d3)
      (on d1 d2)
      ;; And the process must have completed (observer recorded final step)
      (finished)
    )
  )
)