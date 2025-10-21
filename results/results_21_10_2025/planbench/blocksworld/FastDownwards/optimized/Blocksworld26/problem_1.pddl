(define (problem build_chain_A_to_N)
  (:domain blocks_multiagent)
  (:objects
    A B C D E F G H I J K L M N - block
  )
  (:init
    ;; Labels
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M)
    (consonant N)

    ;; Initial stacks (represented bottom -> ... -> top)
    ;; Stack 1: B (bottom) - D - C (top)
    (ontable B)
    (on D B)
    (on C D)

    ;; Stack 2: G (bottom) - L - K - F - H - E (top)
    (ontable G)
    (on L G)
    (on K L)
    (on F K)
    (on H F)
    (on E H)

    ;; Stack 3: I (bottom) - M - J - A - N (top)
    (ontable I)
    (on M I)
    (on J M)
    (on A J)
    (on N A)

    ;; Clear: only the top blocks of each initial stack
    (clear C)
    (clear E)
    (clear N)

    ;; Both agents start with empty hands
    (handempty_vowel)
    (handempty_cons)
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