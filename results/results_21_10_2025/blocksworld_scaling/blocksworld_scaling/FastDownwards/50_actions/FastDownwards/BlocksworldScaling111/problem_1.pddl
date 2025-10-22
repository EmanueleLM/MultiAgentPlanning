(define (problem BlocksworldScaling111-problem) 
  (:domain BlocksworldScaling111)
  (:objects
    A B C D E F G H I J K - block
  )

  (:init
    ;; type membership via is-vowel / is-consonant
    (is-vowel A) (is-vowel E) (is-vowel I)
    (is-consonant B) (is-consonant C) (is-consonant D) (is-consonant F) (is-consonant G) (is-consonant H) (is-consonant J) (is-consonant K)

    ;; initial stacks: Stack1 bottom->top: D, H, E, J, K
    (ontable D)
    (on H D)
    (on E H)
    (on J E)
    (on K J)

    ;; Stack2 bottom->top: C, A, G, B, F, I
    (ontable C)
    (on A C)
    (on G A)
    (on B G)
    (on F B)
    (on I F)

    ;; clear = top blocks of stacks
    (clear K)
    (clear I)

    ;; any block that has something on it is implicitly not clear (no predicate for those)
    ;; any block that is on the table but has a block on it is not marked clear, e.g., D and C are not clear
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
    (ontable K)
  ))
)