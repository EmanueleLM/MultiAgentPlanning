(define (domain monday_meeting_scheduling_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:constants
    alexander elizabeth walter - participant
  )

  (:predicates
    (busy ?p - participant ?t - timeslot)
    (within_workday ?t - timeslot)
    (scheduled ?m - meeting ?t - timeslot)
    (meeting_scheduled ?m - meeting)
    (unscheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (unscheduled ?m)
      (within_workday ?t)
      (not (busy alexander ?t))
      (not (busy elizabeth ?t))
      (not (busy walter ?t))
    )
    :effect (and
      (scheduled ?m ?t)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )
)