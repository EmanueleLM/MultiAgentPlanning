(define (problem two-agent-blocks-problem)
  (:domain two-agent-blocks)
  (:objects
    A B C D E F G H I J K L M - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ; Stack 1: E (table) - G - B - I - D - A - L (L top)
    (on G E)
    (on B G)
    (on I B)
    (on D I)
    (on A D)
    (on L A)
    (on-table E)

    ; Stack 2: M (table) - C - K (K top)
    (on C M)
    (on K C)
    (on-table M)

    ; Stack 3: J (table) - F (F top)
    (on F J)
    (on-table J)

    ; Stack 4: H (on table, H top)
    (on-table H)

    ; Clear (top) blocks
    (clear L)
    (clear K)
    (clear F)
    (clear H)

    ; Vowel / consonant classification
    (is_vowel A)
    (is_vowel E)
    (is_vowel I)

    (is_consonant B)
    (is_consonant C)
    (is_consonant D)
    (is_consonant F)
    (is_consonant G)
    (is_consonant H)
    (is_consonant J)
    (is_consonant K)
    (is_consonant L)
    (is_consonant M)

    ; Controllers
    (vowel_controller vowel_agent)
    (consonant_controller consonant_agent)

    ; Hands empty initially
    (handempty vowel_agent)
    (handempty consonant_agent)
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
    (on-table M)
  ))
)