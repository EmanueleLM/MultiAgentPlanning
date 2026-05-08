(define (problem blocks-sequence-problem)
  (:domain blocks-operator-sequenced)

  (:objects
    blue orange red yellow - block
    table - loc
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 - step
  )

  (:init
    ;; initial stacking
    (on orange red)
    (on red yellow)
    (on yellow table)
    (on blue table)

    ;; clear facts per the supplied initial facts
    (clear blue)
    (clear orange)
    ;; red and yellow are not listed as clear initially because they have blocks on them
    ;; hand initial condition
    (handempty)

    ;; Explicitly enforce the planned sequence: only step1 initially allowed
    (allowed step1)
  )

  ;; Final mandated terminal conditions (goal): full tower with orange base on table
  (:goal (and
    (on red yellow)
    (on blue red)
    (on yellow orange)
    (on orange table)
    (handempty)   ; require hand empty at the end
  ))