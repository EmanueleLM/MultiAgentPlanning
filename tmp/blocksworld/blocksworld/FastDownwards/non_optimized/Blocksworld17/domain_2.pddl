(define (domain combined-blocks)
  (:requirements :typing :strips :equality :negative-preconditions)
  (:types agent block table - place)

  (:constants
    vowel_agent consonant_agent - agent
    table - table
  )

  (:predicates
    (is-vowel-agent ?a - agent)
    (is-consonant-agent ?a - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?b - block ?p - place)
    (clear ?b - block)
  )

  (:action vowel-move-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (is-vowel-agent ?ag)
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (is-vowel-agent ?ag)
      (vowel ?b)
      (clear ?b)
      (on ?b table)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (is-vowel-agent ?ag)
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )

  (:action consonant-move-block-to-block
    :parameters (?ag - agent ?x - block ?from - block ?to - block)
    :precondition (and
      (is-consonant-agent ?ag)
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?ag - agent ?x - block ?to - block)
    :precondition (and
      (is-consonant-agent ?ag)
      (consonant ?x)
      (on ?x table)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
    )
    :effect (and
      (not (on ?x table))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?ag - agent ?x - block ?from - block)
    :precondition (and
      (is-consonant-agent ?ag)
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (not (= ?x ?from))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x table)
      (clear ?from)
    )
  )
)