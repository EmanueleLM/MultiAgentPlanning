(define (problem blocksworld-4blocks-4)
  (:domain blocksworld)
  (:objects
    R O Y B - block
  )
  
  (:init
    (handempty)
    
    ; Initial State Configuration: (R on Y, Y on Table), (O on B, B on Table)
    (on R Y)
    (on O B)
    (ontable Y)
    (ontable B)
    
    ; Clear status
    (clear R)
    (clear O)
    
    (= (total-cost) 0)
  )
  
  (:goal (and
    ; Red on Yellow
    (on R Y)
    ; Yellow on Orange
    (on Y O)
  ))
  
  (:metric minimize (total-cost))
)