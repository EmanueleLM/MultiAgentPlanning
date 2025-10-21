(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (available ?p - participant ?s - timeslot)
    (common ?s - timeslot)
    (scheduled)
    (assigned ?s - timeslot)
  )

  (:action schedule-meeting
    :parameters (?s - timeslot)
    :precondition (and (common ?s) (not (scheduled)))
    :effect (and (scheduled) (assigned ?s))
  )
)