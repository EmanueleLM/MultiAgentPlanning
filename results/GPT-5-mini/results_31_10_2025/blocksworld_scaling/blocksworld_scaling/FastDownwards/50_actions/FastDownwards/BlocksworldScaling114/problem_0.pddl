(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J K - block
  )

  (:init
    ; initial table bottoms
    (ontable G)
    (ontable C)

    ; stack-1 (bottom -> top): G, E, I, F, H, D, A
    (on E G)
    (on I E)
    (on F I)
    (on H F)
    (on D H)
    (on A D)

    ; stack-2 (bottom -> top): C, J, B, K
    (on J C)
    (on B J)
    (on K B)

    ; clear (tops)
    (clear A)
    (clear K)

    ; block type assignments
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
  )

  (:goal
    (and
      ; final single stack (bottom K on table) up to top A:
      (ontable K)
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
)