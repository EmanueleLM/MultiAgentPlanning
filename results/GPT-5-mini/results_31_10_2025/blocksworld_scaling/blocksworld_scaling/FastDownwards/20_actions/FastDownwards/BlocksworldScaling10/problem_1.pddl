(define (problem blocks-problem1)
  (:domain blocks-vowel-consonant)
  (:objects
    A B C D E F G H I J - block
    table - place
  )

  (:init
    ;; Initial stacks (as specified)
    ;; Stack1: G (on table), A on G, C on A
    (on G table)
    (on A G)
    (on C A)

    ;; Stack2: B (on table), J on B
    (on B table)
    (on J B)

    ;; Stack3: H (on table), D on H
    (on H table)
    (on D H)

    ;; Stack4: I (on table), E on I, F on E
    (on I table)
    (on E I)
    (on F E)

    ;; clear top blocks (only blocks with nothing above them)
    (clear C)
    (clear J)
    (clear D)
    (clear F)

    ;; typing of blocks by agent capability
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
  )

  ;; Global goal: the specified single tower with J on the table, I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
  (:goal (and
    (on J table)
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