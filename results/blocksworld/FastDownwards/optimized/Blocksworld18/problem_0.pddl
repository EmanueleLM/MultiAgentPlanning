(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)

  (:objects
    A B C D E F G H I J K L - block
  )

  ; Initial configuration (explicit as given)
  (:init
    ; On relations (block on block)
    (on L C)
    (on A L)
    (on K A)
    (on J K)

    (on B D)
    (on E B)
    (on H E)

    (on G F)
    (on I G)

    ; On table relations
    (ontable C)
    (ontable D)
    (ontable F)

    ; Clear (top-of-stack) initial facts: top blocks are J, H, I
    (clear J)
    (clear H)
    (clear I)

    ; Classification by agent permission (hard constraints)
    ; Vowel agent can move: A, E, I
    (vowel A)
    (vowel E)
    (vowel I)

    ; Consonant agent can move: B, C, D, F, G, H, J, K, L
    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
  )

  ; Goal: single descending stack L on table, K on L, J on K, I on J, H on I, G on H,
  ; F on G, E on F, D on E, C on D, B on C, A on B
  (:goal (and
    (ontable L)
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