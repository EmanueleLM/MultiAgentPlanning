(define (problem scenario_2)
  (:domain blocksworld20)
  (:objects
    blue yellow red orange - block
  )
  (:init
    (clear blue)
    (clear yellow)
    (handempty)
    (on orange red)
    (on yellow orange)
    (ontable red)
    (ontable blue)
  )
  (:goal
    (and
      (on blue orange)
      (on yellow red)
    )
  )
)