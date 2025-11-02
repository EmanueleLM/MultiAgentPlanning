(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    ;; basic types
    (slot ?s - slot)
    (person ?p - person)

    ;; Agent-specific availability/busy representations (kept distinct)
    (busy ?p - person ?s - slot)        ; from agent1
    (free ?p - person ?s - slot)        ; from agent2
    (available ?p - person ?s - slot)   ; from agent3

    ;; Scheduling markers (supporting multiple agents' expectations)
    (scheduled ?s - slot)               ; from agent1
    (scheduled-for ?p - person ?s - slot) ; from agent3 (per-person scheduled flag)

    ;; global meeting markers in the various forms used by agents
    (meeting-scheduled)                 ; nullary (agent1 style)
    (meeting-at ?s - slot)              ; agent1 records where
    (meeting-unscheduled)               ; agent2 uses this as precondition
    (meeting-scheduled-slot ?s - slot)  ; agent2/agent3 style: meeting-scheduled with slot
  )

  ;; Agent1's scheduling action (keeps agent1 constraints distinct: uses busy)
  (:action schedule_from_agent1
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (scheduled ?s))
      (not (busy alexander ?s))
      (not (busy elizabeth ?s))
      (not (busy walter ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
      (meeting-at ?s)
      (meeting-scheduled-slot ?s)
      (scheduled-for alexander ?s)
      (scheduled-for elizabeth ?s)
      (scheduled-for walter ?s)
      (not (meeting-unscheduled))
    )
  )

  ;; Agent2's scheduling action (keeps agent2 constraints distinct: uses free and meeting-unscheduled)
  (:action schedule_from_agent2
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (meeting-unscheduled)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (meeting-scheduled-slot ?s)
      (meeting-scheduled)
      (meeting-at ?s)
      (scheduled ?s)
      (scheduled-for ?p1 ?s)
      (scheduled-for ?p2 ?s)
      (scheduled-for ?p3 ?s)
      (not (meeting-unscheduled))
    )
  )

  ;; Agent3's scheduling action (keeps agent3 constraints distinct: uses available)
  (:action schedule_from_agent3
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (available alexander ?s)
      (available elizabeth ?s)
      (available walter ?s)
      (not (meeting-scheduled-slot ?s))
    )
    :effect (and
      (meeting-scheduled-slot ?s)
      (meeting-scheduled)
      (meeting-at ?s)
      (scheduled ?s)
      (scheduled-for alexander ?s)
      (scheduled-for elizabeth ?s)
      (scheduled-for walter ?s)
      (not (meeting-unscheduled))
    )
  )
)