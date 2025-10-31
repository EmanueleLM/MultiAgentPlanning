(define (problem Blocksworld-MultiAgent-Problem)
  (:domain Blocksworld-MultiAgent)

  (:objects
    ; blocks
    A E I H K F J B D G C - block
    ; table stack locations (three initial stacks + two empty buffers)
    S1 S2 S3 S4 S5 - stack
    ; reuse stacks also as places (blocks and stacks are places)
    S1 S2 S3 S4 S5 - place
  )

  (:init
    ; typing by predicates: vowels / consonants
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

    ; Initial on-relations (bottom -> top for each stack)
    ; Stack S1: A (bottom), K, D (top)
    (on A S1)
    (on K A)
    (on D K)

    ; Stack S2: H (bottom), E, F, G, C (top)
    (on H S2)
    (on E H)
    (on F E)
    (on G F)
    (on C G)

    ; Stack S3: I (bottom), J, B (top)
    (on I S3)
    (on J I)
    (on B J)

    ; located-in relations
    (located A S1) (located K S1) (located D S1)
    (located H S2) (located E S2) (located F S2) (located G S2) (located C S2)
    (located I S3) (located J S3) (located B S3)

    ; Clear (top) predicates: D (top of S1), C (top of S2), B (top of S3)
    (clear D)
    (clear C)
    (clear B)
    ; empty stacks S4 and S5 are clear (available buffer places)
    (clear S4)
    (clear S5)

    ; Hands initially empty
    (v-handempty)
    (c-handempty)
  )

  (:goal
    (and
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
      (on K S1)  ; K is on the table (we choose stack S1 as the table location for the final stack)
      ; ensure top-of-stack is A (implicitly satisfied by the chain, but we explicitly ensure A is clear)
      (clear A)
    )
  )
)