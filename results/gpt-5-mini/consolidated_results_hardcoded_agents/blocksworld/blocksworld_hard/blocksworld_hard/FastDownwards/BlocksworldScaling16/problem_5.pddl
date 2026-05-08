(define (problem blocks-problem-actor-plan)
  (:domain blocks-order-enforced)

  ;; Objects: four blocks and an explicit linear sequence of steps.
  (:objects
    blue red orange yellow - block
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 - step
  )

  (:init
    ;; Initial block configuration (as provided)
    (ontable orange)
    (on red orange)
    (on yellow red)
    (on blue yellow)
    (clear blue)
    (handempty)

    ;; Single active stage token at the start enforces strict sequential action progression.
    (at-step step1)

    ;; Linear stage ordering: actions must consume these steps contiguously.
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

  ;; Goal requires the task configuration AND that the final step token has been reached.
  (:goal (and
    (on blue yellow)
    (on orange red)
    (at-step step11)
  ))
)