(define (problem BlocksworldHardScaling20)
  (:domain blocksworld)
  (:objects
    B R Y O - block
  )
  
  (:init
    ; Initial stacking: B on R, R on Y, Y on O, O on Table. (B -> R -> Y -> O -> Table)
    (on B R)
    (on R Y)
    (on Y O)
    (on-table O)
    
    ; Status
    (clear B) ; Blue block is clear
    (hand-empty)
  )
  
  (:goal
    (and
      (on R Y) ; Red block is on top of the Yellow block
      (on O B) ; Orange block is on top of the Blue block
    )
  )
)