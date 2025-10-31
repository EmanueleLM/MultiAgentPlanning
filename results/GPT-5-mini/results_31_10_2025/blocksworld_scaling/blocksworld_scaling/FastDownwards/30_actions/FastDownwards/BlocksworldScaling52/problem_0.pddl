(define (problem stack-A-to-K)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K - block
    table - table
  )
  (:init
    ;; All blocks start on the table and are clear (no stacked blocks initially)
    (ontable A) (clear A)
    (ontable B) (clear B)
    (ontable C) (clear C)
    (ontable D) (clear D)
    (ontable E) (clear E)
    (ontable F) (clear F)
    (ontable G) (clear G)
    (ontable H) (clear H)
    (ontable I) (clear I)
    (ontable J) (clear J)
    (ontable K) (clear K)

    ;; Agent permissions encoded as strict constraints
    ;; Vowel agent may only move A, E, I
    (is-vowel A) (is-vowel E) (is-vowel I)

    ;; Consonant agent may move all other blocks
    (is-consonant B) (is-consonant C) (is-consonant D)
    (is-consonant F) (is-consonant G) (is-consonant H)
    (is-consonant J) (is-consonant K)
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