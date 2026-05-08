(define (domain blocksworld_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action pickup
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action putdown
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action unstack
    :parameters (?b - block ?s - block ?t - stage ?t2 - stage)
    :precondition (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (clear ?s)
      (not (on ?b ?s))
      (not (clear ?b))
      (not (handempty))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action stack
    :parameters (?b - block ?s - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?s)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?s))
      (not (current ?t))
      (current ?t2)
    )
  )
)