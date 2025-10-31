(define (problem blocks-problem1)
  (:domain blocks-vowel-consonant)
  (:objects
    A B C D E F G H I J - block
    table - surface
  )
  (:init
    ;; initial stacking (three stacks plus two singletons on the table)
    ;; Stack 1: C on B on A on table  (C top)
    (on C B)
    (on B A)
    (on A table)

    ;; Stack 2: F on E on table (F top)
    (on F E)
    (on E table)

    ;; Stack 3: I on H on G on table (I top)
    (on I H)
    (on H G)
    (on G table)

    ;; Singletons on table
    (on D table)
    (on J table)

    ;; clear = nothing on top of these blocks
    (clear C)
    (clear F)
    (clear I)
    (clear D)
    (clear J)

    ;; typing of blocks by agent capability
    ;; Vowels: A, E, I
    (vowel A)
    (vowel E)
    (vowel I)

    ;; Consonants: B, C, D, F, G, H, J
    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
  )
  ;; Global goal: all blocks directly on the table (flatten all stacks)
  (:goal (and
    (on A table)
    (on B table)
    (on C table)
    (on D table)
    (on E table)
    (on F table)
    (on G table)
    (on H table)
    (on I table)
    (on J table)
  ))
)