(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    ;; true when every required participant is free at ?s (intersection of individual availability)
    (free-all ?s - slot)
    ;; allowed marks slots that remain after applying soft-preference resolution
    (allowed ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Schedule the meeting at a single slot that is both a validated candidate (free-all)
  ;; and allowed after applying soft preferences. Prevent scheduling more than one meeting
  ;; by requiring meeting has not yet been scheduled.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (free-all ?s)
      (allowed ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)