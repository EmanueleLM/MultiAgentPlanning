(define (problem blocks-problem)
  (:domain blocks-picker)
  (:objects
    red blue yellow orange - block
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 - stage
  )
  (:init
    ;; Initial tower: yellow on red, red on blue, blue on orange, orange on table
    (on red blue)
    (on blue orange)
    (on yellow red)
    (ontable orange)

    ;; Top block is yellow
    (clear yellow)

    ;; Hand is initially empty
    (hand-empty)

    ;; Stage ordering (linear time steps). Actions must progress at-stage along succ links.
    (succ step0 step1)
    (succ step1 step2)
    (succ step2 step3)
    (succ step3 step4)
    (succ step4 step5)
    (succ step5 step6)
    (succ step6 step7)
    (succ step7 step8)
    (succ step8 step9)
    (succ step9 step10)

    ;; Start at stage step0
    (at-stage step0)
  )
  (:goal (and
    ;; Goal: red directly on orange, and yellow directly on blue
    (on red orange)
    (on yellow blue)
  ))
)