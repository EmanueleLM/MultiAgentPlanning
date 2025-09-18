(define (domain orchestrated-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot meeting)

  ;; Core entity predicates (integrated but namespaced where necessary to avoid arity/name conflicts)
  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (meeting ?m - meeting)

    ;; From Agent 1
    (available ?p - person ?s - slot)          ; agent1: person known available in that slot
    (preferred ?p - person ?s - slot)          ; agent1: person prefers this slot
    (within-workhours ?s - slot)               ; agent1: slot is within 09:00-17:00
    (occupied ?s - slot)                       ; agent1: slot already occupied
    (pending-confirmation ?p - person ?m - meeting) ; agent1: participant must confirm

    ;; From Agent 2 / 3 (unified free predicate)
    (free ?p - person ?s - slot)               ; agent2/3: participant is free at slot

    ;; Agent 2's meeting representation (namespaced)
    (meeting-scheduled-a2 ?m - meeting ?s - slot) ; agent2: meeting scheduled at slot
    (in-meeting ?p - person ?m - meeting)         ; agent2: participant is in meeting

    ;; Agent 3's representation (namespaced)
    (scheduled-a3 ?s - slot)                    ; agent3: slot is scheduled/used

    ;; Agent 1's scheduled representation (namespaced to avoid arity clash)
    (scheduled-a1 ?m - meeting ?s - slot)       ; agent1: meeting m scheduled at slot
  )

  ;; Actions from Agent 1 (kept distinct / namespaced)
  (:action schedule-meeting-A1
    :parameters (?m - meeting ?s - slot ?organizer - person)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (within-workhours ?s)
      (available ?organizer ?s)
      (preferred ?organizer ?s)
      (not (occupied ?s))
    )
    :effect (and
      (scheduled-a1 ?m ?s)
      (occupied ?s)
      ;; propagate scheduling to other agents' representations so the orchestrated plan can satisfy all views
      (meeting-scheduled-a2 ?m ?s)
      (scheduled-a3 ?s)
      (in-meeting ?organizer ?m)
    )
  )

  (:action request-confirmation-A1
    :parameters (?p - person ?m - meeting)
    :precondition (and
      (person ?p)
      (meeting ?m)
    )
    :effect (pending-confirmation ?p ?m)
  )

  ;; Actions from Agent 2 (kept distinct / namespaced)
  (:action schedule-A2
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (not (meeting-scheduled-a2 ?m ?s))
    )
    :effect (and
      (meeting-scheduled-a2 ?m ?s)
      (in-meeting ?p1 ?m)
      (in-meeting ?p2 ?m)
      (in-meeting ?p3 ?m)
      ;; propagate to other representations
      (scheduled-a1 ?m ?s)
      (scheduled-a3 ?s)
      (occupied ?s)
    )
  )

  ;; Action from Agent 3 (kept distinct / namespaced)
  ;; Agent 3 originally required only Brenda free at time; we preserve that semantic but allow scheduling for a given meeting.
  (:action schedule-meeting-A3
    :parameters (?m - meeting ?s - slot)
    :precondition (free brenda ?s)
    :effect (and
      (scheduled-a3 ?s)
      ;; propagate to other representations for orchestration
      (meeting-scheduled-a2 ?m ?s)
      (scheduled-a1 ?m ?s)
      (in-meeting brenda ?m)
      (occupied ?s)
    )
  )
)