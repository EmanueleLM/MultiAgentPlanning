(define (problem multi-agent-blocksworld-problem)
  (:domain multi-agent-blocksworld)

  (:objects
    A B C D E F G H I J K - block
  )

  (:init
    ;; Initial stacks (bottom-to-top):
    ;; Stack1: J, H, B, F, C, K
    (ontable J)
    (on H J)
    (on B H)
    (on F B)
    (on C F)
    (on K C)

    ;; Stack2: A, G, E, D, I
    (ontable A)
    (on G A)
    (on E G)
    (on D E)
    (on I D)

    ;; Clear (top blocks initially)
    (clear K)
    (clear I)

    ;; Vowel / consonant classification
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
  )

  ;; Global goal: single stack bottom-to-top K, J, I, H, G, F, E, D, C, B, A with K on the table
  (:goal (and
    (ontable K)
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