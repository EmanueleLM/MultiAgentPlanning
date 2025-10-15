(define (domain meeting-schedule)
  (:requirements :typing :negative-preconditions)
  (:types participant timeslot)
  (:constants sara sarah shirley harold terry - participant)
  (:predicates
    (free ?p - participant ?t - timeslot)
    (scheduled)
    (scheduled-at ?t - timeslot)
  )

  (:action schedule-at
    :parameters (?t - timeslot)
    :precondition (and
      (not (scheduled))
      (free sara ?t)
      (free sarah ?t)
      (free shirley ?t)
      (free harold ?t)
      (free terry ?t)
    )
    :effect (and
      (scheduled)
      (scheduled-at ?t)
    )
  )
)