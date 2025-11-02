(define (domain merged-meeting-scheduling)
  (:requirements :typing :negative-preconditions :equality)
  (:types person slot meeting)
  (:predicates
    ;; typing/identity predicates (used by some agents' actions)
    (person ?p - person)
    (slot ?s - slot)
    (work-slot ?s - slot)

    ;; availability / free predicates (agents used different names: available / free)
    (available ?p - person ?s - slot)
    (free ?p - person ?s - slot)

    ;; various scheduling predicates produced by different agents
    (scheduled-slot ?s - slot)         ;; from agent1 (scheduled ?t)
    (meeting-at ?s - slot)             ;; from agent2
    (attending ?p - person ?s - slot)  ;; from agent2
    (meeting ?m - meeting)             ;; from agent3
    (scheduled ?m - meeting)           ;; from agent3
    (scheduled-at ?m - meeting ?s - slot) ;; from agent3
    (booked ?s - slot)                 ;; from agent3
  )

  ;; Actions kept distinct for each agent (original semantics preserved as much as possible).

  ;; Agent 1's scheduling action (keeps the original style: single parameter slot,
  ;; and explicitly references brittany, emily, doris as in their submitted PDDL).
  (:action schedule_agent1
    :parameters (?s - slot)
    :precondition (and
      (available brittany ?s)
      (available emily ?s)
      (available doris ?s))
    :effect (scheduled-slot ?s)
  )

  ;; Agent 2's scheduling action (parameterized participants, uses free/work-slot).
  (:action schedule_meeting_agent2
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (work-slot ?s)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (meeting-at ?s)
      (attending ?p1 ?s)
      (attending ?p2 ?s)
      (attending ?p3 ?s)
      (not (free ?p1 ?s))
      (not (free ?p2 ?s))
      (not (free ?p3 ?s))
    )
  )

  ;; Agent 3's scheduling action (creates an explicit meeting object and booked slot).
  (:action schedule_meeting_agent3
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (person ?p1) (person ?p2) (person ?p3)
      (available ?p1 ?s) (available ?p2 ?s) (available ?p3 ?s)
      (not (booked ?s))
    )
    :effect (and
      (scheduled ?m)
      (scheduled-at ?m ?s)
      (booked ?s)
      (not (available ?p1 ?s))
      (not (available ?p2 ?s))
      (not (available ?p3 ?s))
    )
  )
)