(define (problem Blocksworld40Instance5-final-check)
  (:domain multi-agent-blocks)
  (:objects
    A B C D E F G H I - block
    agent1 agent2 - agent
  )

  (:init
    ;; Initial placement (given)
    (ontable A)
    (on E A)
    (on G E)

    (ontable H)
    (on F H)
    (on D F)
    (on I D)
    (on C I)
    (on B C)

    ;; Initially clear (only top blocks)
    (clear G)
    (clear B)

    ;; Both manipulators free initially
    (handempty agent1)
    (handempty agent2)
  )

  ;; Goal: the final arrangement derived from the action trace
  (:goal (and
    (ontable A)
    (on B A)
    (ontable C)
    (on I D)
    (on D F)
    (on F H)
    (ontable E)
    (ontable G)
    (ontable H)
  ))
)