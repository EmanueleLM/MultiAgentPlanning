(define (problem orchestrated_blocks_time_problem)
  (:domain orchestrated_blocks_time)

  (:objects
    worker - agent
    blue orange yellow red - block
    t0 t1 t2 t3 t4 t5 t6 t7 t8 - time
  )

  (:init
    (next t0 t1)
    (next t1 t2)
    (next t2 t3)
    (next t3 t4)
    (next t4 t5)
    (next t5 t6)
    (next t6 t7)
    (next t7 t8)

    (at t0)

    (on blue yellow)
    (on yellow red)
    (ontable red)
    (ontable orange)

    (clear blue)
    (clear orange)

    (handempty worker)
  )

  (:goal (and
    (at t8)
    (on blue red)
    (on orange yellow)
  ))
)