(define (problem blocks-sequence-problem)
  (:domain blocks-world-sequence)
  (:objects
    A B C D E F G - block
    worker1 worker2 orchestrator - agent
  )

  (:init
    ;; Initial stacking as specified
    (on A C)
    (on C G)
    (on E A)
    (on F E)
    (on D B)

    ;; Blocks on the table initially
    (ontable B)
    (ontable G)

    ;; Initially clear (tops): F and D
    (clear F)
    (clear D)

    ;; All agents start with empty hands
    (handempty worker1)
    (handempty worker2)
    (handempty orchestrator)

    ;; Sequence control: start at s0
    (s0)
  )

  ;; Goal: verify the prescribed action sequence can be executed to completion.
  ;; The goal does not explicitly state the final block arrangement; it only
  ;; requires that the scripted sequence of actions has been completed.
  (:goal (done))
)