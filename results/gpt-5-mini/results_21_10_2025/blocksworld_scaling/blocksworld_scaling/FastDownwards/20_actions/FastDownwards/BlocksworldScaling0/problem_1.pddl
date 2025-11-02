(define (problem BlocksworldScaling0-problem)
  (:domain BlocksworldScaling0)

  (:objects
    A B C D E F G H I J K - block
  )

  (:init
    ;; initial stacks (bottom-to-top)
    ;; stack1 bottom-to-top: C F H K B D
    (ontable C)
    (on F C)
    (on H F)
    (on K H)
    (on B K)
    (on D B)

    ;; stack2 bottom-to-top: E G I A J
    (ontable E)
    (on G E)
    (on I G)
    (on A I)
    (on J A)

    ;; clear (top blocks of each initial stack)
    (clear D)
    (clear J)

    ;; type membership for agents
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
    ;; final tower: K on table; sequence above K: J I H G F E D C B A (A top)
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