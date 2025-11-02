(define (domain blocks_multiagent)
  (:requirements :strips :typing)
  (:types block agent)

  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)
    (agent ?ag - agent)
  )

  ;; Vowel-agent actions (can only pick vowels)
  (:action vowel_unstack
    :parameters (?b - block ?below - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?below)
      (clear ?b)
      (handempty vowel_agent)
    )
    :effect (and
      (not (on ?b ?below))
      (not (handempty vowel_agent))
      (not (clear ?b))
      (holding vowel_agent ?b)
      (clear ?below)
    )
  )

  (:action vowel_pickup_table
    :parameters (?b - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (handempty vowel_agent)
    )
    :effect (and
      (not (ontable ?b))
      (not (handempty vowel_agent))
      (not (clear ?b))
      (holding vowel_agent ?b)
    )
  )

  (:action vowel_putdown_table
    :parameters (?b - block)
    :precondition (and
      (holding vowel_agent ?b)
    )
    :effect (and
      (not (holding vowel_agent ?b))
      (handempty vowel_agent)
      (ontable ?b)
      (clear ?b)
    )
  )

  (:action vowel_stack_on
    :parameters (?b - block ?target - block)
    :precondition (and
      (holding vowel_agent ?b)
      (clear ?target)
    )
    :effect (and
      (not (holding vowel_agent ?b))
      (not (clear ?target))
      (handempty vowel_agent)
      (on ?b ?target)
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (can only pick consonants)
  (:action consonant_unstack
    :parameters (?b - block ?below - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?below)
      (clear ?b)
      (handempty consonant_agent)
    )
    :effect (and
      (not (on ?b ?below))
      (not (handempty consonant_agent))
      (not (clear ?b))
      (holding consonant_agent ?b)
      (clear ?below)
    )
  )

  (:action consonant_pickup_table
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (handempty consonant_agent)
    )
    :effect (and
      (not (ontable ?b))
      (not (handempty consonant_agent))
      (not (clear ?b))
      (holding consonant_agent ?b)
    )
  )

  (:action consonant_putdown_table
    :parameters (?b - block)
    :precondition (and
      (holding consonant_agent ?b)
    )
    :effect (and
      (not (holding consonant_agent ?b))
      (handempty consonant_agent)
      (ontable ?b)
      (clear ?b)
    )
  )

  (:action consonant_stack_on
    :parameters (?b - block ?target - block)
    :precondition (and
      (holding consonant_agent ?b)
      (clear ?target)
    )
    :effect (and
      (not (holding consonant_agent ?b))
      (not (clear ?target))
      (handempty consonant_agent)
      (on ?b ?target)
      (clear ?b)
    )
  )
)