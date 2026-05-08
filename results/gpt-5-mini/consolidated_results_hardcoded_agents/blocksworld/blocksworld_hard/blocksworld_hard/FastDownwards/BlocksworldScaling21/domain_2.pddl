(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (clear ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (holding ?b - block)
    (handempty)
    (stage ?s - stage)
    (next ?s - stage ?t - stage)
  )

  (:action pickup
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (clear ?b)
      (ontable ?b)
      (handempty)
      (stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (stage ?s))
      (stage ?t)
    )
  )

  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?t - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
      (not (stage ?s))
      (stage ?t)
    )
  )

  (:action putdown
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (stage ?s))
      (stage ?t)
    )
  )

  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (holding ?b))
      (not (clear ?c))
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (stage ?s))
      (stage ?t)
    )
  )
)