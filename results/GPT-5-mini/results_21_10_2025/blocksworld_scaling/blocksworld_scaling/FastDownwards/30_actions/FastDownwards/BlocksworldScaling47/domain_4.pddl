(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types support block - support)
  (:constants table - support)

  (:predicates
    (on ?b - block ?s - support)
    (clear ?s - support)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  (:action move-vowel-block-to-block
    :parameters (?b - block ?from - support ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - block ?from - support)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-cons-block-to-block
    :parameters (?b - block ?from - support ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-cons-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-cons-block-to-table
    :parameters (?b - block ?from - support)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
      (clear ?b)
    )
  )
)