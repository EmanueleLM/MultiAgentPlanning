(define (problem blocks-sequence-problem)
  (:domain blocks-operator-sequenced)

  (:objects
    blue orange red yellow - block
    table - loc
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 - step
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
  )

  (:goal (and
    (on red yellow)
    (on blue red)
    (on yellow orange)
    (on orange table)
    (handempty)
  ))
)