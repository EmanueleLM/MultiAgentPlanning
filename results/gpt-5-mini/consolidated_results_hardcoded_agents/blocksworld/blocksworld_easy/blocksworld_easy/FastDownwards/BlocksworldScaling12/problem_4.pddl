(define (problem bw-problem)
  (:domain blocksworld)
  (:objects
    orange blue yellow red - block
    step0 step1 step2 step3 step4 - time
  )
  (:init
    (on-table orange)
    (on-table blue)
    (on-table red)
    (on yellow orange)

    (clear yellow)
    (clear red)
    (clear blue)

    (handempty)

    (current step0)
    (next step0 step1)
    (next step1 step2)
    (next step2 step3)
    (next step3 step4)
  )
  (:goal (and
    (current step4)
    (on orange blue)
    (on yellow red)
  ))
)