(define (domain schedule_meeting_monday_half_hour)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timepoint
  )

  (:predicates
    (free ?p - participant ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (allowed_start ?t - timepoint)
    (meeting_scheduled)
    (chosen_start ?t - timepoint)
  )

  (:action schedule_meeting
    :parameters (?t - timepoint)
    :precondition (and
      (not (meeting_scheduled))
      (allowed_start ?t)
      (free alan ?t)
      (free nancy ?t)
      (free patricia ?t)
    )
    :effect (and
      (meeting_scheduled)
      (chosen_start ?t)
    )
  )
)