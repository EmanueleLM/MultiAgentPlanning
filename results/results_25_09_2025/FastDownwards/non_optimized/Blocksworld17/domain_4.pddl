(define (domain combined-blocks)
  (:requirements :strips :equality :negative-preconditions)
  (:predicates
    (is-vowel-agent ?a)
    (is-consonant-agent ?a)
    (vowel ?b)
    (consonant ?b)
    (on ?b ?p)
    (clear ?b)
  )

  (:action vowel-move-block-to-block
    :parameters (?ag ?b ?from ?to)
    :precondition (and
      (is-vowel-agent ?ag)
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
      (not (= ?b ?to))
      (not (= ?from table))
      (not (= ?to table))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?ag ?b ?to)
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
    :parameters (?ag ?b ?from)
    :precondition (and
      (is-vowel-agent ?ag)
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (not (= ?b ?from))
      (not (= ?from table))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )

  (:action consonant-move-block-to-block
    :parameters (?ag ?x ?from ?to)
    :precondition (and
      (is-consonant-agent ?ag)
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
      (not (= ?from table))
      (not (= ?to table))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?ag ?x ?to)
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
    :parameters (?ag ?x ?from)
    :precondition (and
      (is-consonant-agent ?ag)
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (not (= ?x ?from))
      (not (= ?from table))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x table)
      (clear ?from)
    )
  )
)