(define (problem multi-agent-blocks-problem)
  (:domain multi-agent-blocks)
  (:objects
    a b c d e f g h i j
    vowel_agent consonant_agent
  )

  (:init
    ;; Initial placements (blocks on table or on other blocks)
    (on-table a)
    (on-table i)
    (on g a)
    (on-table e)
    (on b e)
    (on j h)
    (on c j)
    (on d b)
    (on f c)
    (on-table h)

    ;; Top/clear blocks from initial configuration
    (clear g)
    (clear i)
    (clear d)
    (clear f)

    ;; Hands start empty
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; Movement permissions (availability constraints)
    ;; vowel_agent can move vowels: a, e, i
    (agent-can-move vowel_agent a)
    (agent-can-move vowel_agent e)
    (agent-can-move vowel_agent i)

    ;; consonant_agent can move consonants: h, g, b, j, c, d, f
    (agent-can-move consonant_agent h)
    (agent-can-move consonant_agent g)
    (agent-can-move consonant_agent b)
    (agent-can-move consonant_agent j)
    (agent-can-move consonant_agent c)
    (agent-can-move consonant_agent d)
    (agent-can-move consonant_agent f)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on-table j)
  ))
)