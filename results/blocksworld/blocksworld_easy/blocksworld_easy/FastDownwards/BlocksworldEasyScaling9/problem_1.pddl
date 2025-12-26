(define (problem BlocksworldEasyScaling9)
  (:domain blocksworld)
  (:objects
    R O Y B - block
  )
  (:init
    (handempty)
    (clear R)
    (clear O)
    (on R Y)
    (on Y B)
    (ontable B)
    (ontable O)
    (= (total-cost) 0)
  )
  (:goal
    (on R O)
  )
  (:metric minimize (total-cost))
)