(define (problem blocks-sequenced-problem)
  (:domain blocksworld-sequenced)

  (:objects
    blue orange red yellow - block
    table - table
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 - step
  )

  (:init
    ;; initial stacking: orange on red, red on yellow, yellow on table, blue on table
    (on-block orange red)
    (on-block red yellow)
    (on-table yellow)
    (on-table blue)

    ;; initial clear status (blocks that have nothing on top of them)
    (clear orange)
    (clear blue)

    ;; hand is empty
    (handempty)

    ;; sequencing: start at step1
    (allowed step1)
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
    (next step11 step12)
  )

  (:goal (and
    (on-block red yellow)
    (on-block blue red)
    (on-block yellow orange)
  ))
)