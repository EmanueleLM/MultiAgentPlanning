(define (problem integrated_task)
  (:domain multi_agent_blocks)
  (:objects
    A B C D E F G H I J K table
  )
  (:init
    ;; Vowel / consonant classification (from the two agents' inputs)
    (vowel A) (vowel E) (vowel I)
    (consonant J) (consonant G) (consonant K) (consonant F)
    (consonant C) (consonant H) (consonant D) (consonant B)

    ;; Initial configuration (combined)
    (on J table)
    (on A table)
    (on G A)
    (on K J)
    (on F K)
    (on C G)
    (on H F)
    (on D H)
    (on E C)
    (on I E)
    (on B I)

    ;; Clear (top) blocks from the initial state
    (clear B)
    (clear D)
  )

  ;; Orchestrator goal: full stacked chain (A on B on C ... on K on table)
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
    (on K table)
  ))
)