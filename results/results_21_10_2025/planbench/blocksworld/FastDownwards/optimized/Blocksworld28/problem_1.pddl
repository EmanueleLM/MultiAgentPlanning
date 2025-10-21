(define (problem combined_blocks_problem_multi_agent)
  (:domain blocks_multi_agents)
  (:objects
    A B C D E F G H I J K L M - block
  )

  (:init
    ; which blocks each agent may move
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

    ; initial stacks (public information)
    ; Stack with base E on the table: E(bottom) - L - F - C - M - K(top)
    (ontable E)
    (on L E)
    (on F L)
    (on C F)
    (on M C)
    (on K M)

    ; Stack with base H on the table: H(bottom) - A - B - D - I(top)
    (ontable H)
    (on A H)
    (on B A)
    (on D B)
    (on I D)

    ; Stack with base J on the table: J(bottom) - G(top)
    (ontable J)
    (on G J)

    ; clear = tops of stacks initially
    (clear K)
    (clear I)
    (clear G)

    ; hand is initially empty
    (handempty)
  )

  (:goal (and
    ;; global goal: single tall stack with M on the table and above it L, K, J, I, H, G, F, E, D, C, B, A (A on top)
    (ontable M)
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
  ))
)