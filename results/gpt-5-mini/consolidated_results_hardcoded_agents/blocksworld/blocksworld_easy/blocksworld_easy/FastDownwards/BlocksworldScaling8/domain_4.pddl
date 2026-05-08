(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?t - block)        ; ?b is directly on top of ?t
    (ontable ?b - block)              ; ?b is directly on the table
    (clear ?b - block)                ; nothing on top of ?b and ?b is not being held
    (holding ?b - block)              ; agent is holding ?b
    (handempty)                       ; agent's hand is empty
    (current ?s - stage)              ; current discrete stage
    (next ?s1 - stage ?s2 - stage)    ; successor relation for stages
  )

  ;; Pick up a clear block from the table at stage ?s, advancing to ?s2
  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ;; Put down a held block onto the table at stage ?s, advancing to ?s2
  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Stack a held block ?b onto a clear block ?t at stage ?s, advancing to ?s2
  (:action stack-onto
    :parameters (?b - block ?t - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (holding ?b)
      (clear ?t)
      (not (= ?b ?t))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (on ?b ?t)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?t))
      (not (ontable ?b))
    )
  )

  ;; Unstack a clear block ?b from on top of ?t (pick it up) at stage ?s, advancing to ?s2
  (:action unstack-from
    :parameters (?b - block ?t - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?b ?t)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (holding ?b)
      (clear ?t)
      (not (on ?b ?t))
      (not (clear ?b))
      (not (handempty))
      (not (ontable ?b))
    )
  )
)