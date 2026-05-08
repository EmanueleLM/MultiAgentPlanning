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
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?start - time ?mid - time ?end - time)
    :precondition (and
      (meeting_unscheduled)
      (allowed_start ?start)
      (next ?start ?mid)
      (next ?mid ?end)
      (free ?p1 ?start ?mid)
      (free ?p1 ?mid ?end)
      (free ?p2 ?start ?mid)
      (free ?p2 ?mid ?end)
      (free ?p3 ?start ?mid)
      (free ?p3 ?mid ?end)
    )
    :effect (and
      (scheduled ?start ?mid ?end)
      (meeting_scheduled)
      (not (meeting_unscheduled))
    )
  )
)