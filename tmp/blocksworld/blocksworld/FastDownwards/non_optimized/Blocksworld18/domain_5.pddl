(define (domain blocks-multiagent)
  (:requirements :strips :typing :equality :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (is-vowel-agent ?a - agent)
    (is-consonant-agent ?a - agent)
  )

  (:action vowel-move-block-to-block
    :parameters (?agent - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (is-vowel-agent ?agent)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?agent - agent ?b - block ?to - block)
    :precondition (and
      (is-vowel-agent ?agent)
      (vowel ?b)
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

  (:action vowel-move-block-to-table
    :parameters (?agent - agent ?b - block ?from - block)
    :precondition (and
      (is-vowel-agent ?agent)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action consonant-move-block-to-block
    :parameters (?agent - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (is-consonant-agent ?agent)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?agent - agent ?b - block ?to - block)
    :precondition (and
      (is-consonant-agent ?agent)
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

  (:action consonant-move-block-to-table
    :parameters (?agent - agent ?b - block ?from - block)
    :precondition (and
      (is-consonant-agent ?agent)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )
)