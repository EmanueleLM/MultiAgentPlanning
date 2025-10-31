(define (domain blocksworld-two-agents)
  (:requirements :typing :negative-preconditions)
  (:types block agent)

  (:constants TABLE - block)

  (:predicates
    (on ?b - block ?x - block)
    (clear ?b - block)
    (is-vowel ?b - block)
    (is-consonant ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
    (table ?b - block)
  )

  ;; VOWEL AGENT ACTIONS: may move only blocks marked is-vowel.
  ;; Top-only moves, may move between blocks or to/from TABLE.
  (:action vowel-move-block-to-block
    :parameters (?a - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (vowel-agent ?a)
      (is-vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (table ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?a - agent ?b - block ?to - block)
    :precondition (and
      (vowel-agent ?a)
      (is-vowel ?b)
      (on ?b TABLE)
      (clear ?b)
      (clear ?to)
      (not (table ?to))
    )
    :effect (and
      (not (on ?b TABLE))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?a - agent ?b - block ?from - block)
    :precondition (and
      (vowel-agent ?a)
      (is-vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (not (table ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b TABLE)
      (clear ?from)
    )
  )

  ;; CONSONANT AGENT ACTIONS: may move only blocks marked is-consonant.
  (:action consonant-move-block-to-block
    :parameters (?a - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (consonant-agent ?a)
      (is-consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (table ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?a - agent ?b - block ?to - block)
    :precondition (and
      (consonant-agent ?a)
      (is-consonant ?b)
      (on ?b TABLE)
      (clear ?b)
      (clear ?to)
      (not (table ?to))
    )
    :effect (and
      (not (on ?b TABLE))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?a - agent ?b - block ?from - block)
    :precondition (and
      (consonant-agent ?a)
      (is-consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (not (table ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b TABLE)
      (clear ?from)
    )
  )
)