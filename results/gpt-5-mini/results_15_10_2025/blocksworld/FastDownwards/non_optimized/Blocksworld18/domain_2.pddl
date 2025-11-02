(define (domain blocks-multiagent)
  (:requirements :strips :typing :equality :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  (:action move-vowel-block-to-block
    :parameters (?ag - agent ?v - block ?from - block ?to - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
      (clear ?to)
      (not (= ?v ?to))
      (not (= ?from ?to))
      (not (= ?v ?from))
    )
    :effect (and
      (not (on ?v ?from))
      (on ?v ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?v)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?ag - agent ?v - block ?to - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?v)
      (ontable ?v)
      (clear ?v)
      (clear ?to)
      (not (= ?v ?to))
    )
    :effect (and
      (not (ontable ?v))
      (on ?v ?to)
      (not (clear ?to))
      (clear ?v)
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?ag - agent ?v - block ?from - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
      (not (= ?v ?from))
    )
    :effect (and
      (not (on ?v ?from))
      (ontable ?v)
      (clear ?v)
      (clear ?from)
    )
  )

  (:action move-consonant-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
      (not (= ?from ?to))
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-consonant-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?b)
      (clear ?from)
    )
  )
)