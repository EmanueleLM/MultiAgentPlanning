(define (problem BlocksworldScaling124-problem)
  (:domain blocksworld-multiagent)

  (:objects
    A I E O K L F B C G M N J D H - block
    S1 S2 - stack
  )

  (:init
    ;; Agent capabilities (vowel / consonant classification)
    (vowel A) (vowel E) (vowel I) (vowel O)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M) (consonant N)

    ;; Initial stacks encoded as "on block place" with bottom->top:
    ;; S1 bottom→top: A, I, O, F, B, G
    (on A S1)
    (on I A)
    (on O I)
    (on F O)
    (on B F)
    (on G B)

    ;; S2 bottom→top: E, H, D, K, L, M, C, N, J
    (on E S2)
    (on H E)
    (on D H)
    (on K D)
    (on L K)
    (on M L)
    (on C M)
    (on N C)
    (on J N)

    ;; Initially only the top blocks of each stack are clear
    (clear G)
    (clear J)

    ;; Stacks S1 and S2 are not clear (they have blocks on them), so (clear S1) and (clear S2) are false.
    ;; All other clear facts (for blocks under others) are false unless listed above.
  )

  (:goal
    (and
      ;; Final single stack bottom→top: O, N, M, L, K, J, I, H, G, F, E, D, C, B, A
      ;; i.e., A on B, B on C, ..., N on O, O on some table stack (choose S1 as the table stack)
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
      (on K L)
      (on L M)
      (on M N)
      (on N O)
      (on O S1)

      ;; Top block must be clear (A)
      (clear A)

      ;; The other (unused) stack S2 must be clear (empty) in the final configuration
      (clear S2)
    )
  )
)