(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (clear ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (holding ?b - block)
    (handempty)
    (curr-stage ?s - stage)
    (next ?s - stage ?t - stage)
  )

  (:action PickUp
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (clear ?b)
      (ontable ?b)
      (handempty)
      (curr-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (curr-stage ?s))
      (curr-stage ?t)
    )
  )

  (:action Unstack
    :parameters (?b - block ?c - block ?s - stage ?t - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (curr-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
      (not (curr-stage ?s))
      (curr-stage ?t)
    )
  )

  (:action PutDown
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (curr-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (curr-stage ?s))
      (curr-stage ?t)
    )
  )

  (:action Stack
    :parameters (?b - block ?c - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (curr-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (holding ?b))
      (not (clear ?c))
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (ontable ?b))
      (not (curr-stage ?s))
      (curr-stage ?t)
    )
  )
)