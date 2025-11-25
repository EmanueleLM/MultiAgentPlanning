(define (problem make-stacks-blue-orange)
  (:domain blocks-orchestrator)

  (:objects
    orchestrator - agent
    table - table
    blue yellow orange red - block
    s0 s1 s2 - stage
  )

  (:init
    ;; initial stacking configuration
    (on blue orange)
    (on orange red)
    (on red table)
    (on yellow table)

    ;; clear facts: a block is clear iff nothing is on top and it is not held
    (clear blue)
    (clear yellow)

    ;; single hand resource initially available
    (handempty orchestrator)

    ;; stage progression: actions must follow s0 -> s1 -> s2
    (current s0)
    (next s0 s1)
    (next s1 s2)
  )

  (:goal (and
    ;; final stacking requirements
    (on blue yellow)
    (on orange red)
  ))
)