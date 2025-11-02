(define (problem blocksworld50instance15-goal)
  (:domain blocksworld-multiagent)
  ; Reconciliation comment:
  ; The provided sequential trace of 50 actions executed by robot1 and robot2
  ; was simulated and found consistent. The final arrangement below is encoded
  ; as the goal. No conflicts were found between the agents' interleaved actions.
  (:objects
    A B C D E F G H I J - block
    robot1 robot2 orchestrator - agent
  )

  (:init
    ; initial on relationships (bottom -> top per stack)
    (on A C)
    (on C E)
    (on H A)
    (on G B)
    (on I G)
    (on D I)
    (on F D)

    ; initial ontable facts
    (ontable B)
    (ontable E)
    (ontable J)

    ; clear / top blocks initial
    (clear H)
    (clear F)
    (clear J)

    ; all agents start with empty hands
    (handempty robot1)
    (handempty robot2)
    (handempty orchestrator)
  )

  (:goal (and
    ; final arrangement derived from the executed trace
    (on A G)
    (ontable B)
    (on C I)
    (ontable D)
    (ontable E)
    (ontable F)
    (on G B)
    (on H J)
    (on I H)
    (on J F)
  ))
)