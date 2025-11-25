(define (problem orchestrated_blocks_time_problem)
  (:domain orchestrated_blocks_time)

  (:objects
    worker - agent
    blue orange yellow red - block
    t0 t1 t2 t3 t4 t5 t6 t7 t8 - time
  )

  (:init
    ;; time ordering (discrete stages). Plan must progress along these successors.
    (next t0 t1)
    (next t1 t2)
    (next t2 t3)
    (next t3 t4)
    (next t4 t5)
    (next t5 t6)
    (next t6 t7)
    (next t7 t8)

    ;; initial world at time t0
    (on blue yellow t0)
    (on yellow red t0)
    (ontable red t0)
    (ontable orange t0)

    ;; clear predicates at t0 (blue and orange specified clear)
    (clear blue t0)
    (clear orange t0)

    ;; initially the single hand is empty at t0
    (handempty worker t0)
  )

  ;; Goals are required to hold at the terminal stage t8.
  (:goal (and
    (on blue red t8)
    (on orange yellow t8)
  ))
)