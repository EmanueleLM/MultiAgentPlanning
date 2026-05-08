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

  ;; Unstack a block ?b from on top of block ?b2, advancing to the successor stage.
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

  ;; Pick up a block ?b from the table, advancing to the successor stage.
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

  ;; Put down a held block ?b onto the table, advancing to the successor stage.
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

  ;; Stack a held block ?b onto block ?b2, advancing to the successor stage.
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