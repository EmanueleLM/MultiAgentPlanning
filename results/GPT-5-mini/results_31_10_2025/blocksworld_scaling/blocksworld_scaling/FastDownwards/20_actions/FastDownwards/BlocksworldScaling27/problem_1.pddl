(define (problem stack-letters)
  (:domain blocks-multi-agent)
  (:objects
    A B C D E F G H I J K - block
    table - place
  )
  (:init
    ;; Initial stacks as specified:
    ;; Stack1: bottom A, E on A, H on E, K on H, B on K
    (on A table)
    (on E A)
    (on H E)
    (on K H)
    (on B K)

    ;; Stack2: F on table
    (on F table)

    ;; Stack3: bottom G, I on G, J on I, C on J, D on C
    (on G table)
    (on I G)
    (on J I)
    (on C J)
    (on D C)

    ;; Clear = top blocks (initially)
    (clear B)
    (clear F)
    (clear D)

    ;; Vowel / consonant classification
    (is-vowel A) (is-vowel E) (is-vowel I)
    (is-consonant B) (is-consonant C) (is-consonant D)
    (is-consonant F) (is-consonant G) (is-consonant H)
    (is-consonant J) (is-consonant K)
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
    (on K table)
  ))
)