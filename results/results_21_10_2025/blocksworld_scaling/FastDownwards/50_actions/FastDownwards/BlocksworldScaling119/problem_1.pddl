(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    A E I - vowel
    B C D F G H J - consonant
  )
  (:init
    ;; initial on relations
    (ontable G)
    (ontable I)
    (ontable D)

    (on F G)
    (on A F)
    (on J A)

    (on C I)
    (on B C)

    (on H D)
    (on E H)

    ;; clear means top of its stack
    (clear J)
    (clear B)
    (clear E)

    ;; hands empty
    (handempty-vowel)
    (handempty-consonant)
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