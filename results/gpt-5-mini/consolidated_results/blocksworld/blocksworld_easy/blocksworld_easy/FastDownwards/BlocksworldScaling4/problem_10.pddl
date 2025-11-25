(define (problem make-stacks-blue-orange)
  (:domain blocks-orchestrator)

  (:objects
    orchestrator - agent
    table - support
    blue yellow orange red - block
    s0 s1 s2 - stage
  )

  (:init
    (on blue orange)
    (on orange red)
    (on red table)
    (on yellow table)

    (clear blue)
    (clear yellow)

    (handempty orchestrator)

    (current s0)
    (next s0 s1)
    (next s1 s2)
  )

  (:goal (and
    (on blue yellow)
    (on orange red)
  ))
)