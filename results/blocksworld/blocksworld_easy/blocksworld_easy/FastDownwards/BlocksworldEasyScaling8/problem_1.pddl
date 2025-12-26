(define (problem blocksworld-easy-scaling-8-instance)
  (:domain blocksworld-easy-scaling)
  (:objects
    B - block ; Blue
    O - block ; Orange
    Y - block ; Yellow
    R - block ; Red
  )
  
  (:init
    (hand-empty)
    
    ; Initial Configuration: Y is on R. B and O are on the table.
    (on Y R)
    (ontable R)
    (ontable B)
    (ontable O)
    
    ; Clear Status: B, O, Y are clear. R is not clear.
    (clear B)
    (clear O)
    (clear Y)
    
    ; Cost initialization
    (= (total-cost) 0)
  )
  
  (:goal (and
    ; Goal: B/Y/R (Blue on Yellow, Yellow on Red)
    (on B Y)
    (on Y R)
  ))

  (:metric minimize (total-cost))
)