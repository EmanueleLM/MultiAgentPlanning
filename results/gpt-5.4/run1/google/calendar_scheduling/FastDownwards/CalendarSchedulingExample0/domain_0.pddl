(define (domain meeting_schedule_monday)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (next_slot ?t1 - timeslot ?t2 - timeslot)
    (meeting_start ?t - timeslot)
    (meeting_scheduled)
    (occupied ?t - timeslot)
  )

  (:action schedule_one_hour_meeting
    :parameters (?start - timeslot ?end - timeslot)
    :precondition (and
      (not (meeting_scheduled))
      (next_slot ?start ?end)
      (free michelle ?start)
      (free michelle ?end)
      (free steven ?start)
      (free steven ?end)
      (free jerry ?start)
      (free jerry ?end)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?start)
      (occupied ?start)
      (occupied ?end)
    )
  )
)