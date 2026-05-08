(define (problem BlocksworldScaling6-problem)
  (:domain BlocksworldScaling6)
  (:objects
    red blue yellow orange - block
  )
  (:init
    (ontable red)
    (ontable orange)
    (on blue yellow)
    (on yellow orange)
    (clear red)
    (clear blue)
    (handempty)
  )
  (:goal
    (and
      (on blue red)
      (on orange blue)
    )
  )
)