(define (domain two_agent_blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  (:action vowel_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (vowel ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action vowel_move_table_to_block
    :parameters (?b - block ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (vowel ?b)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?b - block ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  (:action consonant_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (consonant ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant_move_table_to_block
    :parameters (?b - block ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (consonant ?b)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant_move_block_to_table
    :parameters (?b - block ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)