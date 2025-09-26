(define (problem multiagent-blocks-prob)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G I
    s1 s2 s3
    table
  )

  (:init
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (is-table table)

    (used s1)
    (base s1 D)
    (top s1 A)
    (on C D)
    (on B C)
    (on A B)
    (on D table)

    (used s2)
    (base s2 E)
    (top s2 F)
    (on G E)
    (on I G)
    (on F I)
    (on E table)

    (available s3)

    (clear A)
    (clear F)

    (freeV)
    (freeC)
  )

  (:goal (and
    (on B A)
    (on D B)
    (on E D)
    (on C F)
    (on I C)
    (on G I)
    (on A table)
    (on F table)
  ))
)