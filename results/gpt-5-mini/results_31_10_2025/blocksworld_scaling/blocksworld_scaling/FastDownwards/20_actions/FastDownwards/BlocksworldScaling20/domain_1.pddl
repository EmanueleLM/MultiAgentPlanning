(define (domain blocks_multiagent_vowel_consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    ;; static classifications
    (vowel ?b - block)
    (consonant ?b - block)

    ;; world state
    (on ?b - block ?x - block)     ;; ?b is directly on ?x (block)
    (ontable ?b - block)           ;; ?b is on the table
    (clear ?b - block)             ;; nothing on top of ?b (top of its stack)

    ;; agent hand state
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)

    ;; agent identities (useful for initial typing)
    (agent ?ag - agent)
  )

  ;; Vowel-agent actions: may only pick up vowels and only when handempty.
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
      (vowel ?b)
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
      (vowel ?b)
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

  ;; Consonant-agent actions: may only pick up consonants and only when handempty.
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
      (consonant ?b)
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
      (consonant ?b)
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