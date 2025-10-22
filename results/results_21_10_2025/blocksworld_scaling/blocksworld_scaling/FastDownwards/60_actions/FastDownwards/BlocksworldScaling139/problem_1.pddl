(define (problem BlocksworldScaling139-problem)
  (:domain BlocksworldScaling139)

  (:objects
    A B C D E F G H I J K L - block
    table1 table2 table3 table4 - table
    ;; tables are places; blocks are also places for "on" predicate
    ;; (we use block objects as places when stacking on blocks)
  )

  (:init
    ;; Initial on relationships (public initial configuration)
    ;; Stack 1: table1 bottom G, A on G
    (on G table1)
    (on A G)

    ;; Stack 2: table2 bottom D, K on D, E on K, J on E, I on J
    (on D table2)
    (on K D)
    (on E K)
    (on J E)
    (on I J)

    ;; Stack 3: table3 bottom B, H on B, C on H, L on C
    (on B table3)
    (on H B)
    (on C H)
    (on L C)

    ;; Stack 4: table4 bottom F alone
    (on F table4)

    ;; clear facts for blocks that have nothing on top (top of each stack)
    (clear A)
    (clear I)
    (clear L)
    (clear F)

    ;; blocks that are not clear are not listed (negative-preconditions may be used in actions)

    ;; classification into vowels and consonants
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
  )

  ;; Goal: single descending stack with L on the table (we choose table4 as the final table)
  ;; From bottom upwards: L on table4, K on L, J on K, I on J, H on I, G on H, F on G,
  ;; E on F, D on E, C on D, B on C, A on B
  (:goal
    (and
      (on L table4)
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