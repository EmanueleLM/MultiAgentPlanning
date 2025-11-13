(define (problem scenario_1)
  (:domain blocksworld)
  (:objects
    blue orange yellow red - block
  )
  (:init
    (clear blue)
    (clear orange)
    (handempty)
    (on orange yellow)
    (on yellow red)
    (ontable red)
    (ontable blue)
  )
  (:goal
    (and
      (on red orange)
      (on blue red)
      (on yellow blue)
    )
  )
)