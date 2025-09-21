(define (domain stacking-multiagent)
  (:requirements :strips :negative-preconditions :equality :typing)
  (:types block agent)
  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (agent_vowel ?a - agent)
    (agent_consonant ?a - agent)
    (agent_orchestrator ?a - agent)
  )

  (:action vowel_move_block_to_block
    :parameters (?a - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (agent_vowel ?a)
      (vowel ?b)
      (clear ?b)
      (clear ?to)
      (on ?b ?from)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel_move_from_table_to_block
    :parameters (?a - agent ?b - block ?to - block)
    :precondition (and
      (agent_vowel ?a)
      (vowel ?b)
      (clear ?b)
      (clear ?to)
      (ontable ?b)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel_move_block_to_table
    :parameters (?a - agent ?b - block ?from - block)
    :precondition (and
      (agent_vowel ?a)
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action consonant_move_block_to_block
    :parameters (?a - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (agent_consonant ?a)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant_move_from_table_to_block
    :parameters (?a - agent ?b - block ?to - block)
    :precondition (and
      (agent_consonant ?a)
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

  (:action consonant_move_block_to_table
    :parameters (?a - agent ?b - block ?from - block)
    :precondition (and
      (agent_consonant ?a)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )
)