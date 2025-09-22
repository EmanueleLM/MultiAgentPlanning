(define (problem combined_blocks_problem)
  (:domain combined_blocks_agents)
  (:objects
    A B C D E F G H I J K L M N table
  )

  (:init
    ; Stack 1 (bottom to top): D - A - F - L - K - N - B - I
    (on D table)
    (on A D)
    (on F A)
    (on L F)
    (on K L)
    (on N K)
    (on B N)
    (on I B)

    ; Stack 2 (bottom to top): H - M - G - E - C - J
    (on H table)
    (on M H)
    (on G M)
    (on E G)
    (on C E)
    (on J C)

    ; clear (tops of stacks)
    (clear I)
    (clear J)
    (clear table)

    ; Vowel agent capabilities
    (vowel A)
    (vowel E)
    (vowel I)

    ; Consonant agent capabilities
    (consonant D)
    (consonant F)
    (consonant L)
    (consonant K)
    (consonant N)
    (consonant B)
    (consonant H)
    (consonant M)
    (consonant G)
    (consonant C)
    (consonant J)
  )

  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N table)
  ))
)