(define (problem blocksworld-scaling-12)
  (:domain blocksworld)
  (:objects
    red orange yellow blue - block
  )
  (:init
    ; Initial Setup: yellow block is on top of the orange block.
    (on yellow orange)
    (ontable red)
    (ontable blue)
    (ontable orange)

    ; Clear status (orange is NOT clear)
    (clear red)
    (clear blue)
    (clear yellow)

    ; Hand status
    (hand-empty)

    ; Costs
    (= (total-cost) 0)
  )
  (:goal (and
    (on orange blue)
    (on yellow red)
  ))
  
  (:metric minimize (total-cost))
)