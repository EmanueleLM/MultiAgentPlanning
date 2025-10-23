(define (problem Blocksworld50Instance4-prob)
  (:domain blocks-world-multiagent)

  (:objects
    A B C D E F G H I J K - block
    robot1 robot2 orchestrator - robot
  )

  (:init
    ;; initial stack relations (from the specification)
    (on A B)
    (on B K)
    (on K C)
    (on C J)

    (on E G)
    (on H F)

    (ontable J)
    (ontable D)
    (ontable G)
    (ontable F)
    (ontable I)

    ;; clear predicates for top blocks in the initial configuration
    (clear A)
    (clear E)
    (clear H)
    (clear I)
    (clear D)

    ;; robots start with empty hands
    (handempty robot1)
    (handempty robot2)
    (handempty orchestrator)
  )

  (:goal
    (and
      ;; final arrangement derived from executing the full sequence
      (ontable A)
      (ontable B)
      (on C J)
      (on D A)
      (on E B)
      (ontable F)
      (on G K)
      (on H I)
      (on I F)
      (ontable J)
      (on K C)
    )
  )
)