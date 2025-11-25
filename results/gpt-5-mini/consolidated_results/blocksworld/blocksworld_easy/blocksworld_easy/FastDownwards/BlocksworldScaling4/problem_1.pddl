(define (problem make-stacks-blue-orange)
  (:domain blocks-orchestrator)

  (:objects
    orchestrator - agent
    table - table
    blue yellow orange red - block
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ; Initial physical configuration (from human specification)
    (on blue orange)
    (on orange red)
    (on red table)
    (on yellow table)

    ; Clearness per specification: blue and yellow are clear; orange and red have blocks on them
    (clear blue)
    (clear yellow)
    (handempty orchestrator)

    ; stage ordering and initial current stage
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )

  ; Goal: exactly the required block-on-block relations (no extra terminal constraints imposed)
  (:goal (and
    (on blue yellow)
    (on orange red)
  ))
)