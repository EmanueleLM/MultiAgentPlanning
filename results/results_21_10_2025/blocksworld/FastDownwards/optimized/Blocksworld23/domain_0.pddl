(define (domain multi-agent-blocks)
  (:requirements :strips)
  (:predicates
    (on ?b ?s)                ; block ?b is on block or on the table (support)
    (clear ?b)                ; nothing on top of block ?b
    (agent-can-move ?agent ?b) ; agent is allowed to move block ?b
  )

  ;; Vowel-agent actions (vowel_agent can move only vowel-labelled blocks)
  (:action vowel-move-block-to-block
    :parameters (?b ?from ?to)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (agent-can-move vowel_agent ?b)
    )
    :effect (and
      (on ?b ?to)
      (not (on ?b ?from))
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?b ?to)
    :precondition (and
      (on ?b table)
      (clear ?b)
      (clear ?to)
      (agent-can-move vowel_agent ?b)
    )
    :effect (and
      (on ?b ?to)
      (not (on ?b table))
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?b ?from)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (agent-can-move vowel_agent ?b)
    )
    :effect (and
      (on ?b table)
      (not (on ?b ?from))
      (clear ?from)
    )
  )

  ;; Consonant-agent actions (consonant_agent can move only consonant-labelled blocks)
  (:action consonant-move-block-to-block
    :parameters (?b ?from ?to)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (agent-can-move consonant_agent ?b)
    )
    :effect (and
      (on ?b ?to)
      (not (on ?b ?from))
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?b ?to)
    :precondition (and
      (on ?b table)
      (clear ?b)
      (clear ?to)
      (agent-can-move consonant_agent ?b)
    )
    :effect (and
      (on ?b ?to)
      (not (on ?b table))
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?b ?from)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (agent-can-move consonant_agent ?b)
    )
    :effect (and
      (on ?b table)
      (not (on ?b ?from))
      (clear ?from)
    )
  )
)