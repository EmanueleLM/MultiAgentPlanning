(define (problem blocks-sequenced-problem)
  (:domain blocksworld-sequenced)

  (:objects
    blue orange red yellow - block
    table - table
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 - stage
  )

  (:init
    (on orange red)
    (on red yellow)
    (on yellow table)
    (on blue table)
    (clear blue)
    (clear orange)
    (handempty)
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
  )

  (:goal (and
    (on red yellow)
    (on blue red)
    (on yellow orange)
  ))
)