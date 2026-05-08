(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:predicates
    (current_slot ?t - timeslot)
    (next_slot ?t1 - timeslot ?t2 - timeslot)
    (free ?p - participant ?t - timeslot)
    (scheduled_at ?t - timeslot)
    (meeting_scheduled)
  )

  (:action advance_to_next_slot
    :parameters (?from - timeslot ?to - timeslot)
    :precondition (and
      (current_slot ?from)
      (next_slot ?from ?to)
      (not (meeting_scheduled))
    )
    :effect (and
      (not (current_slot ?from))
      (current_slot ?to)
    )
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (current_slot ?t)
      (free andrew ?t)
      (free grace ?t)
      (free samuel ?t)
      (not (meeting_scheduled))
    )
    :effect (and
      (scheduled_at ?t)
      (meeting_scheduled)
    )
  )
)