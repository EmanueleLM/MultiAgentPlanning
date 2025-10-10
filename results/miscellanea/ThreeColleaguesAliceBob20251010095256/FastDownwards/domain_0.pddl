(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (available ?ag - agent ?s - slot)
    (bob-morning ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )

  ;; Three distinct origin actions so agent actions/origins are explicit
  (:action schedule-by-alice
    :parameters (?s - slot)
    :precondition (and
      (available alice ?s)
      (available bob ?s)
      (available carol ?s)
      (not (scheduled))
      (not (bob-morning ?s))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )

  (:action schedule-by-bob
    :parameters (?s - slot)
    :precondition (and
      (available alice ?s)
      (available bob ?s)
      (available carol ?s)
      (not (scheduled))
      (not (bob-morning ?s))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )

  (:action schedule-by-carol
    :parameters (?s - slot)
    :precondition (and
      (available alice ?s)
      (available bob ?s)
      (available carol ?s)
      (not (scheduled))
      (not (bob-morning ?s))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)