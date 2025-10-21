(define (domain blocksworld_multiagent)
  (:requirements :typing :negative-preconditions)
  (:types block agent)

  (:constants
    vowel_agent consonant_agent - agent
  )

  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel-agent actions (actions use the vowel_agent constant)
  (:action vowel_pickup_table
    :parameters (?b - block)
    :precondition (and
      (handempty vowel_agent)
      (ontable ?b)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (holding vowel_agent ?b)
      (not (handempty vowel_agent))
      (not (ontable ?b))
      (not (clear ?b))
    )
  )

  (:action vowel_unstack
    :parameters (?b - block ?from - block)
    :precondition (and
      (handempty vowel_agent)
      (on ?b ?from)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (holding vowel_agent ?b)
      (not (handempty vowel_agent))
      (not (on ?b ?from))
      (clear ?from)
      (not (clear ?b))
    )
  )

  (:action vowel_putdown
    :parameters (?b - block)
    :precondition (and
      (holding vowel_agent ?b)
      (vowel ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty vowel_agent)
      (not (holding vowel_agent ?b))
    )
  )

  (:action vowel_stack
    :parameters (?b - block ?to - block)
    :precondition (and
      (holding vowel_agent ?b)
      (clear ?to)
      (vowel ?b)
    )
    :effect (and
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
      (handempty vowel_agent)
      (not (holding vowel_agent ?b))
    )
  )

  ;; Consonant-agent actions (actions use the consonant_agent constant)
  (:action consonant_pickup_table
    :parameters (?b - block)
    :precondition (and
      (handempty consonant_agent)
      (ontable ?b)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (holding consonant_agent ?b)
      (not (handempty consonant_agent))
      (not (ontable ?b))
      (not (clear ?b))
    )
  )

  (:action consonant_unstack
    :parameters (?b - block ?from - block)
    :precondition (and
      (handempty consonant_agent)
      (on ?b ?from)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (holding consonant_agent ?b)
      (not (handempty consonant_agent))
      (not (on ?b ?from))
      (clear ?from)
      (not (clear ?b))
    )
  )

  (:action consonant_putdown
    :parameters (?b - block)
    :precondition (and
      (holding consonant_agent ?b)
      (consonant ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty consonant_agent)
      (not (holding consonant_agent ?b))
    )
  )

  (:action consonant_stack
    :parameters (?b - block ?to - block)
    :precondition (and
      (holding consonant_agent ?b)
      (clear ?to)
      (consonant ?b)
    )
    :effect (and
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
      (handempty consonant_agent)
      (not (holding consonant_agent ?b))
    )
  )
)