(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    david eric roger - person
  )
  (:predicates
    (available ?p - person ?s - timeslot)
    (next ?s1 ?s2 - timeslot)
    (meeting_scheduled)
  )

  (:action schedule_1hr_meeting
    :parameters (?s1 ?s2 - timeslot)
    :precondition (and
      (next ?s1 ?s2)
      (available david ?s1)
      (available david ?s2)
      (available eric ?s1)
      (available eric ?s2)
      (available roger ?s1)
      (available roger ?s2)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)