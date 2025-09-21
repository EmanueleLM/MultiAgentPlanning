(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person time slot)

  (:predicates
    ;; Time/slot availability
    (free ?p - person ?t - time)
    (free-slot ?p - person ?s - slot)
    (available ?p - person ?t - time)

    ;; Slot / time bookkeeping
    (slot ?s - slot)
    (slot-time ?s - slot ?t - time)

    ;; Agent/participant markers
    (participant ?p - person)
    (is-host ?p - person)
    (can-schedule)

    ;; Scheduling state (kept distinct where agents used different predicates)
    (meeting-scheduled)
    (scheduled-time ?t - time)
    (scheduled-slot ?s - slot)
    (meeting-at-time ?t - time)
    (meeting-at-slot ?s - slot)

    ;; Meeting membership: two different shapes used by different agents
    (meeting-with ?p - person)
    (meeting-with-2 ?s - slot ?p1 - person ?p2 - person)

    ;; Agent-2 feasible-slot marker
    (feasible ?s - slot)

    ;; Preference marker from agent-1
    (before13 ?t - time)
  )

  ;; ------------------------
  ;; Agent 1 actions (kept distinct)
  ;; schedule-before has a positive cost to encode preference avoidance
  ;; ------------------------
  (:action schedule-before
    :parameters (?t - time ?g - person ?r - person ?b - person)
    :precondition (and
      (before13 ?t)
      (free ?g ?t) (free ?r ?t) (free ?b ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-time ?t)
      (meeting-at-time ?t)
    )
    :cost 1
  )

  (:action schedule-after
    :parameters (?t - time ?g - person ?r - person ?b - person)
    :precondition (and
      (not (before13 ?t))
      (free ?g ?t) (free ?r ?t) (free ?b ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-time ?t)
      (meeting-at-time ?t)
    )
    :cost 0
  )

  ;; ------------------------
  ;; Agent 2 actions (kept distinct)
  ;; ------------------------
  (:action schedule-meeting-2
    :parameters (?s - slot ?p1 - person ?p2 - person)
    :precondition (and
      (slot ?s)
      (participant ?p1) (participant ?p2)
      (free-slot roy ?s)
      (feasible ?s)
      (not (scheduled-slot ?s))
    )
    :effect (and
      (scheduled-slot ?s)
      (meeting-at-slot ?s)
      (meeting-with-2 ?s ?p1 ?p2)
      (meeting-scheduled)
    )
    :cost 0
  )

  ;; ------------------------
  ;; Agent 3 actions (kept distinct)
  ;; ------------------------
  (:action schedule-meeting-3
    :parameters (?host - person ?t - time)
    :precondition (and
      (can-schedule)
      (is-host ?host)
      (available ?host ?t)
    )
    :effect (and
      (not (can-schedule))
      (meeting-scheduled)
      (meeting-at-time ?t)
      (meeting-with gerald)
      (meeting-with roy)
    )
    :cost 0
  )

  ;; ------------------------
  ;; Orchestrator bridging action
  ;; ------------------------
  (:action bridge-time-to-slot
    :parameters (?t - time ?s - slot ?p1 - person ?p2 - person)
    :precondition (and
      (scheduled-time ?t)
      (slot-time ?s ?t)
      (participant ?p1) (participant ?p2)
      (not (meeting-with ?p1))
    )
    :effect (and
      (meeting-with ?p1)
      (meeting-with ?p2)
      (meeting-with-2 ?s ?p1 ?p2)
      (scheduled-slot ?s)
      (meeting-at-slot ?s)
    )
    :cost 0
  )
)