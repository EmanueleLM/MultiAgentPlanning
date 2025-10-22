(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty)
    (holding ?x - block)
  )

  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and (holding ?b) (not (ontable ?b)) (not (clear ?b)) (not (handempty)))
  )

  (:action putdown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and (ontable ?b) (clear ?b) (handempty) (not (holding ?b)))
  )

  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty))
    :effect (and (holding ?b) (clear ?c) (not (on ?b ?c)) (not (clear ?b)) (not (handempty)))
  )

  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding ?b) (clear ?c))
    :effect (and (on ?b ?c) (clear ?b) (handempty) (not (holding ?b)) (not (clear ?c)))
  )
)