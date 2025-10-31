(define (problem stack-goal-multiagent)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ;; initial positions (from the public environment)
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

    ;; which blocks are initially clear (top of each stack)
    (clear F)
    (clear D)
    (clear G)

    ;; agent capabilities by block label
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