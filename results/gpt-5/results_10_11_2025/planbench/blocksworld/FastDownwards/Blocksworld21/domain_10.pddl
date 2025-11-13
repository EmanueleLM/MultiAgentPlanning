(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (clear ?x - block)
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (holding ?x - block)
    (handempty)
    (atstage ?s - stage)
    (next ?s - stage ?t - stage)
  )

  (:action pickup
    :parameters (?x - block ?s - stage ?t - stage)
    :precondition (and (clear ?x) (ontable ?x) (handempty) (atstage ?s) (next ?s ?t))
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
      (not (atstage ?s))
      (atstage ?t)
    )
  )

  (:action putdown
    :parameters (?x - block ?s - stage ?t - stage)
    :precondition (and (holding ?x) (atstage ?s) (next ?s ?t))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (atstage ?s))
      (atstage ?t)
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?t - stage)
    :precondition (and (on ?x ?y) (clear ?x) (handempty) (atstage ?s) (next ?s ?t))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
      (not (atstage ?s))
      (atstage ?t)
    )
  )

  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?t - stage)
    :precondition (and (holding ?x) (clear ?y) (atstage ?s) (next ?s ?t))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (atstage ?s))
      (atstage ?t)
    )
  )
)