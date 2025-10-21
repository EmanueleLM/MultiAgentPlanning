(define (problem BlocksworldScaling91-problem)
  (:domain BlocksworldScaling91)

  (:objects
    ; blocks
    J K I E C F M B L A D H G - block
    ; agents
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ; agent types
    (is-vowel-agent vowel_agent)
    (is-consonant-agent consonant_agent)

    ; agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)

    ; label vowels and consonants
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant J) (consonant K) (consonant C) (consonant F)
    (consonant M) (consonant B) (consonant L) (consonant D)
    (consonant H) (consonant G)

    ; initial stacks (bottom -> top)
    ; Stack 1: J (on table), K on J, I on K, E on I, F on E, L on F, A on L, D on A, H on D
    (ontable J)
    (on K J)
    (on I K)
    (on E I)
    (on F E)
    (on L F)
    (on A L)
    (on D A)
    (on H D)

    ; Stack 2: C (on table), M on C, B on M, G on B
    (ontable C)
    (on M C)
    (on B M)
    (on G B)

    ; clear/top blocks initially: H and G
    (clear H)
    (clear G)

    ; other blocks that are currently on top of something are not clear (not listed)
  )

  (:goal
    (and
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
      (ontable M)
    )
  )
)