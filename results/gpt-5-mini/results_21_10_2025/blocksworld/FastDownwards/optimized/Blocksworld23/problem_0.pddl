(define (problem multi-agent-blocks-problem)
  (:domain multi-agent-blocks)
  (:objects
    H A I G E B J C D F
    vowel_agent consonant_agent
    table
  )

  (:init
    ;; initial placements
    (on H table)
    (on A table)
    (on I table)
    (on G A)
    (on E table)
    (on B E)
    (on J H)
    (on C J)
    (on D B)
    (on F C)

    ;; clear = top blocks (nothing on top of these blocks)
    (clear G)
    (clear I)
    (clear D)
    (clear F)

    ;; agent move permissions (hard constraints)
    (agent-can-move vowel_agent A)
    (agent-can-move vowel_agent E)
    (agent-can-move vowel_agent I)

    (agent-can-move consonant_agent H)
    (agent-can-move consonant_agent G)
    (agent-can-move consonant_agent B)
    (agent-can-move consonant_agent J)
    (agent-can-move consonant_agent C)
    (agent-can-move consonant_agent D)
    (agent-can-move consonant_agent F)
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
    (on J table)
  ))
)