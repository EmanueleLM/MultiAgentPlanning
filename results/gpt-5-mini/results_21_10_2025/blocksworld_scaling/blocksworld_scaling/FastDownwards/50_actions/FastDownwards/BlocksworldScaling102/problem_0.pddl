(define (problem integrate-vowels-consonants)
  (:domain blocks-multiagent)
  (:objects
    K G A H B F C L I M E J D - block
    table1 table2 table3 - place
  )

  (:init
    ;; initial stacking (bottom -> top)
    ;; stack1 = K, G, A, H, B, F, C  (K on table1)
    (on K table1)
    (on G K)
    (on A G)
    (on H A)
    (on B H)
    (on F B)
    (on C F)

    ;; stack2 = L, I, M, E, J, D  (L on table2)
    (on L table2)
    (on I L)
    (on M I)
    (on E M)
    (on J E)
    (on D J)

    ;; clear = top blocks only
    (clear C)
    (clear D)

    ;; type annotations as predicates
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

    ;; goal_below mapping (final required direct-support relation for each block)
    ;; Final chain: A on B, B on C, C on D, D on E, E on F, F on G, G on H, H on I, I on J, J on K, K on L, L on M, M on table.
    (goal_below A B)
    (goal_below B C)
    (goal_below C D)
    (goal_below D E)
    (goal_below E F)
    (goal_below F G)
    (goal_below G H)
    (goal_below H I)
    (goal_below I J)
    (goal_below J K)
    (goal_below K L)
    (goal_below L M)
    (goal_below M table1)
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
    (on J K)
    (on K L)
    (on L M)
    (on M table1)
  ))
)