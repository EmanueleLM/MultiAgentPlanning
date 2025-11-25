(define (domain BlocksworldScaling10)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (ontable ?b - block)
    (on ?x - block ?y - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  (:action pick-up
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (at ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
      (holding ?x)
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (at ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?x ?y))
      (not (ontable ?x))
      (holding ?x)
      (not (handempty))
      (clear ?y)
      (not (clear ?x))
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action put-down
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (at ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (at ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (ontable ?x))
      (not (at ?s))
      (at ?s2)
    )
  )
)