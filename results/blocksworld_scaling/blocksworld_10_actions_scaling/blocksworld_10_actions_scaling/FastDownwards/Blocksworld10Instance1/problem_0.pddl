(define (problem Blocksworld10Instance1-final)
  (:domain blocksworld_agents)
  (:objects
    A B C D E F G - block
    agent_alpha agent_beta - agent
  )

  ;; Initial state: the original arrangement before the given action sequence
  (:init
    ;; table placements
    (ontable A)
    (on B E)
    (ontable C)
    (on D C)
    (on E F)
    (on F G)
    (ontable G)

    ;; clear facts initially (nothing on A and D)
    (clear A)
    (clear D)

    ;; agents' hands are empty at the start
    (handempty agent_alpha)
    (handempty agent_beta)
  )

  ;; Goal: the final arrangement after executing the full action sequence
  (:goal (and
    ;; final table placements and stack relations
    (ontable A)
    (ontable B)
    (ontable C)
    (on D C)
    (ontable E)
    (on F G)
    (ontable G)

    ;; final clear statuses (consistent with the arrangement)
    (clear A)
    (clear B)
    (not (clear C))
    (clear D)
    (clear E)
    (clear F)
    (not (clear G))

    ;; agents end with empty hands (no one is holding a block at the end)
    (handempty agent_alpha)
    (handempty agent_beta)
  ))
)