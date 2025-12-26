(define (problem blocksworld-scaling-12)
  (:domain blocksworld)
  (:objects
    red orange yellow blue - block
  )
  (:init
    ; Location
    (on yellow orange)
    (ontable red)
    (ontable blue)
    (ontable orange) ; Orange is on table, but blocked by Yellow

    ; Clear status (O is implicitly not clear)
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