(define (problem stack-A-on-B-to-K)
  (:domain multi-agent-blocks)
  (:objects
    A B C D E F G H I J K - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; All blocks start on the table and are clear
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

    ;; Agents are initially free-handed
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; Agent classifications (keep vowel_agent and consonant_agent actions distinct)
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; Manipulation capabilities:
    ;; Vowel agent may only manipulate vowel-named blocks present (A, E, I)
    (can-move vowel_agent A)
    (can-move vowel_agent E)
    (can-move vowel_agent I)

    ;; Consonant agent may manipulate the remaining consonant blocks
    (can-move consonant_agent B)
    (can-move consonant_agent C)
    (can-move consonant_agent D)
    (can-move consonant_agent F)
    (can-move consonant_agent G)
    (can-move consonant_agent H)
    (can-move consonant_agent J)
    (can-move consonant_agent K)
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