(define (problem blocksworld-scenario-1)
  (:domain blocksworld)
  (:objects
    red blue yellow orange - block
  )
  (:init
    (clear red)
    (clear blue)
    (clear yellow)
    (handempty)
    (on blue orange)
    (ontable red)
    (ontable orange)
    (ontable yellow)
  )
  (:goal
    (and
      (on red blue)
      (on blue yellow)
      (on yellow orange)
    )
  )
)