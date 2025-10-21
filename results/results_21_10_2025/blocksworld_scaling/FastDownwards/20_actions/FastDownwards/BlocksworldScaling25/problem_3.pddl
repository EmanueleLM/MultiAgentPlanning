(define (problem BlocksworldScaling25-problem)
  (:domain blocksworld-scaling25)
  (:objects
    A E I - vowel
    B C D F G H J - consonant
    table - place
  )
  (:init
    (on G table)
    (on J G)
    (on E J)
    (on I E)
    (on A I)
    (on H A)
    (on D table)
    (on B D)
    (on C B)
    (on F C)
    (clear H)
    (clear F)
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