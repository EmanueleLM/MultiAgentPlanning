(define (domain multiagent_blocks)
  (:requirements :strips :typing :action-costs)
  (:types block agent object)
  (:constants table - object)
  (:predicates
    (on ?b - block ?p - object)
    (clear ?p - object)
    (vowel ?b - block)
    (consonant ?b - block)
    (vowel_agent ?a - agent)
    (consonant_agent ?a - agent)
    (stacks_4)
    (max_height_12)
  )

  ;; Vowel agent actions (operate only on vowel blocks)
  (:action vowel_move_block_to_block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (vowel_agent ?ag)
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
    :cost 1
  )

  (:action vowel_move_table_to_block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (vowel_agent ?ag)
      (vowel ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
    :cost 1
  )

  (:action vowel_move_block_to_table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (vowel_agent ?ag)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
    :cost 1
  )

  ;; Consonant agent actions (operate only on consonant blocks)
  (:action consonant_move_block_to_block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (consonant_agent ?ag)
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
    :cost 1
  )

  (:action consonant_move_table_to_block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (consonant_agent ?ag)
      (consonant ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
    :cost 1
  )

  (:action consonant_move_block_to_table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (consonant_agent ?ag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
    :cost 1
  )
)