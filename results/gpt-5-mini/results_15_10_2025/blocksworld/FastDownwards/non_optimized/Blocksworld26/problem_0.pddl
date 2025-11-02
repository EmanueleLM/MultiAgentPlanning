(define (problem combined-blocks-problem)
  (:domain combined-blocks)
  (:objects
    A B C D E F G H I J K L M N - block
  )

  (:init
    ;; Agent capabilities
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    ;; Publicly-known table placements / top / clear facts (mapped to the unified predicates)
    (on-table B)
    (on-table G)
    (on-table I)

    (top B)
    (top G)
    (top I)

    (clear B)
    (clear G)
    (clear I)

    ;; Note: Other on/on-table/clear/top facts are intentionally left unspecified
    ;; because the agents' inputs did not provide them; planner will rely on moves
    ;; consistent with these known facts to achieve the goal.
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
    (on-table N)
  ))
)