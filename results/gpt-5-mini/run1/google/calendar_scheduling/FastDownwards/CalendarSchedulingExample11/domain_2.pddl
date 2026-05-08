(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:constants alexander elizabeth walter - person)

  (:predicates
    (free ?p - person ?s - timeslot)
    (slot_occupied ?s - timeslot)
    (meeting_not_scheduled)
    (meeting_scheduled)
    (meeting_at ?s - timeslot)
    (attending ?p - person ?s - timeslot)
    (next ?s1 - timeslot ?s2 - timeslot)
  )

  ;; Single scheduling action: schedules a 30-minute meeting (one timeslot)
  (:action schedule_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (meeting_not_scheduled)
      (not (slot_occupied ?s))
      (free alexander ?s)
      (free elizabeth ?s)
      (free walter ?s)
    )
    :effect (and
      (not (meeting_not_scheduled))
      (meeting_scheduled)
      (meeting_at ?s)
      (attending alexander ?s)
      (attending elizabeth ?s)
      (attending walter ?s)
      (slot_occupied ?s)
    )
  )
)