(define (domain multi-agent-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (agent-available ?a - agent)
    (slot-free ?s - slot)
    (slot-unavailable ?s - slot)
    (slot-used ?s - slot)
    (done-paltry)
    (done-sip)
    (done-clip)
    (done-wretched)
    (done-memory)
    (done-tightfisted)
  )
  (:action paltry
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s))
    )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-paltry)
    )
  )
  (:action sip
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s))
    )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-sip)
    )
  )
  (:action clip
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s))
    )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-clip)
    )
  )
  (:action wretched
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s))
    )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-wretched)
    )
  )
  (:action memory
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s))
    )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-memory)
    )
  )
  (:action tightfisted
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s))
    )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-tightfisted)
    )
  )
)