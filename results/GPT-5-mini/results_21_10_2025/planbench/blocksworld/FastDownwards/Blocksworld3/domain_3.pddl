(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
  )

  (:action pick-up
    :parameters (?a - agent ?b - block)
    :precondition (and (handempty ?a) (on-table ?b) (clear ?b))
    :effect (and
      (holding ?a ?b)
      (not (on-table ?b))
      (not (handempty ?a))
      (not (clear ?b))
    )
  )

  (:action unstack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (handempty ?a) (on ?b ?c) (clear ?b))
    :effect (and
      (holding ?a ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (handempty ?a))
      (not (clear ?b))
    )
  )

  (:action put-down
    :parameters (?a - agent ?b - block)
    :precondition (and (holding ?a ?b))
    :effect (and
      (on-table ?b)
      (clear ?b)
      (handempty ?a)
      (not (holding ?a ?b))
    )
  )

  (:action stack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (holding ?a ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty ?a)
      (not (holding ?a ?b))
    )
  )
)