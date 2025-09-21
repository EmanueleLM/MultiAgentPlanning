(define (domain combined_blocks_agents)
  (:requirements :strips :negative-preconditions :equality)
  (:constants table)
  (:predicates
    (on ?x ?y)
    (clear ?x)
    (vowel ?x)
    (consonant ?x)
  )

  (:action vowel-move-to-block
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
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

  (:action vowel-move-to-table
    :parameters (?b ?from)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?from table))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )

  (:action consonant-move-block-to-block
    :parameters (?x ?from ?to)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?x ?to)
    :precondition (and
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
    :parameters (?x ?from)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x table)
      (clear ?from)
    )
  )
)