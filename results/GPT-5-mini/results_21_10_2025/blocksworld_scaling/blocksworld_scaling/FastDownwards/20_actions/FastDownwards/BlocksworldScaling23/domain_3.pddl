(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)

  (:types support block)

  (:constants
    table - support
  )

  (:predicates
    (on ?b - block ?s - support)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; VOWEL AGENT ACTIONS
  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (on ?b ?from) (clear ?b) (vowel ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
              (clear ?b)
            )
  )

  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (on ?b table) (clear ?b) (clear ?to) (vowel ?b))
    :effect (and
              (not (on ?b table))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to) (vowel ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
              (clear ?b)
            )
  )

  ;; CONSONANT AGENT ACTIONS
  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (on ?b ?from) (clear ?b) (consonant ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
              (clear ?b)
            )
  )

  (:action consonant-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (on ?b table) (clear ?b) (clear ?to) (consonant ?b))
    :effect (and
              (not (on ?b table))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to) (consonant ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
              (clear ?b)
            )
  )
)