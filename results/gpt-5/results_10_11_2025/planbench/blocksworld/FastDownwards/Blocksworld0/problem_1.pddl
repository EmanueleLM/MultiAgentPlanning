(define (problem blocksworld-task1)
  (:domain blocksworld)
  (:objects red blue yellow orange - block)
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
      (on orange blue)
    )
  )
)