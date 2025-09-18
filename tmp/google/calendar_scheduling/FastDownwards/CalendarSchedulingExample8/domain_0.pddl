(define (domain integrated-scheduling)
  (:requirements :typing :strips :negative-preconditions :equality)
  (:types person slot meeting)
  (:predicates
    ;; basic objects
    (slot ?s - slot)
    (meeting ?m - meeting)
    (meeting-participant ?m - meeting ?p - person)

    ;; availability / free / busy facts from agents (kept distinct as facts)
    (available ?p - person ?s - slot)   ; agent1-style availability (Adam known available)
    (free ?p - person ?s - slot)        ; agent2/agent3-style free facts
    (busy ?p - person ?s - slot)        ; explicit known busy facts (from agents)

    ;; slot bookkeeping
    (slot-free ?s - slot)

    ;; scheduling outcomes (shared goal predicate)
    (meeting_scheduled ?s - slot)

    ;; agent3 negotiation predicates (kept distinct)
    (proposed ?s - slot)
    (proposal-made)
    (confirmation-requested ?p - person ?s - slot)
    (confirmed ?p - person ?s - slot)
  )

  ;; Agent1's scheduling action (keeps action distinct)
  (:action schedule-by-agent1
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (meeting-participant ?m ?p1) (meeting-participant ?m ?p2) (meeting-participant ?m ?p3)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))
      ;; uses agent1's availability facts
      (available ?p1 ?s) (available ?p2 ?s) (available ?p3 ?s)
      ;; do not schedule when someone is known busy by any agent
      (not (busy ?p1 ?s)) (not (busy ?p2 ?s)) (not (busy ?p3 ?s))
      (slot-free ?s)
    )
    :effect (and
      (meeting_scheduled ?s)
      (not (slot-free ?s))
    )
  )

  ;; Agent2's scheduling action (keeps action distinct)
  (:action schedule-by-agent2
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      ;; requires agent2 free facts for all three participants
      (free adam ?s)
      (free jerry ?s)
      (free matthew ?s)
      ;; ensure none are known busy by any agent's information
      (not (busy adam ?s)) (not (busy jerry ?s)) (not (busy matthew ?s))
      (slot-free ?s)
    )
    :effect (and
      (meeting_scheduled ?s)
      ;; consume the free facts for that slot (agent2 semantics)
      (not (free adam ?s))
      (not (free jerry ?s))
      (not (free matthew ?s))
      (not (slot-free ?s))
    )
  )

  ;; Agent3's negotiation actions (keeps actions distinct)
  (:action propose-by-agent3
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      ;; agent3 only proposes slots where Matthew (the user) is free (agent3 knowledge)
      (free matthew ?s)
      (slot-free ?s)
    )
    :effect (and
      (proposed ?s)
      (proposal-made)
      (confirmation-requested adam ?s)
      (confirmation-requested jerry ?s)
    )
  )

  (:action confirm-by-agent3
    :parameters (?p - person ?s - slot ?m - meeting)
    :precondition (and
      ;; require that ?p is a participant in the meeting and a proposal exists
      (meeting-participant ?m ?p)
      (proposed ?s)
      (confirmation-requested ?p ?s)
      ;; confirmations only possible if an explicit available fact (from some source) exists
      (available ?p ?s)
      ;; also ensure not busy (explicit busy facts override)
      (not (busy ?p ?s))
    )
    :effect (confirmed ?p ?s)
  )

  (:action finalize-by-agent3
    :parameters (?s - slot ?m - meeting)
    :precondition (and
      (proposed ?s)
      (meeting-participant ?m adam) (meeting-participant ?m jerry) (meeting-participant ?m matthew)
      (confirmed adam ?s) (confirmed jerry ?s) (confirmed matthew ?s)
      (slot-free ?s)
    )
    :effect (and
      (meeting_scheduled ?s)
      (not (slot-free ?s))
    )
  )
)