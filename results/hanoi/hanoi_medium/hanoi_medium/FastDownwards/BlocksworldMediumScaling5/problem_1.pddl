(define (problem BlocksworldMediumScaling5-P1)
  (:domain blocksworld)
  (:objects
    Orange Red Yellow Blue - block
  )
  (:init
    (hand-empty)
    
    ; Stack configuration: Orange on Red on Yellow on Blue on Table
    (on-table Blue)
    (on Yellow Blue)
    (on Red Yellow)
    (on Orange Red)
    
    ; Clear status
    (clear Orange)
    
    (= (total-cost) 0)
  )
  (:goal
    (and
      (on Yellow Orange)
    )
  )
  (:metric minimize (total-cost))
)