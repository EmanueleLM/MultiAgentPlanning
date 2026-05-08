(define (domain schedule_meeting_monday_halfhour)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:predicates
    (blocked ?p - participant ?t - timeslot)
    (meeting_scheduled)
    (chosen_slot ?t - timeslot)
  )

  (:action schedule_meeting_at
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?t - timeslot)
    :precondition
      (and
        (not (meeting_scheduled))
        (not (blocked ?p1 ?t))
        (not (blocked ?p2 ?t))
        (not (blocked ?p3 ?t))
      )
    :effect
      (and
        (meeting_scheduled)
        (chosen_slot ?t)
      )
  )
)