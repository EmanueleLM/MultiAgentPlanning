(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:constants
    scott gabriel christine - participant
  )
  (:predicates
    (available ?p - participant ?t - timeslot)
    (within_work_hours ?t - timeslot)
    (scheduled)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (within_work_hours ?t)
      (available scott ?t)
      (available gabriel ?t)
      (available christine ?t)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
    )
  )
)