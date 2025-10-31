(define (problem BlocksworldScaling25-problem)
  (:domain blocksworld-scaling25)
  (:objects
    ;; vowels
    A E I - vowel
    ;; consonants
    B C D F G H J - consonant
    ;; place(s)
    table - place
  )
  (:init
    ;; initial stacking (blocks on blocks or on table)
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

    ;; clear = top blocks initially (nothing on them)
    (clear H)
    (clear F)

    ;; Note: no (clear table) facts — places are not modelled with clear predicate.
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