(define (problem blocks_AB_to_M_multiagent)
  (:domain multiagent-blocksworld)
  (:objects
    A B C D E F G H I J K L M - block
    worker_a worker_b - agent
  )

  (:init
    ; Agents present
    (agent worker_a)
    (agent worker_b)

    ; Initial "on" relations (public authoritative initial state)
    (on A F)
    (on B H)
    (on C D)
    (on D E)
    (ontable E)
    (on F L)
    (ontable G)
    (on H I)
    (ontable I)
    (ontable J)
    (on K M)
    (on L J)
    (on M G)

    ; Clear (top-of-stack) facts derived from the initial stacking
    (clear A)
    (clear B)
    (clear C)
    (clear K)

    ; Note: blocks E, G, I, J are on the table per the initial relations above.
    ; Other blocks that have blocks above them are not listed as clear.
  )

  ; Goal: final configuration after the authoritative 50-step sequence.
  ; The 50-step sequence was not provided, so the goal is set equal to the initial arrangement.
  (:goal
    (and
      (on A F)
      (on B H)
      (on C D)
      (on D E)
      (ontable E)
      (on F L)
      (ontable G)
      (on H I)
      (ontable I)
      (ontable J)
      (on K M)
      (on L J)
      (on M G)
      (clear A)
      (clear B)
      (clear C)
      (clear K)
    )
  )
)