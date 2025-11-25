(define (problem make-stacks-blue-orange)
  (:domain blocks-orchestrator)

  (:objects
    orchestrator - agent
    table - table
    blue yellow orange red - block
  )

  (:init
    ; initial positions: all blocks start on the table and are clear
    (on blue table)
    (on yellow table)
    (on orange table)
    (on red table)

    (clear blue)
    (clear yellow)
    (clear orange)
    (clear red)

    (handempty orchestrator)
  )

  ; The plan must achieve these terminal conditions exactly.
  ; Enforce the required final placements and that the agent is free.
  (:goal (and
    (on blue yellow)
    (on orange red)
    (handempty orchestrator)
  ))
)