(define (domain combined-blocks)
  (:requirements :strips :typing :equality :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (top ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  (:action vowel_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (top ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (top ?from)
      (not (clear ?to))
      (not (top ?to))
      (clear ?b)
      (top ?b)
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (top ?b)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on-table ?b)
      (clear ?from)
      (top ?from)
      (clear ?b)
      (top ?b)
    )
  )

  (:action vowel_move_table_to_block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on-table ?b)
      (top ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on-table ?b))
      (on ?b ?to)
      (not (clear ?to))
      (not (top ?to))
      (clear ?b)
      (top ?b)
    )
  )

  (:action consonant_move_from_block_to_block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (consonant ?x)
      (consonant ?to)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
      (top ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (top ?from)
      (not (clear ?to))
      (not (top ?to))
      (clear ?x)
      (top ?x)
    )
  )

  (:action consonant_move_from_table_to_block
    :parameters (?x - block ?to - block)
    :precondition (and
      (consonant ?x)
      (consonant ?to)
      (on-table ?x)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
      (top ?x)
    )
    :effect (and
      (not (on-table ?x))
      (on ?x ?to)
      (not (clear ?to))
      (not (top ?to))
      (clear ?x)
      (top ?x)
    )
  )

  (:action consonant_move_from_block_to_table
    :parameters (?x - block ?from - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (top ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (on-table ?x)
      (clear ?from)
      (top ?from)
      (clear ?x)
      (top ?x)
    )
  )
)