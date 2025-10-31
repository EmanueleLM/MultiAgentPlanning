(define (domain blocksworld-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block time)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (at-step ?s - time)
    (next ?s - time ?s2 - time)
  )

  (:action pickup
    :parameters (?x - block ?s - time ?s2 - time)
    :precondition (and (at-step ?s) (ontable ?x) (clear ?x) (handempty) (next ?s ?s2))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (holding ?x)
      (not (handempty))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action putdown
    :parameters (?x - block ?s - time ?s2 - time)
    :precondition (and (at-step ?s) (holding ?x) (next ?s ?s2))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding ?x))
      (handempty)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block ?s - time ?s2 - time)
    :precondition (and (at-step ?s) (on ?x ?y) (clear ?x) (handempty) (next ?s ?s2))
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (holding ?x)
      (not (clear ?x))
      (not (handempty))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action stack
    :parameters (?x - block ?y - block ?s - time ?s2 - time)
    :precondition (and (at-step ?s) (holding ?x) (clear ?y) (next ?s ?s2))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding ?x))
      (handempty)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)