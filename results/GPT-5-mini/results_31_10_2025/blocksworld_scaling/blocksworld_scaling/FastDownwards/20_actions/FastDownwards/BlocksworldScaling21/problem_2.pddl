(define (problem Blocksworld-MultiAgent-Problem)
  (:domain Blocksworld-MultiAgent)

  (:objects
    A E I H K F J B D G C - block
    S1 S2 S3 S4 S5 - stack
  )

  (:init
    ;; type classification
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

    ;; Initial stack memberships (in-stack facts)
    ;; Stack S1: A (bottom), K, D (top)
    (on-stack A S1)
    (on-stack K S1)
    (on-stack D S1)
    (on-block K A)
    (on-block D K)

    ;; Stack S2: H (bottom), E, F, G, C (top)
    (on-stack H S2)
    (on-stack E S2)
    (on-stack F S2)
    (on-stack G S2)
    (on-stack C S2)
    (on-block E H)
    (on-block F E)
    (on-block G F)
    (on-block C G)

    ;; Stack S3: I (bottom), J, B (top)
    (on-stack I S3)
    (on-stack J S3)
    (on-stack B S3)
    (on-block J I)
    (on-block B J)

    ;; Clear (top) predicates
    (clear-block D)
    (clear-block C)
    (clear-block B)

    ;; Empty buffer stacks are clear
    (clear-stack S4)
    (clear-stack S5)

    ;; Hands initially empty
    (v-handempty)
    (c-handempty)
  )

  (:goal
    (and
      (on-block A B)
      (on-block B C)
      (on-block C D)
      (on-block D E)
      (on-block E F)
      (on-block F G)
      (on-block G H)
      (on-block H I)
      (on-block I J)
      (on-block J K)
      (on-stack K S1)
      (clear-block A)
    )
  )
)