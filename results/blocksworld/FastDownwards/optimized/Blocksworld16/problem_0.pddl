(define (problem blocks_stack_vowel_consonant)
  (:domain blocks_multiagent)
  (:objects
    A E I - vowel
    B C D F G H J K L M - consonant
  )

  (:init
    ;; Initial stacks as provided:
    ;; Stack 1: B (table) <- C <- D <- H (top)
    (ontable B)
    (on C B)
    (on D C)
    (on H D)

    ;; Stack 2: E (table) <- J <- F <- G <- L (top)
    (ontable E)
    (on J E)
    (on F J)
    (on G F)
    (on L G)

    ;; Stack 3: K (table) <- I <- M <- A (top)
    (ontable K)
    (on I K)
    (on M I)
    (on A M)

    ;; Clear (top) blocks:
    (clear H)
    (clear L)
    (clear A)

    ;; Both agents start with empty hands:
    (v-handempty)
    (c-handempty)
  )

  (:goal (and
    ;; Goal chain top-to-bottom: A on B on C on D on E on F on G on H on I on J on K on L on M (with M on table)
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
    (ontable M)
  ))
)