(define (domain meeting-scheduler)
  (:requirements :typing :negative-preconditions :universal-preconditions :adl)
  (:types participant timeslot)
  (:predicates
    (busy ?p - participant ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
    (allow ?t - timeslot)
  )
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (allow ?t)
      (not (meeting-scheduled))
      (forall (?p - participant) (not (busy ?p ?t)))
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
    )
  )
)