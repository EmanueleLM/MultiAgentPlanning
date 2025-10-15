(define (domain multiagent-tasks)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (agent ?a)
    (task ?t)
    (resource ?r)
    (slot ?s)
    (earliest ?s)               ; slot marked as "earliest" for tasks that require earliest
    (available ?r)              ; resource is free
    (slot-free ?s)              ; slot is not yet taken
    (requires ?t ?r)            ; static: task requires a particular resource
    (assigned ?t ?a)            ; task assigned to agent
    (assigned-slot ?t ?s)       ; task assigned to a slot
    (completed ?t)              ; task finished
  )

  ;; Action schema for paltry
  ;; paltry must be executed by some agent, requires a specific resource,
  ;; and (in public constraints) must be scheduled at the earliest slot.
  (:action paltry
    :parameters (?a ?s ?r)
    :precondition (and
      (agent ?a)
      (task paltry)
      (slot ?s)
      (earliest ?s)
      (slot-free ?s)
      (resource ?r)
      (available ?r)
      (requires paltry ?r)
    )
    :effect (and
      (not (slot-free ?s))
      (not (available ?r))
      (assigned paltry ?a)
      (assigned-slot paltry ?s)
      (completed paltry)
    )
  )

  ;; Action schema for sip
  ;; sip requires a resource and prefers (treated as constraint) an earliest slot.
  (:action sip
    :parameters (?a ?s ?r)
    :precondition (and
      (agent ?a)
      (task sip)
      (slot ?s)
      (earliest ?s)
      (slot-free ?s)
      (resource ?r)
      (available ?r)
      (requires sip ?r)
    )
    :effect (and
      (not (slot-free ?s))
      (not (available ?r))
      (assigned sip ?a)
      (assigned-slot sip ?s)
      (completed sip)
    )
  )

  ;; Action schema for clip
  ;; clip requires a resource but has no explicit earliest-slot constraint.
  (:action clip
    :parameters (?a ?s ?r)
    :precondition (and
      (agent ?a)
      (task clip)
      (slot ?s)
      (slot-free ?s)
      (resource ?r)
      (available ?r)
      (requires clip ?r)
    )
    :effect (and
      (not (slot-free ?s))
      (not (available ?r))
      (assigned clip ?a)
      (assigned-slot clip ?s)
      (completed clip)
    )
  )

  ;; Action schema for wretched
  ;; wretched requires a resource, no earliest requirement.
  (:action wretched
    :parameters (?a ?s ?r)
    :precondition (and
      (agent ?a)
      (task wretched)
      (slot ?s)
      (slot-free ?s)
      (resource ?r)
      (available ?r)
      (requires wretched ?r)
    )
    :effect (and
      (not (slot-free ?s))
      (not (available ?r))
      (assigned wretched ?a)
      (assigned-slot wretched ?s)
      (completed wretched)
    )
  )

  ;; Action schema for memory
  ;; memory requires a resource; modeled as needing resource but not necessarily earliest.
  (:action memory
    :parameters (?a ?s ?r)
    :precondition (and
      (agent ?a)
      (task memory)
      (slot ?s)
      (slot-free ?s)
      (resource ?r)
      (available ?r)
      (requires memory ?r)
    )
    :effect (and
      (not (slot-free ?s))
      (not (available ?r))
      (assigned memory ?a)
      (assigned-slot memory ?s)
      (completed memory)
    )
  )

  ;; Action schema for tightfisted
  ;; tightfisted requires a resource and (if present in the public constraints) may be earliest; here modeled without earliest unless set up in problem.
  (:action tightfisted
    :parameters (?a ?s ?r)
    :precondition (and
      (agent ?a)
      (task tightfisted)
      (slot ?s)
      (slot-free ?s)
      (resource ?r)
      (available ?r)
      (requires tightfisted ?r)
    )
    :effect (and
      (not (slot-free ?s))
      (not (available ?r))
      (assigned tightfisted ?a)
      (assigned-slot tightfisted ?s)
      (completed tightfisted)
    )
  )

)