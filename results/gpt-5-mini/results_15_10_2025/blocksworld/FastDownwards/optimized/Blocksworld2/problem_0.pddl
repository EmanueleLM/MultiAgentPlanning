(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    table - place
    A E I - vowel
    B C D F G H J - consonant
  )
  (:init
    ;; initial stacking: J bottom then I then H then G then F then E then D then C then B on top
    (on J table)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)

    ;; A on the table
    (on A table)

    ;; only top blocks are clear: A and B
    (clear A)
    (clear B)
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
    (on J table)
  ))
)