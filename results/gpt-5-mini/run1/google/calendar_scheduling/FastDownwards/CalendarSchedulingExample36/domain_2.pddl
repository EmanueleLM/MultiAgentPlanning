(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person meeting timeslot)

  (:predicates
    (next ?s ?t - timeslot)
    (free ?p - person ?s - timeslot)
    (allowed_start ?s - timeslot)
    (scheduled ?m - meeting)
    (meeting_at ?m - meeting ?s - timeslot)
  )

  ;; Schedule the specific three-person meeting (ryan, ruth, denise).
  ;; The action enforces that each named participant is free at both consecutive
  ;; 30-minute slots (representing a 1-hour meeting).
  (:action schedule_meeting
    :parameters (?m - meeting ?s ?next - timeslot)
    :precondition (and
      (not (scheduled ?m))
      (next ?s ?next)
      (allowed_start ?s)
      ;; Explicitly require the three distinct named participants to be free.
      (free ryan ?s) (free ryan ?next)
      (free ruth ?s) (free ruth ?next)
      (free denise ?s) (free denise ?next)
    )
    :effect (and
      (scheduled ?m)
      (meeting_at ?m ?s)
      ;; Occupy both timeslots for each participant
      (not (free ryan ?s)) (not (free ryan ?next))
      (not (free ruth ?s)) (not (free ruth ?next))
      (not (free denise ?s)) (not (free denise ?next))
    )
  )
)