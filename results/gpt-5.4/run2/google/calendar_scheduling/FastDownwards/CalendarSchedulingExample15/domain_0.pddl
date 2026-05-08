(define (domain schedule_meeting_monday_halfhour)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:predicates
    (participant_required ?p - participant)
    (blocked ?p - participant ?t - timeslot)
    (meeting_scheduled)
    (chosen_slot ?t - timeslot)
  )

  (:action schedule_meeting_at
    :parameters (?t - timeslot)
    :precondition
      (and
        (not (meeting_scheduled))
        (not (blocked joyce ?t))
        (not (blocked christine ?t))
        (not (blocked alexander ?t))
      )
    :effect
      (and
        (meeting_scheduled)
        (chosen_slot ?t)
      )
  )
)