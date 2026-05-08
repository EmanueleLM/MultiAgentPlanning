(define (domain schedule_meeting_monday_half_hour)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timepoint
  )

  (:constants
    alan nancy patricia - participant
  )

  (:predicates
    (free ?p - participant ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (allowed_start ?t - timepoint)
    (meeting_scheduled)
    (chosen_start ?t - timepoint)
  )

  (:action schedule_meeting
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (not (meeting_scheduled))
      (allowed_start ?t1)
      (next ?t1 ?t2)
      (free alan ?t1)
      (free alan ?t2)
      (free nancy ?t1)
      (free nancy ?t2)
      (free patricia ?t1)
      (free patricia ?t2)
    )
    :effect (and
      (meeting_scheduled)
      (chosen_start ?t1)
    )
  )
)