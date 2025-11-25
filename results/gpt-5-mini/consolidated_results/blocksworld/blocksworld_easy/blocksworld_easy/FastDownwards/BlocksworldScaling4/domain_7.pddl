(define (domain blocks-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table - support agent stage)

  (:predicates
    (on ?b - block ?p - support)
    (clear ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
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
      (not (current ?s2))
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