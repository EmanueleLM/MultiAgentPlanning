(define (problem blocks-problem-actor-plan)
  (:domain blocks-order-enforced)

  ;;; Steps are explicit discrete stages. The planner must progress the unique at-step
  ;;; predicate along the next chain; this enforces contiguous stage occupancy.
  (:objects
    blue red orange yellow - block
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 - step
  )

  (:init
    ;; Initial physical arrangement (tower: blue on yellow on red on orange on table)
    (ontable orange)
    (on red orange)
    (on yellow red)
    (on blue yellow)

    ;; Only the top block is clear initially
    (clear blue)

    ;; Hand is initially empty and we start at step1
    (handempty)
    (at-step step1)

    ;; Explicit linear stage ordering; every action must consume the current step and set the successor.
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
  )

  (:goal (and
    ;; Terminal configuration requirements exactly as specified
    (on blue yellow)
    (on orange red)
    ;; Require that execution has reached the final stage step11 (terminal condition)
    (at-step step11)
  ))
)