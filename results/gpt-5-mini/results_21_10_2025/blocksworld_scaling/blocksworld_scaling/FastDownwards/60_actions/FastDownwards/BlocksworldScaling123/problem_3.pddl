(define (problem BlocksworldScaling123-problem)
  (:domain BlocksworldScaling123)

  (:objects
    I B J K G L F M A C H D E - block
    Stack1 Stack2 Stack3 - stack
  )

  (:init
    ;; vowels
    (vowel A)
    (vowel E)
    (vowel I)

    ;; consonants
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M)

    ;; initial stacks (top-only and on relations)
    ;; Stack1: I (table) <- B <- J <- L <- M <- H <- D <- E (top)
    (on_stack I Stack1)
    (on_block B I)
    (on_block J B)
    (on_block L J)
    (on_block M L)
    (on_block H M)
    (on_block D H)
    (on_block E D)
    (top E Stack1)
    (clear E)

    ;; Stack2: K (table) <- G <- A <- C (top)
    (on_stack K Stack2)
    (on_block G K)
    (on_block A G)
    (on_block C A)
    (top C Stack2)
    (clear C)

    ;; Stack3: F (table, top)
    (on_stack F Stack3)
    (top F Stack3)
    (clear F)
  )

  (:goal (and
    (on_block A B)
    (on_block B C)
    (on_block C D)
    (on_block D E)
    (on_block E F)
    (on_block F G)
    (on_block G H)
    (on_block H I)
    (on_block I J)
    (on_block J K)
    (on_block K L)
    (on_block L M)
    (on_stack M Stack3)
  ))
)