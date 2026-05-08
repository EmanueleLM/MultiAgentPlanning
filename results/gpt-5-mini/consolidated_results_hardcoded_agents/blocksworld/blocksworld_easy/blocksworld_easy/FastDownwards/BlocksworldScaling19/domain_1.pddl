(define (domain block-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (on ?b - obj ?p - obj)
    (clear ?o - obj)
    (handempty)
    (holding ?b - obj)
    (at ?s - obj)
    (next ?s1 - obj ?s2 - obj)
  )

  (:action unstack
    :parameters (?b - obj ?p - obj ?s - obj ?s2 - obj)
    :precondition (and
      (at ?s)
      (next ?s ?s2)
      (on ?b ?p)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?p))
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
      (clear ?p)
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action putdown_table
    :parameters (?b - obj ?s - obj ?s2 - obj)
    :precondition (and
      (at ?s)
      (next ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (on ?b table)
      (clear ?b)
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action pickup_table
    :parameters (?b - obj ?s - obj ?s2 - obj)
    :precondition (and
      (at ?s)
      (next ?s ?s2)
      (on ?b table)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b table))
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action stack_onto
    :parameters (?b - obj ?p - obj ?s - obj ?s2 - obj)
    :precondition (and
      (at ?s)
      (next ?s ?s2)
      (holding ?b)
      (clear ?p)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (on ?b ?p)
      (not (clear ?p))
      (clear ?b)
      (not (at ?s))
      (at ?s2)
    )
  )
)