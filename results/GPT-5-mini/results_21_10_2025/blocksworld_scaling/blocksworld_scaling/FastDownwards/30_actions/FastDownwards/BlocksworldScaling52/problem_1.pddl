(define (problem stack-A-to-K)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K - block
    table - table
  )
  (:init
    ;; Initial stacks (explicit)
    (on C B)
    (ontable B)

    (on G D)
    (on D I)
    (ontable I)

    (on A J)
    (on J K)
    (ontable K)

    (on H E)
    (on E F)
    (ontable F)

    ;; Clear = true only for blocks that have no block above them initially:
    ;; top blocks are C, G, A, H
    (clear C)
    (clear G)
    (clear A)
    (clear H)

    ;; Mark vowel and consonant permissions
    (is-vowel A)
    (is-vowel E)
    (is-vowel I)

    (is-consonant B)
    (is-consonant C)
    (is-consonant D)
    (is-consonant F)
    (is-consonant G)
    (is-consonant H)
    (is-consonant J)
    (is-consonant K)
  )

  ;; Goal: produce the vertical stack A on B on C on D on E on F on G on H on I on J on K,
  ;; with K on the table. (The planner must reach this arrangement.)
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