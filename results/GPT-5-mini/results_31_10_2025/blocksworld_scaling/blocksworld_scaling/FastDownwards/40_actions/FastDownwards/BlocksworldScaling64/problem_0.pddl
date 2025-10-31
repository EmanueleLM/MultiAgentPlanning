(define (problem stack-goal-multiagent)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ;; initial on / ontable relations (from the public environment)
    (ontable E)
    (on A E)
    (on B A)
    (on H B)
    (on F H)

    (ontable C)
    (on D C)

    (ontable J)
    (on I J)
    (on G I)

    ;; clear (top) blocks initially
    (clear F)
    (clear D)
    (clear G)

    ;; type membership for agent capabilities
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant C)
    (consonant J)
    (consonant D)
    (consonant B)
    (consonant H)
    (consonant F)
    (consonant G)
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