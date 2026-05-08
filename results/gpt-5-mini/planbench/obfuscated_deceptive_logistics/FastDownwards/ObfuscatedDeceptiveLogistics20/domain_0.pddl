(define (domain multiagent-sequential-tasks)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location slot)

  (:predicates
    ; agent location at a particular slot
    (at ?a - agent ?l - location ?s - slot)

    ; task status per site at a particular slot
    (inspected ?site - location ?s - slot)
    (repaired ?site - location ?s - slot)
    (reported ?site - location ?s - slot)

    ; successor relation between slots enforces contiguity
    (slot-successor ?s1 - slot ?s2 - slot)

    ; ensures an agent performs at most one action in a given slot
    (free ?a - agent ?s - slot)
  )

  ; Move: agent moves from one location in slot s1 to another location in the successor slot s2.
  ; This consumes the agent's free token for slot s1 (so the agent cannot do another action in s1).
  (:action move
    :parameters (?a - agent ?from - location ?to - location ?s1 - slot ?s2 - slot)
    :precondition (and
      (at ?a ?from ?s1)
      (slot-successor ?s1 ?s2)
      (free ?a ?s1)
      (not (at ?a ?to ?s2)) ; prevent trivial no-op creation of duplicate at facts
    )
    :effect (and
      (not (at ?a ?from ?s1))
      (at ?a ?to ?s2)
      (not (free ?a ?s1))
    )
  )

  ; Inspect: an agent inspects a site at a given slot. Must be at the site and free in that slot.
  (:action inspect
    :parameters (?a - agent ?site - location ?s - slot)
    :precondition (and
      (at ?a ?site ?s)
      (free ?a ?s)
      (not (inspected ?site ?s))
    )
    :effect (and
      (inspected ?site ?s)
      (not (free ?a ?s))
    )
  )

  ; Repair: must occur in the successor slot of when the site was inspected.
  ; Repair requires the site was inspected in the immediate predecessor slot.
  (:action repair
    :parameters (?a - agent ?site - location ?s_prev - slot ?s - slot)
    :precondition (and
      (slot-successor ?s_prev ?s)
      (inspected ?site ?s_prev)
      (at ?a ?site ?s)
      (free ?a ?s)
      (not (repaired ?site ?s))
    )
    :effect (and
      (repaired ?site ?s)
      (not (free ?a ?s))
    )
  )

  ; Report: must occur in the successor slot of when the site was repaired.
  (:action report
    :parameters (?a - agent ?site - location ?s_prev - slot ?s - slot)
    :precondition (and
      (slot-successor ?s_prev ?s)
      (repaired ?site ?s_prev)
      (at ?a ?site ?s)
      (free ?a ?s)
      (not (reported ?site ?s))
    )
    :effect (and
      (reported ?site ?s)
      (not (free ?a ?s))
    )
  )
)