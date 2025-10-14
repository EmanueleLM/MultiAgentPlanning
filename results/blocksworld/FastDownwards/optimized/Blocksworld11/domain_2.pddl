(define (domain multi-agent-blocks)
  (:requirements :typing :negative-preconditions)
  (:types agent block)

  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (vowel-block ?b - block)
    (consonant-block ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  (:action vowel_pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel-block ?b)
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (not (ontable ?b))
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action vowel_unstack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel-block ?b)
      (on ?b ?s)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (not (on ?b ?s))
      (clear ?s)
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action vowel_stack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel-block ?b)
      (holding ?ag ?b)
      (clear ?s)
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (not (clear ?s))
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )

  (:action vowel_putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel-block ?b)
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )

  (:action consonant_pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant-block ?b)
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (not (ontable ?b))
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action consonant_unstack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant-block ?b)
      (on ?b ?s)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (not (on ?b ?s))
      (clear ?s)
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action consonant_stack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant-block ?b)
      (holding ?ag ?b)
      (clear ?s)
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (not (clear ?s))
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )

  (:action consonant_putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant-block ?b)
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )
)