(define (problem two-agent-blocks-problem)
  (:domain two-agent-blocks)

  (:objects
    A B C D E F G H I J K L - block
    t1 t2 t3 t4 t5 - table
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

    ;; table spot availability: t5 is initially free
    (clear t5)

    ;; top-of-stack (clear) statuses for blocks that are initially top
    (clear J)
    (clear K)
    (clear B)
    (clear E)

    ;; note: table spots t1..t4 are occupied as specified (no explicit (clear ...) for them)
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