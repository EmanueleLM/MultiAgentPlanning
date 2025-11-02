(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    A B C D E F G H I J K L - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; block types
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K) (consonant L)

    ;; initial arrangement: all blocks on the table and clear
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

    ;; agent role declarations
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; both agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  ;; Global goal: produce the single stack A on B on C on D on E on F on G on H on I on J on K on L on table
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
    (ontable L)
  ))
)