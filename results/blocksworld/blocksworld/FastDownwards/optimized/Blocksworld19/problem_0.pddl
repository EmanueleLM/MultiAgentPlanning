(define (problem integrated-stacking)
  (:domain integrated-blocks)
  (:objects
    vowel_agent consonant_agent - agent
    G H L I J C D B F M A K E - block
  )
  (:init
    ;; initial "on" relations (stacks)
    (on L G) (on J L) (on B J)
    (on C H) (on M C)
    (on D I) (on F D)
    (on K A) (on E K)

    ;; blocks on the table
    (on-table G) (on-table H) (on-table I) (on-table A)

    ;; clear (tops of stacks)
    (clear B) (clear M) (clear F) (clear E)

    ;; agents are free at start
    (handempty vowel_agent) (handempty consonant_agent)

    ;; agent roles
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; block classifications (based on their labels)
    (vowel A) (vowel E) (vowel I)
    (consonant G) (consonant H) (consonant L) (consonant J) (consonant C)
    (consonant D) (consonant B) (consonant F) (consonant M) (consonant K)

    ;; movement permissions known by the second agent (kept as information;
 actions above use agent-role predicates)
    (can-move consonant_agent B) (can-move consonant_agent C) (can-move consonant_agent D)
    (can-move consonant_agent F) (can-move consonant_agent G) (can-move consonant_agent H)
    (can-move consonant_agent J) (can-move consonant_agent K) (can-move consonant_agent L)
    (can-move consonant_agent M)
    (can-move vowel_agent A) (can-move vowel_agent E) (can-move vowel_agent I)
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
    (on-table M)
  ))
)