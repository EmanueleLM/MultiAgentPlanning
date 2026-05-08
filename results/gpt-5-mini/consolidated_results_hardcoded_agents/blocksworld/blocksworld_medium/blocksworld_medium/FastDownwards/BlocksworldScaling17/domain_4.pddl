(define (domain BlocksworldScaling17)
  (:requirements :strips :typing :negative-preconditions)
  (:types block time)

  (:predicates
    (on ?b - block ?b2 - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  (:action pick-up
    :parameters (?b - block ?s - time ?t - time)
    :precondition (and (handempty) (clear ?b) (ontable ?b) (at ?s) (next ?s ?t))
    :effect (and
      (not (handempty))
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?b)
      (not (at ?s))
      (at ?t)
    )
  )

  (:action unstack
    :parameters (?b - block ?c - block ?s - time ?t - time)
    :precondition (and (handempty) (clear ?b) (on ?b ?c) (at ?s) (next ?s ?t))
    :effect (and
      (not (handempty))
      (not (on ?b ?c))
      (holding ?b)
      (clear ?c)
      (not (clear ?b))
      (not (at ?s))
      (at ?t)
    )
  )

  (:action put-down
    :parameters (?b - block ?s - time ?t - time)
    :precondition (and (holding ?b) (at ?s) (next ?s ?t))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at ?s))
      (at ?t)
    )
  )

  (:action stack
    :parameters (?b - block ?c - block ?s - time ?t - time)
    :precondition (and (holding ?b) (clear ?c) (at ?s) (next ?s ?t))
    :effect (and
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at ?s))
      (at ?t)
    )
  )
)