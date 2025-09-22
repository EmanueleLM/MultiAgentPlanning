(define (problem combined-multiagent-tower)
  (:domain combined-blocks)

  (:objects
    A B C D E F G H I J K L M N - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; agent identities
    (agent vowel_agent)
    (agent consonant_agent)

    ;; block types
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    ;; manipulation permissions
    (can-manip vowel_agent A) (can-manip vowel_agent E) (can-manip vowel_agent I)
    (can-manip consonant_agent B) (can-manip consonant_agent C) (can-manip consonant_agent D)
    (can-manip consonant_agent F) (can-manip consonant_agent G) (can-manip consonant_agent H)
    (can-manip consonant_agent J) (can-manip consonant_agent K) (can-manip consonant_agent L)
    (can-manip consonant_agent M) (can-manip consonant_agent N)

    ;; initial stacks (bottom to top): I C H G A N K
    (ontable I)
    (on C I)
    (on H C)
    (on G H)
    (on A G)
    (on N A)
    (on K N)
    (clear K)

    ;; stack2 bottom to top: D F E M L B J
    (ontable D)
    (on F D)
    (on E F)
    (on M E)
    (on L M)
    (on B L)
    (on J B)
    (clear J)

    ;; hand status
    (handempty consonant_agent)
    (handempty vowel_agent)
  )

  ;; Global goal: single tower on the table with N bottom and sequence above it:
  ;; N (ontable), M on N, L on M, K on L, J on K, I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
  (:goal
    (and
      (ontable N)
      (on M N)
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
    )
  )

  (:metric minimize (total-cost))
)