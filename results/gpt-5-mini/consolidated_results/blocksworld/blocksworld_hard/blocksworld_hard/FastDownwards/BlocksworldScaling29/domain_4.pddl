(define (domain BlocksworldScaling29)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (current ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  (:action pickup
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
      (holding ?x)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
      (holding ?x)
      (clear ?y)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action putdown
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (current ?s))
      (current ?s2)
    )
  )
)