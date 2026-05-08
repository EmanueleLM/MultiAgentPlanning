(define (problem blocks-problem)
  (:domain blocksworld-multiagent)
  (:objects
    red blue yellow orange - block
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 - stage
  )
  (:init
    ;; Initial stacking: yellow on red, red on blue, blue on orange, orange on the table
    (on red blue)
    (on blue orange)
    (on yellow red)
    (ontable orange)

    ;; Only the top block is clear initially
    (clear yellow)

    ;; Hand initially empty
    (hand-empty)

    ;; Discrete linear stage progression (contiguous)
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

    ;; Start at the first stage
    (at-stage step0)
  )
  (:goal (and
    (on red orange)
    (on yellow blue)
  ))
)