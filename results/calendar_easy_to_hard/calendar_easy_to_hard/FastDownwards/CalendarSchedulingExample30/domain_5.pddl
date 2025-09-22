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

  (:action attend-eric
    :parameters (?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (not (busy eric ?s))
      (not (attending eric ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (attending eric ?s)
    )
  )

  (:action attend-jeremy
    :parameters (?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (not (busy jeremy ?s))
      (not (attending jeremy ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (attending jeremy ?s)
    )
  )

  (:action attend-joe
    :parameters (?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (not (busy joe ?s))
      (not (attending joe ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (attending joe ?s)
    )
  )

  (:action attend-brian
    :parameters (?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (not (busy brian ?s))
      (not (attending brian ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (attending brian ?s)
    )
  )

  (:action attend-brittany
    :parameters (?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (not (busy brittany ?s))
      (not (attending brittany ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (attending brittany ?s)
    )
  )

  (:action attend-julia
    :parameters (?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (not (busy julia ?s))
      (not (attending julia ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (attending julia ?s)
    )
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