(define (problem blocks-sequence-verify)
  (:domain multi-agent-blocks-sequenced)

  (:objects
    A B C D E F G H I J K L M - block
    robot1 robot2 - robot
  )

  (:init
    ;; Initial table stacks (bottom -> top):
    (ontable M)
    (on A M)
    (on L A)
    (on E L)
    (on B E)

    (ontable H)
    (on F H)
    (on D F)
    (on K D)
    (on G K)
    (on J G)
    (on C J)
    (on I C)

    ;; Initially clear (tops)
    (clear B)
    (clear I)

    ;; Robots available
    (handempty robot1)
    (handempty robot2)

    ;; Start the enforced sequence at step0
    (step0)
  )

  ;; Goal: verify the whole 50-step sequence is executable by requiring the
  ;; final step predicate. The final configuration itself is not written here
  ;; as the goal predicate; the sequence of actions enforces the exact moves.
  (:goal (and (step50)))
)