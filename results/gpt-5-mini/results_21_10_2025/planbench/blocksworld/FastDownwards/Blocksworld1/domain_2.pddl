(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?c - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
  )

  (:action pickup
    :parameters (?a - agent ?b - block)
    :precondition (and (handempty ?a) (clear ?b) (ontable ?b))
    :effect (and (holding ?a ?b) (not (ontable ?b)) (not (clear ?b)) (not (handempty ?a)))
  )

  (:action unstack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (handempty ?a) (clear ?b) (on ?b ?c))
    :effect (and (holding ?a ?b) (not (on ?b ?c)) (clear ?c) (not (clear ?b)) (not (handempty ?a)))
  )

  (:action putdown
    :parameters (?a - agent ?b - block)
    :precondition (and (holding ?a ?b))
    :effect (and (ontable ?b) (clear ?b) (handempty ?a) (not (holding ?a ?b)))
  )

  (:action stack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (holding ?a ?b) (clear ?c))
    :effect (and (on ?b ?c) (not (clear ?c)) (clear ?b) (handempty ?a) (not (holding ?a ?b)))
  )
)