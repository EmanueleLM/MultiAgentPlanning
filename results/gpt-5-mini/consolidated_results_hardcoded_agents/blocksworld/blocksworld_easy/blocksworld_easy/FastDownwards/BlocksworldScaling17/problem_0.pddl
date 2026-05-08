(define (problem stack-red-yellow-orange)
  (:domain blocks-order)
  (:objects
    red yellow orange - block
  )
  (:init
    ;; initial positions: all blocks on the table and clear
    (ontable red)
    (ontable yellow)
    (ontable orange)
    (clear red)
    (clear yellow)
    (clear orange)
    (handempty)
    ;; red_on_yellow_done is intentionally absent (false) initially
  )
  (:goal
    (and
      (on red yellow)
      (on orange red)
    )
  )
)