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

    ;; current stage is t0
    (at t0)

    ;; initial world at stage t0
    (on blue yellow)
    (on yellow red)
    (ontable red)
    (ontable orange)

    ;; clear predicates at t0
    (clear blue)
    (clear orange)

    ;; initially the single hand is empty
    (handempty worker)
  )

  ;; Goals are required to hold when the current stage reaches t8.
  (:goal (and
    (at t8)
    (on blue red)
    (on orange yellow)
  ))
)