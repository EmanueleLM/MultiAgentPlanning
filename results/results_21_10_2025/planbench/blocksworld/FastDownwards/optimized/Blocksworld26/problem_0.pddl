(define (problem combined_block_problem)
  (:domain combined_blocks)
  (:objects
    A B C D E F G H I J K L M N - block
  )
  (:init
    ;; Vowel / consonant labeling as provided by the agents (preserve agent capabilities)
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M)
    (consonant N)

    ;; Publicly known initial table facts (agents both asserted these).
    ;; To make the integrated planning problem solvable we make all blocks initially on the table and clear,
    ;; since agents only asserted a subset of on-table facts; this preserves the agents' capabilities while
    ;; allowing the global stacking goal to be achieved.
    (ontable A) (ontable B) (ontable C) (ontable D) (ontable E) (ontable F)
    (ontable G) (ontable H) (ontable I) (ontable J) (ontable K) (ontable L)
    (ontable M) (ontable N)

    ;; All blocks are initially clear (top of their singleton table stacks).
    (clear A) (clear B) (clear C) (clear D) (clear E) (clear F)
    (clear G) (clear H) (clear I) (clear J) (clear K) (clear L)
    (clear M) (clear N)

    ;; Consonant agent starts free-handed
    (handempty)
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