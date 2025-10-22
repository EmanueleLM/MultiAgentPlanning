(define (problem arrange-chain)
  (:domain vowel-consonant-blocks)
  (:objects
    ;; stacks (initial stack bases)
    S1 S2 S3 - stack
    ;; table positions (empty initially)
    T1 T2 T3 - tablepos
    ;; blocks: vowels and consonants typed
    A E I - vowel
    B C D F G H J - consonant
  )
  (:init
    ;; Initial direct support (bottom -> top for each stack)
    ;; Stack1 bottom→top: A, E, C, G, B
    (on A S1)
    (on E A)
    (on C E)
    (on G C)
    (on B G)
    ;; Stack2 bottom→top: H, J
    (on H S2)
    (on J H)
    ;; Stack3 bottom→top: I, F, D
    (on I S3)
    (on F I)
    (on D F)

    ;; on-stack annotations: all blocks that are on one of the stacks (S1,S2,S3)
    (on-stack A S1)
    (on-stack E S1)
    (on-stack C S1)
    (on-stack G S1)
    (on-stack B S1)

    (on-stack H S2)
    (on-stack J S2)

    (on-stack I S3)
    (on-stack F S3)
    (on-stack D S3)

    ;; Clear (top blocks)
    (clear B)
    (clear J)
    (clear D)

    ;; Table positions empty initially
    (empty T1)
    (empty T2)
    (empty T3)
  )

  (:goal (and
    ;; Final desired vertical ordering:
    ;; A on B, B on C, C on D, D on E, E on F, F on G, G on H, H on I, I on J, and J on table (choose T1)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J T1)
  ))