(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)
  (:constants alice bob carol - agent)

  (:predicates
    (available ?a - agent ?s - slot)
    (allowed-by-pref ?s - slot)
    (meeting_scheduled)
    (scheduled-at ?s - slot)
    (earliest-slot ?s - slot)
  )

  (:action schedule-by-alice
    :parameters (?s - slot)
    :precondition (and
      (available alice ?s)
      (available bob ?s)
      (available carol ?s)
      (earliest-slot ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled-at ?s)
    )
  )

  (:action schedule-by-bob
    :parameters (?s - slot)
    :precondition (and
      (available alice ?s)
      (available bob ?s)
      (available carol ?s)
      (earliest-slot ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled-at ?s)
    )
  )

  (:action schedule-by-carol
    :parameters (?s - slot)
    :precondition (and
      (available alice ?s)
      (available bob ?s)
      (available carol ?s)
      (earliest-slot ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled-at ?s)
    )
  )
)