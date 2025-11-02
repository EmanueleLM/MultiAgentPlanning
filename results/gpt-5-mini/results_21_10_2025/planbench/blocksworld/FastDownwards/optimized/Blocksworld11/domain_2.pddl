(define (domain multi-agent-blocks-with-slots)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block slot)

  (:predicates
    (on ?b - block ?c - block)
    (ontable ?b - block ?s - slot)
    (clear ?b - block)
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)
    (can-move ?ag - agent ?b - block)
    (vowel-agent ?ag - agent)
    (consonant-agent ?ag - agent)
    (slot-free ?s - slot)
  )

  (:action vowel-pickup
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (vowel-agent ?ag)
      (handempty ?ag)
      (ontable ?b ?s)
      (clear ?b)
      (can-move ?ag ?b)
    )
    :effect (and
      (not (ontable ?b ?s))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (slot-free ?s)
    )
  )

  (:action vowel-unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (vowel-agent ?ag)
      (handempty ?ag)
      (on ?b ?c)
      (clear ?b)
      (can-move ?ag ?b)
    )
    :effect (and
      (not (on ?b ?c))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (clear ?c)
    )
  )

  (:action vowel-putdown
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (vowel-agent ?ag)
      (holding ?ag ?b)
      (slot-free ?s)
    )
    :effect (and
      (ontable ?b ?s)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (slot-free ?s))
    )
  )

  (:action vowel-stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (vowel-agent ?ag)
      (holding ?ag ?b)
      (clear ?c)
      (can-move ?ag ?b)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (clear ?c))
    )
  )

  (:action consonant-pickup
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (consonant-agent ?ag)
      (handempty ?ag)
      (ontable ?b ?s)
      (clear ?b)
      (can-move ?ag ?b)
    )
    :effect (and
      (not (ontable ?b ?s))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (slot-free ?s)
    )
  )

  (:action consonant-unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (consonant-agent ?ag)
      (handempty ?ag)
      (on ?b ?c)
      (clear ?b)
      (can-move ?ag ?b)
    )
    :effect (and
      (not (on ?b ?c))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (clear ?c)
    )
  )

  (:action consonant-putdown
    :parameters (?ag - agent ?b - block ?s - slot)
    :precondition (and
      (consonant-agent ?ag)
      (holding ?ag ?b)
      (slot-free ?s)
    )
    :effect (and
      (ontable ?b ?s)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (slot-free ?s))
    )
  )

  (:action consonant-stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (consonant-agent ?ag)
      (holding ?ag ?b)
      (clear ?c)
      (can-move ?ag ?b)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (clear ?c))
    )
  )
)