(define (problem BlocksworldScaling136-problem)
  (:domain BlocksworldScaling136)
  (:objects
    A B C D E F G H I J K L M N O - block
    table1 table2 - table
  )

  (:init
    ;; Type labelling: vowels and consonants
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)
    ;; (U not present)

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

    ;; Initial two stacks (explicit on relationships):
    ;; Stack on table1: L (base) -> I -> C -> O -> N -> H -> B -> A (top)
    (on L table1)
    (on I L)
    (on C I)
    (on O C)
    (on N O)
    (on H N)
    (on B H)
    (on A B)

    ;; Stack on table2: F (base) -> K -> J -> E -> D -> M -> G (top)
    (on F table2)
    (on K F)
    (on J K)
    (on E J)
    (on D E)
    (on M D)
    (on G M)

    ;; Clear predicates: only top blocks are clear; tables are clear only if no block directly on them.
    (clear A)
    (clear G)
    ;; table1 and table2 are not clear because they have base blocks L and F, respectively.
    ;; The other blocks are not clear (implicitly false).
  )

  ;; Goal: single stack with O on a table and the exact above order:
  (:goal (and
    (on O table2)   ;; we allow the planner to construct the final stack on table2 (consistent with proposed_solution)
    (on N O)
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
  ))