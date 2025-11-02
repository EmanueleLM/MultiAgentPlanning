(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :adl)
  (:types timeslot participant)

  (:predicates
    (available ?p - participant ?t - timeslot)
    (meeting-scheduled)
    (meeting-at ?t - timeslot)
  )

  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
    )
  )
)