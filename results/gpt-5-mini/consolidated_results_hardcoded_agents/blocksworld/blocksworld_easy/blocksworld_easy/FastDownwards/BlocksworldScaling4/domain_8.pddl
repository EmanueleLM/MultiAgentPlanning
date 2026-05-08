(define (domain blocks-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table - support agent stage support)

  (:predicates
    (on ?b - block ?p - support)
    (clear ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Unstack a block ?b from on top of another block ?under (both blocks are supports)
  (:action unstack
    :parameters (?a - agent ?b - block ?under - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (handempty ?a)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      ;; b is removed from being on under and becomes held
      (not (on ?b ?under))
      (not (handempty ?a))
      (holding ?a ?b)

      ;; under becomes clear (nothing on top of it now)
      (clear ?under)

      ;; b is no longer clear because it is held
      (not (clear ?b))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Pick up a block ?b from the table ?t
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
      ;; remove b from table and hold it
      (not (on ?b ?t))
      (not (handempty ?a))
      (holding ?a ?b)

      ;; b is not clear while held
      (not (clear ?b))

      ;; advance stage
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
      ;; place b on target and release hand
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?target)

      ;; target is no longer clear; b becomes clear (no blocks on top)
      (not (clear ?target))
      (clear ?b)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down block ?b onto the table ?t
  (:action putdown
    :parameters (?a - agent ?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?a ?b)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      ;; place b on table and release hand
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?t)

      ;; b is clear after being put down (nothing on top)
      (clear ?b)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)