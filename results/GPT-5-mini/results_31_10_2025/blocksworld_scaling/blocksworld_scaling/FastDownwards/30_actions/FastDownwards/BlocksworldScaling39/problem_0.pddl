(define (problem two-agent-blocks-problem)
  (:domain two-agent-blocks)
  (:objects
    A B C D E F G H I J K L M - block
    vowel_agent consonant_agent - agent
  )

  ; Initial state: pairwise authoritative relationships from agents' reports
  (:init
    ; Block positions (stacks)
    (on G E)
    (on B G)
    (on I B)
    (on D I)
    (on A D)
    (on L A)
    (on-table E)

    (on C M)
    (on K C)
    (on-table M)

    (on F J)
    (on-table J)

    (on-table H)

    ; Clear (top) blocks as reported
    (clear L)
    (clear K)
    (clear F)
    (clear H)

    ; Vowel / consonant classification (from reports)
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

    ; Agents and controllers
    (vowel_controller vowel_agent)
    (consonant_controller consonant_agent)

    ; Both agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  ; Goal: M on table and the tower A on B on C ... on L on M
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