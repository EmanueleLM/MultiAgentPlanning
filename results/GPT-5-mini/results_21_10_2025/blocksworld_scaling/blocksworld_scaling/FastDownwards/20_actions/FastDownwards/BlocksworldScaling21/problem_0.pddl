(define (problem pddl_orchestrator_problem)
  (:domain pddl_orchestrator)

  (:objects
    A E I H K F J B D G C - block
    S1 S2 S3 S4 S5 - stack
  )

  (:init
    ;; typing by predicates: which blocks are vowels vs consonants
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant H)
    (consonant K)
    (consonant F)
    (consonant J)
    (consonant B)
    (consonant D)
    (consonant G)
    (consonant C)

    ;; On-relations (bottom -> top per stack)
    ;; Stack S1: A (bottom) , K , D (top)
    (on A S1)
    (on K A)
    (on D K)

    ;; Stack S2: H (bottom), E, F, G, C (top)
    (on H S2)
    (on E H)
    (on F E)
    (on G F)
    (on C G)

    ;; Stack S3: I (bottom), J, B (top)
    (on I S3)
    (on J I)
    (on B J)

    ;; located-in relations: every block belongs to its stack
    (located A S1) (located K S1) (located D S1)
    (located H S2) (located E S2) (located F S2) (located G S2) (located C S2)
    (located I S3) (located J S3) (located B S3)

    ;; Clear (top) predicates: D, C, B are current tops; S4 and S5 are empty table stacks
    (clear D)
    (clear C)
    (clear B)
    (clear S4)
    (clear S5)

    ;; Non-clear items (explicitly absent as facts): A, K, H, E, F, G, I, J are not clear now.
    ;; Hands initially empty
    (v-handempty)
    (c-handempty)
  )

  (:goal (and
    ;; Global vowel-target relationships from shared goal:
    (on A B)
    (on E F)
    (on I J)
  ))
)