(define (domain integrated-meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions :universal-preconditions)
  (:types participant timeslot)

  (:constants eric jeremy joe brian brittany julia - participant)

  (:predicates
    (is-slot ?s - timeslot)
    (busy ?p - participant ?s - timeslot)
    (attending ?p - participant ?s - timeslot)
    (meeting-scheduled)
    (meeting-at ?s - timeslot)
  )

  (:action attend
    :parameters (?p - participant ?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (not (busy ?p ?s))
      (not (attending ?p ?s))
      (not (meeting-scheduled))
    )
    :effect (attending ?p ?s)
  )

  (:action schedule-meeting
    :parameters (?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (not (meeting-scheduled))
      (forall (?p - participant) (attending ?p ?s))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)