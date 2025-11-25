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

  ;; pick up a block from the table at a specific stage and advance to the next stage
  (:action pickup
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (not (at-stage ?s2))        ; ensure unique contiguous stage occupancy
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

  ;; unstack a block ?b from on top of block ?c at a specific stage and advance to the next stage
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (not (at-stage ?s2))        ; ensure unique contiguous stage occupancy
      (handempty)
      (clear ?b)
      (on ?b ?c)
    )
    :effect (and
      (not (on ?b ?c))
      (not (handempty))
      (holding ?b)
      (clear ?c)
      (not (clear ?b))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; put down a held block onto the table at a specific stage and advance to the next stage
  (:action putdown
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (not (at-stage ?s2))        ; ensure unique contiguous stage occupancy
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

  ;; stack a held block ?b onto block ?c at a specific stage and advance to the next stage
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (not (at-stage ?s2))        ; ensure unique contiguous stage occupancy
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