(define (problem combined-blocks-problem)
  (:domain blocks-multiagent-domain)

  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ;; Agent capabilities (from both agents, merged)
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

    ;; Initial stacking (merged, normalized to unified predicate names)
    ;; Stack1: A on table
    (ontable A)
    ;; Stack2: B on table
    (ontable B)
    ;; Stack3: C on D on E on F on G on H on I on J with J on table
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (ontable J)

    ;; Clear/top blocks initially
    (clear A)
    (clear B)
    (clear C)
    ;; Other blocks (D,E,F,G,H,I,J) are not listed as clear because they have something on them.
  )

  ;; Global goal: reconfigure into the single tower A on B on C on D on E on F on G on H on I on J with J on table.
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
      (ontable J)
    )
  )
)