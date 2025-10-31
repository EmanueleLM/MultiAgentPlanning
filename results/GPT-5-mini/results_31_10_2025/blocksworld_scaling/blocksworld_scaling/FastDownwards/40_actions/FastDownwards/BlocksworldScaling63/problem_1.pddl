(define (problem BlocksworldScaling63-problem)
  (:domain BlocksworldScaling63)

  (:objects
    A B C D E F G H I J K L - block
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 - table
  )

  (:init
    ;; classification of blocks
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

    ;; initial placement (stacks)
    ;; stack on t1: L - C - D - J  (L on t1, C on L, D on C, J on D)
    (on L t1)
    (on C L)
    (on D C)
    (on J D)

    ;; stack on t2: A - I - K  (A on t2, I on A, K on I)
    (on A t2)
    (on I A)
    (on K I)

    ;; B alone on t3
    (on B t3)

    ;; stack on t4: F - G - H - E (F on t4, G on F, H on G, E on H)
    (on F t4)
    (on G F)
    (on H G)
    (on E H)

    ;; clear (top-of-stack) statuses for blocks that are initially top
    (clear J)
    (clear K)
    (clear B)
    (clear E)

    ;; some free table spots for temporary moves
    (clear t5)
    (clear t6)
    (clear t7)
    (clear t8)
    (clear t9)
    (clear t10)
    (clear t11)
    (clear t12)
  )

  (:goal (and
    ;; final full tower (bottom at t1): L - K - J - I - H - G - F - E - D - C - B - A
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
    (on L t1)
  ))
)