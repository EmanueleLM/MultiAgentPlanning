(define (problem stack-all-onto-L)
  (:domain blocks-world-agent)
  (:objects
    A B C D E F G H I J K L - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; All blocks start on the table and are clear (no initial on relationships provided).
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

    ;; Hand status for agents: both start empty-handed.
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; Agent-specific controllability: vowel_agent may move vowels A, E, I; consonant_agent moves the others.
    (can-move vowel_agent A)
    (can-move vowel_agent E)
    (can-move vowel_agent I)

    (can-move consonant_agent B)
    (can-move consonant_agent C)
    (can-move consonant_agent D)
    (can-move consonant_agent F)
    (can-move consonant_agent G)
    (can-move consonant_agent H)
    (can-move consonant_agent J)
    (can-move consonant_agent K)
    (can-move consonant_agent L)
  )

  (:goal
    (and
      ;; Desired single stack: from bottom L upward: K J I H G F E D C B A
      (ontable L)
      (on K L)
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
    )
  )
)