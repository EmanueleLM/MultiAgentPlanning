(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (ontable ?b - block)
    (on ?b - block ?x - block)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
  )

  ;; Actions belonging to vowel_agent
  (:action vowel_pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and (clear ?b) (ontable ?b) (handempty ?ag))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
            )
  )

  (:action vowel_putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and (holding ?ag ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
            )
  )

  (:action vowel_stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and (holding ?ag ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
              (not (clear ?c))
            )
  )

  (:action vowel_unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty ?ag))
    :effect (and
              (holding ?ag ?b)
              (not (on ?b ?c))
              (clear ?c)
              (not (clear ?b))
              (not (handempty ?ag))
            )
  )

  ;; Actions belonging to consonant_agent
  (:action consonant_pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and (clear ?b) (ontable ?b) (handempty ?ag))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
            )
  )

  (:action consonant_putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and (holding ?ag ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
            )
  )

  (:action consonant_stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and (holding ?ag ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
              (not (clear ?c))
            )
  )

  (:action consonant_unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty ?ag))
    :effect (and
              (holding ?ag ?b)
              (not (on ?b ?c))
              (clear ?c)
              (not (clear ?b))
              (not (handempty ?ag))
            )
  )
)