(define (problem block-stacking-multiagent-problem)
  (:domain block-stacking-multiagent)
  (:objects
    A B C D E F G H I J K L M N
    s1 s2 s3 s4 s5 s6 s7
  )

  (:init
    ;; Initial stacks (given bottom->top)
    ;; Stack1: H, M, N, G, K  (H on s1, M on H, N on M, G on N, K on G)
    (on H s1)
    (on M H)
    (on N M)
    (on G N)
    (on K G)

    ;; Stack2: I, D, E, C, A  (I on s2, D on I, E on D, C on E, A on C)
    (on I s2)
    (on D I)
    (on E D)
    (on C E)
    (on A C)

    ;; Stack3: L, J, B, F (L on s3, J on L, B on J, F on B)
    (on L s3)
    (on J L)
    (on B J)
    (on F B)

    ;; Clear/top-of-stack predicates: tops are K (stack1), A (stack2), F (stack3)
    (clear K)
    (clear A)
    (clear F)

    ;; Empty/new table spots available to the consonant agent (S4..S7)
    (clear s4)
    (clear s5)
    (clear s6)
    (clear s7)

    ;; Table spots s1,s2,s3 are initially occupied (not clear) so no clear(s1/s2/s3) facts.

    ;; Vowel / consonant classification
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
    (consonant M)
    (consonant N)
  )

  ;; Global goal: build single tower (bottom->top): N (on table s4), M on N, L on M, K on L, J on K,
  ;; I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
  ;; (Matches the provided goal chain; we choose s4 as the final table spot for N,
  ;; consistent with the consonant agent's plan to place N on S4.)
  (:goal (and
    (on N s4)
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