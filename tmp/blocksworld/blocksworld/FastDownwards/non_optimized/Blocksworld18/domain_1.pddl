(define (domain blocks-multiagent)
  (:requirements :strips :typing :equality :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  (:action vowel_agent-move-block-to-block
    :parameters (?v - block ?from - block ?to - block)
    :precondition (and
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
      (clear ?to)
      (not (= ?v ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?v ?from))
      (on ?v ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?v)
    )
  )

  (:action vowel_agent-move-table-to-block
    :parameters (?v - block ?to - block)
    :precondition (and
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

  (:action vowel_agent-move-block-to-table
    :parameters (?v - block ?from - block)
    :precondition (and
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

  (:action consonant_agent-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
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

  (:action consonant_agent-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
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

  (:action consonant_agent-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
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