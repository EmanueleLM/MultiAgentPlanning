(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ;; type annotations for which agent can move which blocks
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G) (consonant H) (consonant J)

    ;; initial stacks:
    ;; stack1: bottom A, J on A, I on J, G on I, B on G
    (ontable A)
    (on J A)
    (on I J)
    (on G I)
    (on B G)

    ;; stack2: bottom C, D on C
    (ontable C)
    (on D C)

    ;; stack3: bottom H, F on H
    (ontable H)
    (on F H)

    ;; stack4: E on the table alone
    (ontable E)

    ;; clear/top blocks initially
    (clear B)
    (clear D)
    (clear F)
    (clear E)
  )

  (:goal (and
    ;; Final single stack: bottom J on table, then I H G F E D C B A (A on top)
    (ontable J)
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