(define (domain calendar-scheduling)
  (:requirements :typing :strips :negative-preconditions)
  (:types participant timeslot)

  (:predicates
    (busy ?p - participant ?s - timeslot)
    (within-work ?s - timeslot)
    (scheduled ?s - timeslot)
    (assigned ?p - participant ?s - timeslot)
  )

  (:action schedule-meeting-at-slot
    :parameters (?s - timeslot)
    :precondition (and
      (within-work ?s)
      (not (scheduled ?s))
      (not (busy donna ?s))
      (not (busy john ?s))
      (not (busy billy ?s))
    )
    :effect (and
      (scheduled ?s)
      (assigned donna ?s)
      (assigned john ?s)
      (assigned billy ?s)
    )
  )
)