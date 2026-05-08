(define (domain blocks-world-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (handempty)
    (holding ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; pick up a clear block from the table, advance exactly to the immediate successor stage
  (:action pickup
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (handempty)
      (clear ?b)
      (ontable ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (handempty))
      (holding ?b)
      (not (clear ?b))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; unstack a clear block ?b from directly on top of ?c, advance to immediate successor stage
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (handempty)
      (clear ?b)
      (on ?b ?c)
    )
    :effect (and
      (not (on ?b ?c))
      (not (ontable ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
      (not (clear ?b))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; put down the held block onto the table, advance to immediate successor stage
  (:action putdown
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (ontable ?b)
      (clear ?b)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; stack the held block ?b onto a clear block ?c, advance to immediate successor stage
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (not (ontable ?b))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)