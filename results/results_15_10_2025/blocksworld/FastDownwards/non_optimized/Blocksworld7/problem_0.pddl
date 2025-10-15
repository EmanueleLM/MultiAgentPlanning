(define (problem combined_rearrangement_problem)
  (:domain combined_agents)
  (:objects
    A B C D E F G H I J K L - block
  )
  (:init
    ;; Agent capabilities
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K) (consonant L)

    ;; Consonant-agent state
    (handempty)

    ;; Initial arrangement: minimal assumption (all blocks on the table and clear).
    ;; This is consistent with the consonant agent's subproblem assumption and
    ;; provides a fully grounded starting state so FastDownward can plan a coordinated solution.
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
    (ontable L) (clear L)
  )

  (:goal
    (and
      ;; Full desired stacked configuration (top-down):
      ;; A on B on C on D on E on F on G on H on I on J on K on L on table
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
      (ontable L)
    )
  )
)