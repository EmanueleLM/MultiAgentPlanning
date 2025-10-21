(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)
  (:objects A B C D E F G H I J - block)

  (:init
    ;; initial stacked column: B on C on D on E on F on G on H on I on J, J on table
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (ontable J)

    ;; A is on the table separately
    (ontable A)

    ;; Top-of flags initially:
    (clear A)
    (clear B)

    ;; Agent capabilities (as provided by agents)
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
    (ontable J)
  ))
)