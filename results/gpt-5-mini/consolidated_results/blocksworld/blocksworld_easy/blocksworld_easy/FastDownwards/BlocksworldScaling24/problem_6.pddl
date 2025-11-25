(define (problem stack_goal)
  (:domain one_hand_blocks)
  (:objects
    red yellow orange blue - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; stage ordering and initial stage (enforces strict stepwise progression)
    (at-stage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)

    ;; initial block configuration (as specified)
    (on red blue)        ; red is on top of blue
    (ontable blue)       ; blue is on the table
    (ontable orange)     ; orange is on the table
    (ontable yellow)     ; yellow is on the table

    ;; clear facts: red, orange and yellow are clear; blue is implicitly not clear (no clear fact)
    (clear red)
    (clear orange)
    (clear yellow)

    ;; single hand free at start
    (hand-free)

    ;; explicit different facts to prevent self-stacking (fully enumerated)
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