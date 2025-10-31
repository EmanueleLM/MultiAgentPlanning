(define (domain blocksworldscaling139)
  (:requirements :typing :negative-preconditions)
  (:types block table - place)

  (:predicates
    (on ?b - block ?p - place)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  (:action vowel_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel_move_table_to_block
    :parameters (?b - block ?from - table ?to - block)
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
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?b - block ?from - block ?to - table)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
    )
  )

  (:action consonant_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant_move_table_to_block
    :parameters (?b - block ?from - table ?to - block)
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
    )
  )

  (:action consonant_move_block_to_table
    :parameters (?b - block ?from - block ?to - table)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
    )
  )
)