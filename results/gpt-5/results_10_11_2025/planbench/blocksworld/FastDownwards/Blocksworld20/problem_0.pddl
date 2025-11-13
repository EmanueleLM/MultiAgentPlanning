(define (problem scenario_1)
  (:domain blocks)
  (:objects
    blue yellow red orange - block
  )
  (:init
    (clear blue)
    (clear yellow)
    (handempty)
    (on red orange)
    (on yellow red)
    (ontable blue)
    (ontable orange)
  )
  (:goal
    (and
      (on red orange)
      (on blue yellow)
      (on yellow red)
    )
  )
)