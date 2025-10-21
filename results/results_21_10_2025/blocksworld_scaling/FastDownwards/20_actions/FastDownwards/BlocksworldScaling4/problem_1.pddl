(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)

  (:objects
    A B C D E F G H I J K L M N - block
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 - place
  )

  (:init
    ;; Initial stacks (bottom->top)
    ;; Stack1 (s1): H, M, N, G, K
    (on H s1)
    (on M H)
    (on N M)
    (on G N)
    (on K G)

    ;; Stack2 (s2): I, D, E, C, A
    (on I s2)
    (on D I)
    (on E D)
    (on C E)
    (on A C)

    ;; Stack3 (s3): L, J, B, F
    (on L s3)
    (on J L)
    (on B J)
    (on F B)

    ;; Clear facts: initial tops K, A, F are clear
    (clear K)
    (clear A)
    (clear F)

    ;; All extra table spots initially clear (s4..s18)
    (clear s4) (clear s5) (clear s6) (clear s7) (clear s8) (clear s9)
    (clear s10) (clear s11) (clear s12) (clear s13) (clear s14) (clear s15)
    (clear s16) (clear s17) (clear s18)

    ;; Note: s1, s2, s3 are occupied (not listed as clear)

    ;; Classify vowels and consonants
    (vowel A) (vowel E) (vowel I)

    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M)
    (consonant N)
  )

  ;; Goal: build single tower (bottom->top) on table spot s18:
  ;; N on s18, M on N, L on M, K on L, J on K, I on J, H on I, G on H,
  ;; F on G, E on F, D on E, C on D, B on C, A on B
  (:goal (and
    (on N s18)
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
  ))
)