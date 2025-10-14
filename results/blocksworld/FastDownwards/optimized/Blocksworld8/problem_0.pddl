(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K L M N - block
  )

  (:init
    ;; block type labels (agent-specific accessibility)
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
    (consonant L)
    (consonant M)
    (consonant N)

    ;; Initial stacks as given (stack1 bottom-to-top: I C H G A N K)
    (ontable I)
    (on C I)
    (on H C)
    (on G H)
    (on A G)
    (on N A)
    (on K N)

    ;; stack2 bottom-to-top: D F E M L B J
    (ontable D)
    (on F D)
    (on E F)
    (on M E)
    (on L M)
    (on B L)
    (on J B)

    ;; Only the top blocks of each stack are clear (can be picked)
    (clear K)
    (clear J)

    ;; Hands are free initially
    (hand-free-vowel)
    (hand-free-cons)
  )

  (:goal
    (and
      ;; Desired single tower: bottom N on table, above it M L K J I H G F E D C B A
      (ontable N)
      (on M N)
      (on L M)
      (on K L)
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
    )
  )
)