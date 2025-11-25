(define (problem blocks-problem-actor-plan)
  (:domain blocks-order-enforced)

  ; Steps encode strict sequential progression. The plan must consume step1..step11 in order.
  (:objects
    blue red orange yellow - block
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 - step
  )

  (:init
    ; Initial block configuration (as provided)
    (ontable orange)
    (on red orange)
    (on yellow red)
    (on blue yellow)
    (clear blue)
    (handempty)

    ; Single active stage token at the start
    (at-step step1)

    ; Linear stage ordering (hard constraint: actions require at-step s and next s s2; effects move the token)
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
    (on blue yellow)
    (on orange red)
    (at-step step11)
  ))
)