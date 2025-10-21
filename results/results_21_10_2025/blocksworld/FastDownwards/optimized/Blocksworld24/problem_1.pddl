(define (problem multi_agent_blocks_problem)
  (:domain multi_agent_blocks)
  (:objects
    A B C D E F G H I J K L M N - block
  )
  (:init
    ;; Agent classifications (vowels: A E I ; consonants: rest)
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    ;; Initial stacks as given:
    ;; Stack1 (bottom->top): B K F M L I
    (ontable B)
    (on K B)
    (on F K)
    (on M F)
    (on L M)
    (on I L)

    ;; Stack2 (bottom->top): G N D A
    (ontable G)
    (on N G)
    (on D N)
    (on A D)

    ;; Stack3 (bottom->top): E C H
    (ontable E)
    (on C E)
    (on H C)

    ;; Stack4: J on table
    (ontable J)

    ;; Clear tops of stacks
    (clear I)
    (clear A)
    (clear H)
    (clear J)

    ;; Both agents start with empty hands
    (handempty-v)
    (handempty-c)
  )

  ;; Global goal: achieve a single stack top-to-bottom A B C D E F G H I J K L M N with N on table
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
    (ontable N)
  ))
)