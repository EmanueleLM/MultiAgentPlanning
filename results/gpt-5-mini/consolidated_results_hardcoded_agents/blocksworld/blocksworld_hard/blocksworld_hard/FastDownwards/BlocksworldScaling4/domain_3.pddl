(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action pickup
    :parameters (?x - block ?t - stage ?t2 - stage)
    :precondition (and (on-table ?x) (clear ?x) (handempty) (current ?t) (succ ?t ?t2))
    :effect (and
      (holding ?x)
      (not (on-table ?x))
      (not (handempty))
      (not (clear ?x))
      (current ?t2)
      (not (current ?t))
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block ?t - stage ?t2 - stage)
    :precondition (and (on ?x ?y) (clear ?x) (handempty) (current ?t) (succ ?t ?t2))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
      (not (clear ?x))
      (current ?t2)
      (not (current ?t))
    )
  )

  (:action putdown
    :parameters (?x - block ?t - stage ?t2 - stage)
    :precondition (and (holding ?x) (current ?t) (succ ?t ?t2))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (current ?t2)
      (not (current ?t))
    )
  )

  (:action stack
    :parameters (?x - block ?y - block ?t - stage ?t2 - stage)
    :precondition (and (holding ?x) (clear ?y) (current ?t) (succ ?t ?t2))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty)
      (not (holding ?x))
      (current ?t2)
      (not (current ?t))
    )
  )
)