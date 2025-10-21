(define (problem two-agent-blocks-problem)
  (:domain two-agent-blocks)

  ;; Objects: blocks and one table (place).
  (:objects
    A B C D E F - block
    table - place
  )

  ;; Initial state matches the provided stack configuration (top-to-bottom listing
  ;; was interpreted as: Stack 1: A B C   Stack 2: D E   Stack 3: F).
  ;; That corresponds to the following on-relations (top element on the next):
  ;; A on B, B on C, C on table
  ;; D on E, E on table
  ;; F on table
  (:init
    ;; on relations
    (on A B)
    (on B C)
    (on C table)

    (on D E)
    (on E table)

    (on F table)

    ;; clear = blocks that are currently the top of their stacks
    (clear A)
    (clear D)
    (clear F)

    ;; blocks that are not clear are intentionally not listed (they are implicitly false)

    ;; vowel / consonant classification (A and E are vowels per the vowel-agent description)
    (vowel A)
    (vowel E)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
  )

  ;; Global goal: a single chain (one stack) with the following bottom-to-top order:
  ;; C (on table) -> B -> A -> D -> E -> F   i.e. (on B C) (on A B) (on D A) (on E D) (on F E) and C on table.
  (:goal (and
    (on C table)
    (on B C)
    (on A B)
    (on D A)
    (on E D)
    (on F E)
  ))
)