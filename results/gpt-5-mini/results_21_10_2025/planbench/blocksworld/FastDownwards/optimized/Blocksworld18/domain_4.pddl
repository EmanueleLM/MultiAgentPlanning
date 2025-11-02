(define (domain multi_agent_blocks_orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (holding_v ?b - block)
    (holding_c ?b - block)
    (handempty_v)
    (handempty_c)
  )

  (:action vowel_pickup_from_table
    :parameters (?b - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (handempty_v)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding_v ?b)
      (not (handempty_v))
    )
  )

  (:action vowel_unstack
    :parameters (?b - block ?under - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?under)
      (clear ?b)
      (handempty_v)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (holding_v ?b)
      (not (handempty_v))
    )
  )

  (:action vowel_putdown_to_table
    :parameters (?b - block)
    :precondition (and
      (vowel ?b)
      (holding_v ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding_v ?b))
      (handempty_v)
    )
  )

  (:action vowel_stack_onto
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (holding_v ?b)
      (clear ?to)
    )
    :effect (and
      (not (holding_v ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
      (handempty_v)
    )
  )

  (:action consonant_pickup_from_table
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (handempty_c)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding_c ?b)
      (not (handempty_c))
    )
  )

  (:action consonant_unstack
    :parameters (?b - block ?under - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?under)
      (clear ?b)
      (handempty_c)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (holding_c ?b)
      (not (handempty_c))
    )
  )

  (:action consonant_putdown_to_table
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (holding_c ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding_c ?b))
      (handempty_c)
    )
  )

  (:action consonant_stack_onto
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (holding_c ?b)
      (clear ?to)
    )
    :effect (and
      (not (holding_c ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
      (handempty_c)
    )
  )
)