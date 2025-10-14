(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A E I - vowel
    B C D F G H J - consonant
    table - place
  )
  (:init
    (on H table)
    (on D H)
    (on A D)
    (on C A)

    (on J table)
    (on E J)
    (on F E)
    (on I F)
    (on G I)
    (on B G)

    (clear C)
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