(define (problem blocks-final-goal)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J - block
    agent1 agent2 - agent
  )

  (:init
    ;; Initial configuration (before the sequence of actions)
    (ontable A)
    (on E A)
    (on G E)
    (on F G)
    (on B F)
    (on J B)

    (ontable H)
    (on D H)
    (on C D)
    (on I C)

    ;; Initially clear tops
    (clear J)
    (clear I)

    ;; Agents are available and have empty hands initially
    (handempty agent1)
    (handempty agent2)
  )

  (:goal (and
    ;; Final arrangement after all listed actions:
    ;; Stack 1 (table): A -> E -> G -> I  (I top)
    (ontable A)
    (on E A)
    (on G E)
    (on I G)

    ;; Stack 2 (table): H -> D -> C     (C top)
    (ontable H)
    (on D H)
    (on C D)

    ;; Stack 3 (table): B -> F         (F top)
    (ontable B)
    (on F B)

    ;; Stack 4 (table): J             (J top)
    (ontable J)
  ))
)