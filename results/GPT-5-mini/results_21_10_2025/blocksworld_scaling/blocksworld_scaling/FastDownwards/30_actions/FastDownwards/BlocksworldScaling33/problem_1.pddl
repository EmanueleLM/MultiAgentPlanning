(define (problem blocksworld-vowel-consonant-problem)
  (:domain blocksworld-vowel-consonant)
  (:objects
    A E I   G B D M J N H C F K L - block
  )

  (:init
    ; typing of vowels and consonants
    (vowel A) (vowel E) (vowel I)
    (consonant G) (consonant B) (consonant D) (consonant M) (consonant J)
    (consonant N) (consonant H) (consonant C) (consonant F) (consonant K) (consonant L)

    ; initial stacks (on X Y means X is directly on Y)
    ; Stack1: G on table, B on G, J on B, N on J, A on N, C on A, K on C
    (ontable G)
    (on B G)
    (on J B)
    (on N J)
    (on A N)
    (on C A)
    (on K C)

    ; Stack2: D on table, M on D, H on M, F on H, I on F, E on I, L on E
    (ontable D)
    (on M D)
    (on H M)
    (on F H)
    (on I F)
    (on E I)
    (on L E)

    ; clear blocks = those with nothing on them (top of each initial stack)
    (clear K)
    (clear L)

    ; Note: All other blocks are not clear initially (they have something on them)
  )

  (:goal (and
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
    (ontable N)
  ))
)