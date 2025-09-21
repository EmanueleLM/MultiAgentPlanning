(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J K L M - block
    consonant_agent vowel_agent orchestrator - agent
    s1 s2 s3 s4 s5 s6 s7 - slot
  )

  (:init
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

    (consonant-agent consonant_agent)
    (vowel-agent vowel_agent)

    ; initial stacks mapped to slots:
    (at-table G s1)
    (on L G)
    (on J L)
    (on B J)

    (at-table H s2)
    (on C H)
    (on M C)

    (at-table I s3)
    (on D I)
    (on F D)

    (at-table A s4)
    (on K A)
    (on E K)

    ; free slots (num_stacks = 7)
    (free-slot s5)
    (free-slot s6)
    (free-slot s7)

    ; clear (top blocks)
    (clear B)
    (clear M)
    (clear F)
    (clear E)

    (handempty consonant_agent)
    (handempty vowel_agent)
    (handempty orchestrator)
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
    (at-table M s1)
  ))
)