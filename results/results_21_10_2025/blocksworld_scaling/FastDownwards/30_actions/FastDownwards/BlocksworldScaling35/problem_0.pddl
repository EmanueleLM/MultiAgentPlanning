(define (problem multi-agent-blocksworld-problem)
  (:domain multi-agent-blocksworld)

  (:objects
    A B C D E F G H I J K - block
  )

  (:init
    ;; initial on/table relations (three stacks bottom -> top)
    (ontable E)
    (on D E)

    (ontable A)
    (on G A)
    (on K G)
    (on H K)
    (on F H)

    (ontable J)
    (on B J)
    (on I B)
    (on C I)

    ;; clear (top-of-stack) facts
    (clear D)
    (clear F)
    (clear C)

    ;; agent label assignments
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
    (consonant K)
  )

  (:goal (and
    ;; final single tower (bottom K on table)
    (ontable K)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)