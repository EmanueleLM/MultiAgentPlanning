(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block stage)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (at ?s - stage)
    (next ?s - stage ?t - stage)
  )

  (:action pickup
    :parameters (?x - block ?s - stage ?t - stage)
    :precondition (and
      (at ?s)
      (next ?s ?t)
      (clear ?x)
      (on-table ?x)
      (handempty)
    )
    :effect (and
      (not (at ?s))
      (at ?t)
      (holding ?x)
      (not (on-table ?x))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action putdown
    :parameters (?x - block ?s - stage ?t - stage)
    :precondition (and
      (at ?s)
      (next ?s ?t)
      (holding ?x)
    )
    :effect (and
      (not (at ?s))
      (at ?t)
      (on-table ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?t - stage)
    :precondition (and
      (at ?s)
      (next ?s ?t)
      (on ?x ?y)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (not (at ?s))
      (at ?t)
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?t - stage)
    :precondition (and
      (at ?s)
      (next ?s ?t)
      (holding ?x)
      (clear ?y)
    )
    :effect (and
      (not (at ?s))
      (at ?t)
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (on-table ?x))
    )
  )
)