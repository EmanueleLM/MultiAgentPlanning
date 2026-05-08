(define (domain blocks-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action pick-up
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (on-table ?x) (clear ?x) (handempty) (at-stage ?s) (succ ?s ?s2))
    :effect (and
      (holding ?x)
      (not (on-table ?x))
      (not (clear ?x))
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (on ?x ?y) (clear ?x) (handempty) (at-stage ?s) (succ ?s ?s2))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action put-down
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (at-stage ?s) (succ ?s ?s2))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (clear ?y) (at-stage ?s) (succ ?s ?s2))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty)
      (not (holding ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)