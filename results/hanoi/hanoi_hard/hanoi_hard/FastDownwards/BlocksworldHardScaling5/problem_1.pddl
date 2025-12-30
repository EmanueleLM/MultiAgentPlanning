(define (problem BlocksworldHardScaling5)
  (:domain blocksworld)
  (:objects
    red blue yellow orange - block
  )
  (:init
    (handempty)
    (clear red)
    (clear orange)
    (on red blue)
    (on blue yellow)
    (ontable orange)
    (ontable yellow)
    (= (total-cost) 0)
  )
  (:goal (and
    (on blue yellow)
    (on orange red)
    (on yellow orange)
  ))
  (:metric minimize (total-cost))
)