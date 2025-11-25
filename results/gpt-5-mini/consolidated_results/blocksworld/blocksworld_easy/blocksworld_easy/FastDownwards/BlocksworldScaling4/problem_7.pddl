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

    ;; clear predicates reflect "no block on top" and "not held"
    (clear blue)
    (clear yellow)

    ;; single hand resource available
    (handempty orchestrator)

    ;; explicit discrete stage progression - system starts at s0
    (current s0)
    (next s0 s1)
    (next s1 s2)
  )

  (:goal (and
    (on blue yellow)
    (on orange red)
  ))
)