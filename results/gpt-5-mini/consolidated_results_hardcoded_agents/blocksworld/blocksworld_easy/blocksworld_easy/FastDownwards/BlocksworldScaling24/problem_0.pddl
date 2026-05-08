(define (problem stack_goal)
  (:domain one_hand_blocks)
  (:objects
    red yellow orange blue - block
  )
  (:init
    ; initial: all blocks on the table and clear
    (ontable red)
    (clear red)
    (ontable yellow)
    (clear yellow)
    (ontable orange)
    (clear orange)
    (ontable blue)
    (clear blue)

    ; single-hand is free at start
    (hand-free)

    ; explicit distinctness facts to prevent self-stacking (ordered pairs for all distinct blocks)
    (different red yellow)
    (different red orange)
    (different red blue)
    (different yellow red)
    (different yellow orange)
    (different yellow blue)
    (different orange red)
    (different orange yellow)
    (different orange blue)
    (different blue red)
    (different blue yellow)
    (different blue orange)
  )
  (:goal (and
    (on red yellow)
    (on orange blue)
  ))
)