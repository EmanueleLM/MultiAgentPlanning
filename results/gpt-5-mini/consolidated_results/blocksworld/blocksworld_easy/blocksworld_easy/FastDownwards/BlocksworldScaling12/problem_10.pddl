(define (problem bw-problem)
  (:domain blocksworld)
  (:objects
    orange blue yellow red - block
    step0 step1 step2 step3 step4 - time
  )
  (:init
    ;; table placement
    (on-table orange)
    (on-table blue)
    (on-table red)

    ;; stacking relation
    (on yellow orange)

    ;; clearness (explicitly listed for blocks that are clear)
    (clear yellow)
    (clear red)
    (clear blue)

    ;; hand state
    (handempty)

    ;; explicit contiguous time/stage ordering
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