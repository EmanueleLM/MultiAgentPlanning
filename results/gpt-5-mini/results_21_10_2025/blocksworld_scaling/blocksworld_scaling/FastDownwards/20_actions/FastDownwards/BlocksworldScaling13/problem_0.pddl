(define (problem blocks_multi_agent_problem)
  (:domain blocks_multi_agent)
  (:objects
    A B C D E F G H I J K L M - block
  )

  (:init
    ; type-marking via predicates for agent capabilities
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

    ; Initial stacks:
    ; Stack1 bottom-to-top: G, I, D, H, A, C, L
    (ontable G)
    (on I G)
    (on D I)
    (on H D)
    (on A H)
    (on C A)
    (on L C)
    (clear L)

    ; Stack2 bottom-to-top: F, K, J, B, M, E
    (ontable F)
    (on K F)
    (on J K)
    (on B J)
    (on M B)
    (on E M)
    (clear E)

    ; Vowel agent hand is empty initially
    (handempty_vowel)
  )

  (:goal
    (and
      ; Desired single stack bottom-to-top:
      ; M on table, L on M, K on L, J on K, I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
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

      ; Top of final stack is A
      (clear A)

      ; vowel_agent's hand empty at the end
      (handempty_vowel)
    )
  )
)