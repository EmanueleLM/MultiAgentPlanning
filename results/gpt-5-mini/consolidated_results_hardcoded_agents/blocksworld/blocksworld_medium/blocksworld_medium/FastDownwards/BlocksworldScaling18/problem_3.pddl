(define (problem blocksworld-phased-problem)
  (:domain blocksworld-phased)
  (:objects
    worker - agent
    blue orange red yellow - block
    p1 p2 p3 p4 - phase
  )
  (:init
    (handempty worker)

    (on blue yellow)
    (on orange red)
    (on-table red)
    (on-table yellow)

    (clear blue)
    (clear orange)

    (phase-active p1)
    (next-phase p1 p2)
    (next-phase p2 p3)
    (next-phase p3 p4)

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