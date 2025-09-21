(define (domain multi-agent-blocks)
  (:requirements :strips :typing :equality)
  (:types agent block)
  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
    (can-move ?a - agent ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
  )

  (:action vowel-pickup-from-table
    :parameters (?agent - agent ?x - block)
    :precondition (and
      (vowel-agent ?agent)
      (vowel ?x)
      (can-move ?agent ?x)
      (ontable ?x)
      (clear ?x)
      (handempty ?agent)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?agent))
      (holding ?agent ?x)
    )
  )

  (:action vowel-unstack
    :parameters (?agent - agent ?x - block ?y - block)
    :precondition (and
      (vowel-agent ?agent)
      (vowel ?x)
      (can-move ?agent ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty ?agent)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?agent))
      (holding ?agent ?x)
    )
  )

  (:action vowel-putdown
    :parameters (?agent - agent ?x - block)
    :precondition (and
      (vowel-agent ?agent)
      (vowel ?x)
      (can-move ?agent ?x)
      (holding ?agent ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?agent)
      (not (holding ?agent ?x))
    )
  )

  (:action vowel-stack
    :parameters (?agent - agent ?x - block ?y - block)
    :precondition (and
      (vowel-agent ?agent)
      (vowel ?x)
      (can-move ?agent ?x)
      (holding ?agent ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty ?agent)
      (not (holding ?agent ?x))
    )
  )

  (:action cons-pickup-from-table
    :parameters (?agent - agent ?x - block)
    :precondition (and
      (consonant-agent ?agent)
      (consonant ?x)
      (can-move ?agent ?x)
      (ontable ?x)
      (clear ?x)
      (handempty ?agent)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?agent))
      (holding ?agent ?x)
    )
  )

  (:action cons-unstack
    :parameters (?agent - agent ?x - block ?y - block)
    :precondition (and
      (consonant-agent ?agent)
      (consonant ?x)
      (can-move ?agent ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty ?agent)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?agent))
      (holding ?agent ?x)
    )
  )

  (:action cons-putdown
    :parameters (?agent - agent ?x - block)
    :precondition (and
      (consonant-agent ?agent)
      (consonant ?x)
      (can-move ?agent ?x)
      (holding ?agent ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?agent)
      (not (holding ?agent ?x))
    )
  )

  (:action cons-stack
    :parameters (?agent - agent ?x - block ?y - block)
    :precondition (and
      (consonant-agent ?agent)
      (consonant ?x)
      (can-move ?agent ?x)
      (holding ?agent ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty ?agent)
      (not (holding ?agent ?x))
    )
  )
)