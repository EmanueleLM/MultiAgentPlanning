(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    time
  )

  (:predicates
    (next ?t1 - time ?t2 - time)
    (free ?p - participant ?t1 - time ?t2 - time)
    (allowed_start ?t - time)
    (scheduled ?start - time ?mid - time ?end - time)
    (meeting_unscheduled)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?start - time ?mid - time ?end - time)
    :precondition (and
      (meeting_unscheduled)
      (allowed_start ?start)
      (next ?start ?mid)
      (next ?mid ?end)
      (free anthony ?start ?mid)
      (free anthony ?mid ?end)
      (free pamela ?start ?mid)
      (free pamela ?mid ?end)
      (free zachary ?start ?mid)
      (free zachary ?mid ?end)
    )
    :effect (and
      (scheduled ?start ?mid ?end)
      (meeting_scheduled)
      (not (meeting_unscheduled))
    )
  )
)