(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)
  (:objects
    A B C D E F G H I J - block
    table - place
  )

  (:init
    ;; Initial stacks (unified representation: on X table)
    ;; Stack 1: H (table) <- D <- A <- C (top)
    (on H table)
    (on D H)
    (on A D)
    (on C A)

    ;; Stack 2: J (table) <- E <- F <- I <- G <- B (top)
    (on J table)
    (on E J)
    (on F E)
    (on I F)
    (on G I)
    (on B G)

    ;; Only top blocks are clear initially
    (clear C)
    (clear B)

    ;; Vowels (moved by vowel-agent actions)
    (vowel A)
    (vowel E)
    (vowel I)

    ;; Consonants (moved by consonant-agent actions)
    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
  )

  (:goal (and
    ;; Target single stack: J on table, I on J, H on I, G on H, F on G,
    ;; E on F, D on E, C on D, B on C, A on B (A is top)
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