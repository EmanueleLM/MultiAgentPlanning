(define (problem blocks-problem-actor-plan)
  (:domain blocks-order-enforced)

  (:objects
    blue red orange yellow - block
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 - step
  )

  (:init
    ;; Physical arrangement: blue on yellow on red on orange on table
    (ontable orange)
    (on red orange)
    (on yellow red)
    (on blue yellow)

    ;; Only the top block is clear initially
    (clear blue)

    ;; Hand is initially empty and execution starts at step1
    (handempty)
    (at-step step1)

    ;; Explicit linear stage ordering; actions must advance this chain contiguously.
    (next step1 step2)
    (next step2 step3)
    (next step3 step4)
    (next step4 step5)
    (next step5 step6)
    (next step6 step7)
    (next step7 step8)
    (next step8 step9)
    (next step9 step10)
    (next step10 step11)

    ;; Pairwise distinctness facts to enforce inequality without using :equality
    (different blue red)
    (different blue orange)
    (different blue yellow)
    (different red blue)
    (different red orange)
    (different red yellow)
    (different orange blue)
    (different orange red)
    (different orange yellow)
    (different yellow blue)
    (different yellow red)
    (different yellow orange)
  )

  (:goal (and
    ;; Terminal configuration requirements as specified
    (on blue yellow)
    (on orange red)
    ;; Require that execution has reached the terminal stage exactly.
    (at-step step11)
  ))