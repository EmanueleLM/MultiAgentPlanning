(define (problem multi-agent-blocks-problem)
  (:domain multi-agent-blocks)
  (:objects A B C D E F G H I J)

  (:init
    ;; Agent capabilities (partition of blocks)
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

    ;; Initial stacks:
    ;; Stack1: A on the table.
    (ontable A)
    (clear A)

    ;; Stack2: B on the table.
    (ontable B)
    (clear B)

    ;; Stack3: C on D on E on F on G on H on I on J on the table.
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (ontable J)
    (clear C)

    ;; Consonant agent state
    (handempty)
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