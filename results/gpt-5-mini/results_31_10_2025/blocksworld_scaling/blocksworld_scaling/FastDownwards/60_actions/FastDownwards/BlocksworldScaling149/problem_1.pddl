(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J K - block
  )

  (:init
    ;; Type membership
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G) (consonant H) (consonant J) (consonant K)

    ;; Initial stacks as given:
    ;; Stack1 (table): D bottom, J, E, F top
    (ontable D)
    (on J D)
    (on E J)
    (on F E)
    (clear F)

    ;; Stack2 (table): B bottom, C, G, I top
    (ontable B)
    (on C B)
    (on G C)
    (on I G)
    (clear I)

    ;; Stack3 (table): K bottom, A, H top
    (ontable K)
    (on A K)
    (on H A)
    (clear H)

    ;; Hands empty initially for both agents
    (v-handempty)
    (c-handempty)
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
      (ontable K)
    )
  )
)