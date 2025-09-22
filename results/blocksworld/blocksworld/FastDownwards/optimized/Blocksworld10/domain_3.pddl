(define (domain multi-agent-blocks)
  (:requirements :strips :typing :negative-preconditions :equality :adl)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  (:action move-vowel-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (clear ?to)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (clear ?to)
      (ontable ?b)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action move-consonant-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (clear ?to)
      (on ?x ?from)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-consonant-from-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (clear ?to)
      (ontable ?x)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (on ?x ?from)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
  )
)