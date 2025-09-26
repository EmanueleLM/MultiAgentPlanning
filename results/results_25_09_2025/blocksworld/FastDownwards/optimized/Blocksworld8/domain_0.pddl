(define (domain combined-blocks)
  (:requirements :strips :typing)
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

  ;; Vowel-agent actions (prefixed vowel-) adapted from vowel-blocks domain.
  (:action vowel-pickup-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (agent ?ag) (vowel ?b) (ontable ?b) (clear ?b) (handempty ?ag) (can-manip ?ag ?b))
    :effect (and
      (holding ?ag ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
    )
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
  )

  ;; Consonant-agent actions (prefixed cons-) adapted from multiagent-blocks domain.
  (:action cons-pickup-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (agent ?ag) (ontable ?b) (clear ?b) (handempty ?ag) (can-manip ?ag ?b))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action cons-pickup-from-block
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and (agent ?ag) (on ?b ?c) (clear ?b) (handempty ?ag) (can-manip ?ag ?b))
    :effect (and
      (not (on ?b ?c))
      (clear ?c)
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action cons-putdown-on-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (agent ?ag) (holding ?ag ?b) (can-manip ?ag ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  (:action cons-putdown-on-block
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and (agent ?ag) (holding ?ag ?b) (clear ?c) (can-manip ?ag ?b))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )
)