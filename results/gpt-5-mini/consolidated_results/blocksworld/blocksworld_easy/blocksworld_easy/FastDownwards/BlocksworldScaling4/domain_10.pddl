(define (domain blocks-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block support agent stage)

  (:predicates
    (on ?b - block ?p - support)
    (clear ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

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
      (holding ?a ?b)
      (not (handempty ?a))
      (clear ?under)
      (not (clear ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action pickup
    :parameters (?a - agent ?b - block ?t - support ?s - stage ?s2 - stage)
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
      (holding ?a ?b)
      (not (handempty ?a))
      (not (clear ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action stack
    :parameters (?a - agent ?b - block ?target - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?a ?b)
      (clear ?target)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
      (not (= ?b ?target))
    )
    :effect (and
      (on ?b ?target)
      (handempty ?a)
      (not (holding ?a ?b))
      (not (clear ?target))
      (clear ?b)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action putdown
    :parameters (?a - agent ?b - block ?t - support ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?a ?b)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      (on ?b ?t)
      (handempty ?a)
      (not (holding ?a ?b))
      (clear ?b)
      (not (current ?s))
      (current ?s2)
    )
  )
)