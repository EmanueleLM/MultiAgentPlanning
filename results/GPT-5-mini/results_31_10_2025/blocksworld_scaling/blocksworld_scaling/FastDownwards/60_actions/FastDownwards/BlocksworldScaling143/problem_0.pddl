(define (problem blocks_dual_agent_problem)
  (:domain blocks_dual_agent)

  (:objects
    L J D M E K H F I A G B C - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; Static type partitions
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
    (consonant M)

    ;; Initial stacks (Stack1 bottom-to-top: L, J, K, H, I, A, G, B, C)
    (on J L)
    (on K J)
    (on H K)
    (on I H)
    (on A I)
    (on G A)
    (on B G)
    (on C B)
    (on-table L)

    ;; Stack2 bottom-to-top: D, F
    (on F D)
    (on-table D)

    ;; Stack3 bottom-to-top: M, E
    (on E M)
    (on-table M)

    ;; Clear/top facts (tops of each initial stack)
    (clear C)
    (clear F)
    (clear E)

    ;; Agents are free at start
    (free vowel_agent)
    (free consonant_agent)
  )

  (:goal
    (and
      ;; Desired single stack bottom-to-top: M, L, K, J, I, H, G, F, E, D, C, B, A
      (on L M)
      (on K L)
      (on J K)
      (on I J)
      (on H I)
      (on G H)
      (on F G)
      (on E F)
      (on D E)
      (on C D)
      (on B C)
      (on A B)
      (on-table M)
      (clear A)
    )
  )
)