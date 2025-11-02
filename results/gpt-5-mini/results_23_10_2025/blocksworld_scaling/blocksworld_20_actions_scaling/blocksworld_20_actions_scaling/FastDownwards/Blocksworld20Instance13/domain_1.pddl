(define (domain blocks-world-multiagent-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent step)

  (:predicates
    ;; standard blocks-world relations
    (on ?x - block ?y - block)        ;; ?x directly on ?y
    (ontable ?x - block)              ;; ?x directly on the table
    (clear ?x - block)                ;; nothing on top of ?x

    ;; multi-agent holding / hand status
    (holding ?a - agent ?x - block)   ;; agent ?a is holding block ?x
    (freehand ?a - agent)             ;; agent ?a has a free hand (not holding)

    ;; sequence control
    (cur-step ?s - step)              ;; current step marker
    ;; expectations: these lock each step to the exact required operation & operands
    (expect-unstack ?s - step ?x - block ?y - block ?s2 - step)
    (expect-stack   ?s - step ?x - block ?y - block ?s2 - step)
    (expect-pickup  ?s - step ?x - block ?s2 - step)
    (expect-putdown ?s - step ?x - block ?s2 - step)
    ;; a small helper to indicate that a particular agent is allowed to perform the step
    (can-do ?a - agent ?s - step)
  )

  ;; Unstack (take top block ?x from block ?y)
  (:action unstack
    :parameters (?a - agent ?x - block ?y - block ?s - step ?s2 - step)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (freehand ?a)
      (cur-step ?s)
      (expect-unstack ?s ?x ?y ?s2)
      (can-do ?a ?s)
    )
    :effect (and
      (not (on ?x ?y))
      (holding ?a ?x)
      (clear ?y)
      (not (freehand ?a))
      (not (cur-step ?s))
      (cur-step ?s2)
      (not (expect-unstack ?s ?x ?y ?s2))
    )
  )

  ;; Stack (place held block ?x onto block ?y)
  (:action stack
    :parameters (?a - agent ?x - block ?y - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?a ?x)
      (clear ?y)
      (cur-step ?s)
      (expect-stack ?s ?x ?y ?s2)
      (can-do ?a ?s)
    )
    :effect (and
      (on ?x ?y)
      (not (clear ?y))
      (freehand ?a)
      (not (holding ?a ?x))
      (clear ?x)
      (not (cur-step ?s))
      (cur-step ?s2)
      (not (expect-stack ?s ?x ?y ?s2))
    )
  )

  ;; Pickup (pick up a block from the table)
  (:action pickup
    :parameters (?a - agent ?x - block ?s - step ?s2 - step)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (freehand ?a)
      (cur-step ?s)
      (expect-pickup ?s ?x ?s2)
      (can-do ?a ?s)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (freehand ?a))
      (holding ?a ?x)
      (not (cur-step ?s))
      (cur-step ?s2)
      (not (expect-pickup ?s ?x ?s2))
    )
  )

  ;; Putdown (put a held block down onto the table)
  (:action putdown
    :parameters (?a - agent ?x - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?a ?x)
      (cur-step ?s)
      (expect-putdown ?s ?x ?s2)
      (can-do ?a ?s)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (freehand ?a)
      (not (holding ?a ?x))
      (not (cur-step ?s))
      (cur-step ?s2)
      (not (expect-putdown ?s ?x ?s2))
    )
  )
)