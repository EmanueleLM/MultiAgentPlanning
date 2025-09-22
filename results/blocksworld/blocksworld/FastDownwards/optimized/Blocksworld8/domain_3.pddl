(define (domain combined-blocks)
  (:requirements :strips :adl :typing :equality :action-costs)
  (:types agent block)

  (:predicates
    (agent ?ag - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?b - block ?below - block)
    (ontable ?b - block)
    (clear ?b - block)
    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)
    (can-manip ?ag - agent ?b - block)
  )

  (:action vowel-pickup-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (agent ?ag) (vowel ?b) (ontable ?b) (clear ?b) (handempty ?ag) (can-manip ?ag ?b))
    :effect (and
      (holding ?ag ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
    )
    :cost 1
  )

  (:action vowel-unstack
    :parameters (?ag - agent ?b - block ?below - block)
    :precondition (and (agent ?ag) (vowel ?b) (on ?b ?below) (clear ?b) (handempty ?ag) (can-manip ?ag ?b))
    :effect (and
      (holding ?ag ?b)
      (clear ?below)
      (not (on ?b ?below))
      (not (clear ?b))
      (not (handempty ?ag))
    )
    :cost 1
  )

  (:action vowel-putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and (agent ?ag) (vowel ?b) (holding ?ag ?b) (can-manip ?ag ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
    :cost 1
  )

  (:action vowel-stack-onto
    :parameters (?ag - agent ?b - block ?target - block)
    :precondition (and (agent ?ag) (vowel ?b) (holding ?ag ?b) (clear ?target) (can-manip ?ag ?b))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (not (clear ?target))
    )
    :cost 1
  )

  (:action cons-pickup-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (agent ?ag) (consonant ?b) (ontable ?b) (clear ?b) (handempty ?ag) (can-manip ?ag ?b))
    :effect (and
      (holding ?ag ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
    )
    :cost 1
  )

  (:action cons-pickup-from-block
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and (agent ?ag) (consonant ?b) (on ?b ?c) (clear ?b) (handempty ?ag) (can-manip ?ag ?b))
    :effect (and
      (holding ?ag ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty ?ag))
    )
    :cost 1
  )

  (:action cons-putdown-on-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (agent ?ag) (consonant ?b) (holding ?ag ?b) (can-manip ?ag ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
    :cost 1
  )

  (:action cons-putdown-on-block
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and (agent ?ag) (consonant ?b) (holding ?ag ?b) (clear ?c) (can-manip ?ag ?b))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
    :cost 1
  )
)