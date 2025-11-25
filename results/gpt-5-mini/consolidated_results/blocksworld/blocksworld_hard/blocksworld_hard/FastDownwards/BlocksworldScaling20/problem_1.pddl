(define (problem blocks-problem)
  (:domain blocks-domain)
  (:objects
    blue red yellow orange - block
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 - step
  )
  (:init
    ;; Initial on relationships: blue on red, red on yellow, yellow on orange, orange on table
    (on blue red)
    (on red yellow)
    (on yellow orange)
    (on-table orange)

    ;; Clear and hand state (consistent with definition: clear iff no block on top and not held)
    (clear blue)
    (hand-empty)

    ;; Time / stage ordering and initial stage
    (at step0)
    (next step0 step1)
    (next step1 step2)
    (next step2 step3)
    (next step3 step4)
    (next step4 step5)
    (next step5 step6)
    (next step6 step7)
    (next step7 step8)
    (next step8 step9)
    (next step9 step10)
  )
  (:goal (and
    ;; Goal configuration required at the terminal stage step10
    (on red yellow)
    (on orange blue)
    (at step10)
  ))
)