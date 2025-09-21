(define (domain integrated-meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions :universal-preconditions)
  (:types participant timeslot)

  (:constants eric jeremy joe brian brittany julia - participant)

  (:predicates
    (is-slot ?s - timeslot)
    (allowed_slot ?s - timeslot)
    (busy ?p - participant ?s - timeslot)
    (available ?p - participant ?s - timeslot)
    (scheduled-for ?p - participant ?s - timeslot)
    (attending ?p - participant ?s - timeslot)
    (meeting-scheduled)
    (meeting-at ?s - timeslot)
  )

  (:action schedule-by-eric
    :parameters (?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (not (meeting-scheduled))
      (not (busy eric ?s))
      (not (busy jeremy ?s))
      (not (busy joe ?s))
      (not (busy brian ?s))
      (not (busy brittany ?s))
      (not (busy julia ?s))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (forall (?p - participant) (attending ?p ?s))
    )
  )

  (:action schedule-by-jeremy
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

  (:action schedule-by-brian
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

  (:action schedule-by-brittany
    :parameters (?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (not (meeting-scheduled))
      (not (busy brittany ?s))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (forall (?p - participant) (attending ?p ?s))
    )
  )

  (:action schedule-by-julia
    :parameters (?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (allowed_slot ?s)
      (not (busy julia ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (forall (?p - participant) (attending ?p ?s))
    )
  )

  (:action joe-schedule-for
    :parameters (?p - participant ?s - timeslot)
    :precondition (and
      (is-slot ?s)
      (available ?p ?s)
    )
    :effect (and
      (scheduled-for ?p ?s)
    )
  )

  (:action joe-finalize
    :parameters (?s - timeslot ?p1 - participant ?p2 - participant ?p3 - participant
                 ?p4 - participant ?p5 - participant ?p6 - participant)
    :precondition (and
      (is-slot ?s)
      (not (meeting-scheduled))
      (scheduled-for ?p1 ?s)
      (scheduled-for ?p2 ?s)
      (scheduled-for ?p3 ?s)
      (scheduled-for ?p4 ?s)
      (scheduled-for ?p5 ?s)
      (scheduled-for ?p6 ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attending ?p1 ?s)
      (attending ?p2 ?s)
      (attending ?p3 ?s)
      (attending ?p4 ?s)
      (attending ?p5 ?s)
      (attending ?p6 ?s)
    )
  )
)