(define (domain blocksworld-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (clear ?x - block)
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (holding ?x - block)
    (handempty)
    (at ?s - stage)
    (next ?s - stage ?t - stage)
  )

  (:action pick-up
    :parameters (?x - block ?s - stage ?t - stage)
    :precondition (and (clear ?x) (ontable ?x) (handempty) (at ?s) (next ?s ?t))
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
      (not (at ?s))
      (at ?t)
    )
  )

  (:action put-down
    :parameters (?x - block ?s - stage ?t - stage)
    :precondition (and (holding ?x) (at ?s) (next ?s ?t))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (at ?s))
      (at ?t)
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?t - stage)
    :precondition (and (on ?x ?y) (clear ?x) (handempty) (at ?s) (next ?s ?t))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
      (not (at ?s))
      (at ?t)
    )
  )

  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?t - stage)
    :precondition (and (holding ?x) (clear ?y) (at ?s) (next ?s ?t))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (at ?s))
      (at ?t)
    )
  )
)