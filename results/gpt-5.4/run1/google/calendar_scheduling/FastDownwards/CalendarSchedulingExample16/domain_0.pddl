(define (domain meeting_schedule_monday_scott_gabriel_christine)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:predicates
    (next_slot ?s1 - timeslot ?s2 - timeslot)
    (free ?p - participant ?s - timeslot)
    (meeting_scheduled)
    (scheduled_at ?s - timeslot)
  )

  (:action schedule_meeting
    :parameters (?start - timeslot ?end - timeslot)
    :precondition (and
      (not (meeting_scheduled))
      (next_slot ?start ?end)
      (free scott ?start)
      (free scott ?end)
      (free gabriel ?start)
      (free gabriel ?end)
      (free christine ?start)
      (free christine ?end)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?start)
    )
  )
)