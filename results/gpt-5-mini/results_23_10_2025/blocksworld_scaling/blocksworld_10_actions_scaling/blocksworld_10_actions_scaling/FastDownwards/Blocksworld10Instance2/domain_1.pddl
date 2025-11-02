(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty))
              (holding ?b)
            )
  )

  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty))
    :effect (and
              (not (on ?b ?c))
              (not (clear ?b))
              (not (handempty))
              (holding ?b)
              (clear ?c)
            )
  )

  (:action putdown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
              (not (holding ?b))
              (ontable ?b)
              (clear ?b)
              (handempty)
            )
  )

  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding ?b) (clear ?c))
    :effect (and
              (not (holding ?b))
              (not (clear ?c))
              (on ?b ?c)
              (clear ?b)
              (handempty)
            )
  )
)