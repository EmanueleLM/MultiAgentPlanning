(define (problem multiagent-blocks-goal)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K L M N - block
  )
  (:init
    ;; Agent capabilities (private split encoded here as public predicates)
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    ;; Single hand initially empty
    (handempty)

    ;; Initial configuration (two stacks)
    ;; Stack1 bottom->top: D (table) - A - F - L - K - N - B - I (top)
    (ontable D)
    (on A D)
    (on F A)
    (on L F)
    (on K L)
    (on N K)
    (on B N)
    (on I B)

    ;; Stack2 bottom->top: H (table) - M - G - E - C - J (top)
    (ontable H)
    (on M H)
    (on G M)
    (on E G)
    (on C E)
    (on J C)

    ;; Clear blocks: tops of the two stacks
    (clear I)
    (clear J)
  )

  (:goal (and
    (on A B) (on B C) (on C D) (on D E) (on E F) (on F G)
    (on G H) (on H I) (on I J) (on J K) (on K L) (on L M)
    (on M N)
    (ontable N)
  ))
)