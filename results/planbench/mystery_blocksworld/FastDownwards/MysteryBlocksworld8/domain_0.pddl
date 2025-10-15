; Domain: integrated multi-agent scheduling domain for FastDownwards
; Assumptions and resolutions:
; - The observer and manipulator agents' models were not provided as explicit PDDL.
;   I therefore encoded a conservative, explicit model that preserves the requirement
;   that each public action (paltry, sip, clip, wretched, memory, tightfisted)
;   is distinct, has an agent, requires an available time-slot, and yields a corresponding "done" fluent.
; - Temporal preferences from the natural-language descriptions were treated as hard
;   constraints by modeling discrete time slots (s1, s2, s3). An action must claim a slot.
;   The "earliest" preference is enforced in the problem initial state by marking earlier
;   slots as unavailable when required; because the original unavailable-slot data was not supplied,
;   I assumed that s1 is the earliest available slot. This is documented below and can be changed.
; - No extra actions or capabilities were invented beyond the six required actions.
; - Each action requires the acting agent to be available. Effects: the slot becomes used,
;   the action's done fluent becomes true, and the agent remains available (we model slots to
;   prevent reuse rather than model agent busy/unbusy across time).
; - If you need a different interpretation for preconditions/effects (e.g., agents become busy),
;   update the domain accordingly. The comments explicitly document the assumptions so you can revise them.

(define (domain multi-agent-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types agent slot)

  ; Predicates
  (:predicates
    (agent-available ?a - agent) ; agent is available to act
    (slot-free ?s - slot)        ; slot not yet taken / available
    (slot-unavailable ?s - slot) ; slot permanently unavailable (e.g., constraints)
    (slot-used ?s - slot)        ; slot has been used/scheduled
    (done-paltry)
    (done-sip)
    (done-clip)
    (done-wretched)
    (done-memory)
    (done-tightfisted)
  )

  ; Action: paltry
  ; Assumed: performed by observer (but action is generic and accepts any agent)
  (:action paltry
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s)) )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-paltry) )
  )

  ; Action: sip
  (:action sip
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s)) )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-sip) )
  )

  ; Action: clip
  (:action clip
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s)) )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-clip) )
  )

  ; Action: wretched
  (:action wretched
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s)) )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-wretched) )
  )

  ; Action: memory
  (:action memory
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s)) )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-memory) )
  )

  ; Action: tightfisted
  (:action tightfisted
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (agent-available ?ag)
      (slot-free ?s)
      (not (slot-unavailable ?s)) )
    :effect (and
      (not (slot-free ?s))
      (slot-used ?s)
      (done-tightfisted) )
  )
)