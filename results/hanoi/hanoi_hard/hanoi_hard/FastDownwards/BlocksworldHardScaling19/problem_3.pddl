(define (problem BlocksworldHardScaling19)
  (:domain blocksworld)
  (:objects
    B - block ; Blue
    Y - block ; Yellow
    O - block ; Orange
    R - block ; Red
  )
  (:init
    (handempty)
    
    ; Initial stack: B on O, O on R, R on table.
    (on B O)
    (on O R)
    (ontable R)
    
    ; Block Y is on the table
    (ontable Y)
    
    ; Clearance conditions
    (clear B)
    (clear Y)
  )
  (:goal (and
    ; Target stack: Y on O, O on R, R on B. B must be on the table.
    (ontable B)
    (on R B)
    (on O R)
    (on Y O)
  ))
)