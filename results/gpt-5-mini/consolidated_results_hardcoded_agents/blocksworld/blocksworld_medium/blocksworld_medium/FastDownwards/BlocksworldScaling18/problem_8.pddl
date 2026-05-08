(define (problem blocksworld-phased-problem)
  (:domain blocksworld-phased)
  (:objects
    worker - agent
    blue orange red yellow - block
    p1 p2 p3 p4 - phase
  )
  (:init
    ;; single agent hand initially empty
    (handempty worker)

    ;; initial stacking and table facts
    (on blue yellow)
    (on orange red)
    (on-table red)
    (on-table yellow)

    ;; clear top blocks
    (clear blue)
    (clear orange)

    ;; phase ordering and initial active phase (exactly one active phase at start)
    (phase-active p1)
    (next-phase p1 p2)
    (next-phase p2 p3)
    (next-phase p3 p4)

    ;; binding of required stackings to explicit phases:
    ;; blue onto red must occur in p1, yellow onto blue in p2, orange onto yellow in p3
    (requires-phase blue red p1)
    (requires-phase yellow blue p2)
    (requires-phase orange yellow p3)
  )
  (:goal
    (and
      (on orange yellow)
      (on yellow blue)
      (on blue red)
      (handempty worker)
    )
  )
)