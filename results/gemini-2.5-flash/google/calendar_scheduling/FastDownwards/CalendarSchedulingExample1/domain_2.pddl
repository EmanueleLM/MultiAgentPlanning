(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (available ?p - person ?s - timeslot)
    (meeting_scheduled ?s - timeslot)
  )

  (:action schedule_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (available raymond ?s)
      (available billy ?s)
      (available donald ?s)
    )
    :effect (meeting_scheduled ?s)
  )
)