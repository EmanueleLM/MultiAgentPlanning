(define (problem blocks-multiagent-problem)
  (:domain blocks-multi-agent)

  (:objects
    I A E M N B G D C J K F L H - block
    table - object
  )

  (:init
    ; type markers (vowel / consonant)
    (vowel I)
    (vowel A)
    (vowel E)

    (consonant M) (consonant N) (consonant B) (consonant G) (consonant D)
    (consonant C) (consonant J) (consonant K) (consonant F) (consonant L) (consonant H)

    ; initial stacks encoded as on(block, supporter)
    ; Stack 1 bottom->top: I, N, D, A, J, K, F, H
    (on I table)
    (on N I)
    (on D N)
    (on A D)
    (on J A)
    (on K J)
    (on F K)
    (on H F)

    ; Stack 2 bottom->top: M, B, G, C, E, L
    (on M table)
    (on B M)
    (on G B)
    (on C G)
    (on E C)
    (on L E)

    ; only top blocks are clear initially
    (clear H)
    (clear L)

    ; table is available (kept true)
    (clear table)
  )

  (:goal (and
    ; target single stack bottom->top: N, M, L, K, J, I, H, G, F, E, D, C, B, A
    (on N table)
    (on M N)
    (on L M)
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
    (clear A)
  ))
)