(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ; type membership
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

    ; initial stacks (stack1 bottom A with J on A and I on J and G on I and B on G)
    (ontable A)
    (on J A)
    (on I J)
    (on G I)
    (on B G)

    ; stack2 bottom C with D on C
    (ontable C)
    (on D C)

    ; stack3 bottom H with F on H
    (ontable H)
    (on F H)

    ; stack4 E on the table alone
    (ontable E)

    ; clear (= nothing on top): tops of stacks are B, D, F, E
    (clear B)
    (clear D)
    (clear F)
    (clear E)
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