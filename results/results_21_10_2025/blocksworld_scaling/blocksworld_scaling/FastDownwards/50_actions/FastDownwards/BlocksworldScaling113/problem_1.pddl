(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)
  (:objects
    A B C D E F G H I J K L M N O - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ; agent identities
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ; block type classification (vowels and consonants)
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)

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
    (consonant N)

    ; Initial stacks (bottom-to-top)
    ; Stack1: C F O M H A I D G
    (ontable C)
    (on F C)
    (on O F)
    (on M O)
    (on H M)
    (on A H)
    (on I A)
    (on D I)
    (on G D)

    ; Stack2: N K B L E J
    (ontable N)
    (on K N)
    (on B K)
    (on L B)
    (on E L)
    (on J E)

    ; clear (tops of stacks)
    (clear G)
    (clear J)
  )

  (:goal (and
    (ontable O)
    (on N O)
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
  ))
)