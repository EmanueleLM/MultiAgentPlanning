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

  ;; Schedule a specific meeting for three named participants.
  ;; The meeting spans two consecutive 30-minute timeslots (1 hour).
  (:action schedule_meeting
    :parameters (?m - meeting ?s ?next - timeslot ?p1 ?p2 ?p3 - person)
    :precondition (and
      (not (scheduled ?m))
      (next ?s ?next)
      (allowed_start ?s)
      (free ?p1 ?s) (free ?p1 ?next)
      (free ?p2 ?s) (free ?p2 ?next)
      (free ?p3 ?s) (free ?p3 ?next)
    )
    :effect (and
      (scheduled ?m)
      (meeting_at ?m ?s)
      (not (free ?p1 ?s)) (not (free ?p1 ?next))
      (not (free ?p2 ?s)) (not (free ?p2 ?next))
      (not (free ?p3 ?s)) (not (free ?p3 ?next))
    )
  )
)