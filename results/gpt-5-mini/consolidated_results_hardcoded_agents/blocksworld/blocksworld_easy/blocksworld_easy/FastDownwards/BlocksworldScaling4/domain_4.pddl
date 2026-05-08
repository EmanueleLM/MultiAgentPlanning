(define (domain blocks-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support - object
    block table - support
    agent stage - object
  )

  (:predicates
    (on ?b - block ?p - support)        ; block ?b is on support ?p (another block or the table)
    (clear ?b - block)                 ; block ?b has nothing on top and is not held
    (handempty ?a - agent)             ; agent ?a's hand is empty
    (holding ?a - agent ?b - block)    ; agent ?a is holding block ?b
    (current ?s - stage)               ; the system is at stage ?s (discrete global stage)
    (next ?s1 - stage ?s2 - stage)     ; stage ordering: next ?s1 ?s2 means ?s2 follows ?s1
  )

  ;; Unstack a block ?b from on top of another block ?under
  (:action unstack
    :parameters (?a - agent ?b - block ?under - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (handempty ?a)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))             ; enforce contiguous stage progression: successor not already active
    )
    :effect (and
      (not (on ?b ?under))
      (not (handempty ?a))
      (holding ?a ?b)
      (clear ?under)
      (not (clear ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Pick up a block ?b from the table
  (:action pickup
    :parameters (?a - agent ?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?t)
      (clear ?b)
      (handempty ?a)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      (not (on ?b ?t))
      (not (handempty ?a))
      (holding ?a ?b)
      (not (clear ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack block ?b onto another block ?target
  (:action stack
    :parameters (?a - agent ?b - block ?target - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?a ?b)
      (clear ?target)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?target)
      (not (clear ?target))
      (clear ?b)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down block ?b onto the table
  (:action putdown
    :parameters (?a - agent ?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?a ?b)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?t)
      (clear ?b)
      (not (current ?s))
      (current ?s2)
    )
  )
)