(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J K L M N - block
  )

  ;; Initial facts derived exactly from the provided initial configuration.
  (:init
    ;; type information: which blocks are vowels vs consonants (private capability constraints encoded as hard facts)
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
    (consonant N)

    ;; Initial placement (exactly as specified)
    (ontable L)
    (ontable K)

    (on M L)
    (on A M)

    (on H K)
    (on C H)

    (on E A)
    (on G C)
    (on J G)

    (on N E)
    (on I J)
    (on F N)
    (on D I)
    (on B F)

    ;; Clear (top) blocks computed from the explicit stack data above:
    ;; Tops are B (top of stack starting on L) and D (top of stack starting on K).
    (clear B)
    (clear D)
  )

  ;; Goal: single stack with A on top ... M on top of N, and N on the table (exact as specified).
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
      (on M N)
      (ontable N)
    )
  )
)