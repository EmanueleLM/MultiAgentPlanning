(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J K L M - block
  )

  ;; Initial state - using the concrete initial split provided in the agents'
  ;; examples. Two stacks total 13 blocks.
  ;; Stack 1 (bottom -> top): M L K J I H G F
  ;; Stack 2 (bottom -> top): E D C B A

  (:init
    ;; Stack 1 relations
    (on L M)
    (on K L)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on-table M)

    ;; Stack 2 relations
    (on D E)
    (on C D)
    (on B C)
    (on A B)
    (on-table E)

    ;; Clear/top facts (tops are F and A)
    (clear F)
    (clear A)

    ;; Labeling facts: vowels and consonants (A,E,I are vowels)
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
  )

  ;; Goal: single stack (bottom -> top): M L K J I H G F E D C B A
  ;; Represented by on relations plus M on the table and A clear (top).
  (:goal (and
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
    (on-table M)
    (clear A)
  ))
)