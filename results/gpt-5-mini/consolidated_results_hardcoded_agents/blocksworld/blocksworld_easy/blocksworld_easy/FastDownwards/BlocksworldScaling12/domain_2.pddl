(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block time)

  (:predicates
    (handempty)
    (holding ?b - block)
    (clear ?b - block)
    (on ?b - block ?c - block)
    (on-table ?b - block)
    (current ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  (:action pick-up
    :parameters (?x - block ?t - time ?t2 - time)
    :precondition (and
      (on-table ?x)
      (clear ?x)
      (handempty)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-table ?x))
      (not (clear ?x))
      (not (handempty))
      (holding ?x)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action put-down
    :parameters (?x - block ?t - time ?t2 - time)
    :precondition (and
      (holding ?x)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (on-table ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action stack
    :parameters (?x - block ?y - block ?t - time ?t2 - time)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (current ?t)
      (next ?t ?t2)
      (not (on ?y ?x))
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty)
      (not (holding ?x))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block ?t - time ?t2 - time)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?x)
      (not (clear ?x))
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
      (not (current ?t))
      (current ?t2)
    )
  )
)