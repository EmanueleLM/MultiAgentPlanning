(define (domain blocksworld_stages)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (handempty)
    (holding ?b - block)
    (on ?b - block ?b2 - block)
    (ontable ?b - block)
    (clear ?b - block)
    (succ ?s - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  (:action unstack
    :parameters (?b - block ?b2 - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)
      (handempty)
      (on ?b ?b2)
      (clear ?b)
    )
    :effect (and
      (not (handempty))
      (holding ?b)
      (not (on ?b ?b2))
      (clear ?b2)
      (not (clear ?b))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)
      (handempty)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (not (handempty))
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (handempty)
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action stack
    :parameters (?b - block ?b2 - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)
      (holding ?b)
      (clear ?b2)
    )
    :effect (and
      (handempty)
      (not (holding ?b))
      (on ?b ?b2)
      (not (clear ?b2))
      (clear ?b)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)