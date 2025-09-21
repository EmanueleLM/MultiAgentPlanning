(define (domain integrated-meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions :universal-preconditions)
  (:types participant timeslot)

  (:constants eric jeremy joe brian brittany julia - participant)

  (:predicates
    (is-slot ?s - timeslot)
    (busy ?p - participant ?s - timeslot)
    (meeting-scheduled)
    (meeting-at ?s - timeslot)
    (attending ?p - participant ?s - timeslot)
  )

  (:action schedule-meeting
    :parameters (?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (not (meeting-scheduled))
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (forall (?p - participant) (attending ?p ?s))
    )
  )
)