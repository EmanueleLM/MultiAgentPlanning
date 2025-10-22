(define (problem blocksworld-sequence-problem)
  (:domain blocksworld-sequence)

  (:objects
    A B C D E F G - block
    mover1 mover2 orchestrator - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )

  (:init
    ;; initial on relationships
    (on A B)
    (on E A)
    (on D C)
    (on F G)

    ;; initial on-table facts
    (on-table B)
    (on-table C)
    (on-table G)

    ;; initial clear/top facts
    (clear E)
    (clear D)
    (clear F)

    ;; agents are free-handed initially
    (handempty mover1)
    (handempty mover2)
    (handempty orchestrator)

    ;; start stage
    (at-stage s0)
  )

  ;; Goal: reach the final stage after executing the prescribed, ordered sequence
  ;; The final block arrangement is not directly asserted in the goal;
  ;; reaching s10 verifies the exact sequence was executed and the final state can be inspected.
  (:goal (and
    (at-stage s10)
  ))
)