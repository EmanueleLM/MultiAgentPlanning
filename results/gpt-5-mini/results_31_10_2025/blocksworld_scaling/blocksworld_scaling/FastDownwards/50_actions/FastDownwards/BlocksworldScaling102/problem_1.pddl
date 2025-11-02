(define (problem BlocksworldScaling102)
  (:domain blocksworld-multiagent)
  (:objects
    K G A H B F C L I M E J D - block
    table1 table2 table3 - place
  )

  (:init
    ;; initial stacking (bottom -> top)
    ;; stack1 on table1 = K, G, A, H, B, F, C
    (on K table1)
    (on G K)
    (on A G)
    (on H A)
    (on B H)
    (on F B)
    (on C F)

    ;; stack2 on table2 = L, I, M, E, J, D
    (on L table2)
    (on I L)
    (on M I)
    (on E M)
    (on J E)
    (on D J)

    ;; clear predicates: only the top blocks
    (clear C)
    (clear D)

    ;; letter-type predicates
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant K)
    (consonant G)
    (consonant H)
    (consonant B)
    (consonant F)
    (consonant C)
    (consonant L)
    (consonant M)
    (consonant J)
    (consonant D)
  )

  ;; Goal: final single chain (bottom -> top) built on table3:
  ;; M on table3, L on M, K on L, J on K, I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
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
    (on J K)
    (on K L)
    (on L M)
    (on M table3)
  ))
)