(define (problem Blocksworld10Instance4-problem)
  (:domain blocksworld-multiagent)

  (:objects
    A B C D E F G H - block
    agent1 agent2 - agent
  )

  (:init
    ;; initial on relationships
    (on C E)
    (on D C)
    (on F H)
    (on G B)

    ;; on-table blocks
    (ontable A)
    (ontable B)
    (ontable E)
    (ontable H)

    ;; clear/top blocks (nothing on top of them)
    (clear A)
    (clear D)
    (clear F)
    (clear G)

    ;; agents are free and no carrying initially
    (handempty agent1)
    (handempty agent2)
    ;; note: (carrying) is absent => no-one is carrying a block initially
  )

  ;; Goal encodes the final arrangement derived from the provided action sequence
  (:goal (and
    (on A F)
    (on D B)
    (on C E)
    (ontable B)
    (ontable E)
    (ontable F)
    (ontable G)
    (ontable H)
  ))
)