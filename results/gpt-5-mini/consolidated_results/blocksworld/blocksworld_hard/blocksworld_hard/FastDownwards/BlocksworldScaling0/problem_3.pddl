(define (problem pddl_orchestrator-problem)
  (:domain pddl_orchestrator)
  (:objects
    blue orange yellow red - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )
  (:init
    ; initial stack: blue on orange, orange on yellow, yellow on red, red on table
    (on blue orange)
    (on orange yellow)
    (on yellow red)
    (ontable red)

    ; clear status inferred from stacking: only blue is clear
    (clear blue)

    ; hand is empty initially
    (handempty)

    ; stage ordering and current stage (linear contiguous stages)
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
  )

  (:goal (and
    (on red orange)
    (on yellow red)
  ))
)