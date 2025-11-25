(define (problem blue-on-red-problem)
  (:domain block-world)
  (:objects
    red blue yellow orange - block
  )
  (:init
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (ontable orange)
    (clear red)
    (handempty)
  )
  (:goal
    (on blue red)
  )
)