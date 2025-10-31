(define (domain blocks_agents)
  (:requirements :strips :typing)
  (:types
    vowel consonant - block
    block table - object
  )

  (:predicates
    (on ?b - block ?x - object)   ; block ?b is directly on object ?x (block or table)
    (clear ?b - block)            ; block ?b has no block on top (is a top block)
  )

  ;; Vowel moves: four action schemas to avoid conditional effects
  (:action move-vowel-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - vowel ?from - block ?to - table)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - vowel ?from - table ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-vowel-table-to-table
    :parameters (?b - vowel ?from - table ?to - table)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?b)
    )
  )

  ;; Consonant moves: symmetric separate schemas
  (:action move-consonant-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?b - consonant ?from - block ?to - table)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-consonant-table-to-block
    :parameters (?b - consonant ?from - table ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action move-consonant-table-to-table
    :parameters (?b - consonant ?from - table ?to - table)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?b)
    )
  )
)