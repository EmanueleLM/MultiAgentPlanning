(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant hour meeting)

  (:predicates
    (free ?p - participant ?h - hour)
    (unscheduled ?m - meeting)
    (reserved_david ?m - meeting ?h - hour)
    (reserved_debra ?m - meeting ?h - hour)
    (reserved_kevin ?m - meeting ?h - hour)
    (scheduled ?m - meeting ?h - hour)
    (meeting_planned)
    (is-david ?p - participant)
    (is-debra ?p - participant)
    (is-kevin ?p - participant)
  )

  (:action david_reserve
    :parameters (?m - meeting ?h - hour ?p - participant)
    :precondition (and (unscheduled ?m) (free ?p ?h) (is-david ?p))
    :effect (and (reserved_david ?m ?h) (not (free ?p ?h)))
  )

  (:action debra_reserve
    :parameters (?m - meeting ?h - hour ?p - participant)
    :precondition (and (unscheduled ?m) (free ?p ?h) (is-debra ?p))
    :effect (and (reserved_debra ?m ?h) (not (free ?p ?h)))
  )

  (:action kevin_reserve
    :parameters (?m - meeting ?h - hour ?p - participant)
    :precondition (and (unscheduled ?m) (free ?p ?h) (is-kevin ?p))
    :effect (and (reserved_kevin ?m ?h) (not (free ?p ?h)))
  )

  (:action orchestrator_confirm
    :parameters (?m - meeting ?h - hour)
    :precondition (and
      (unscheduled ?m)
      (reserved_david ?m ?h)
      (reserved_debra ?m ?h)
      (reserved_kevin ?m ?h)
    )
    :effect (and
      (scheduled ?m ?h)
      (meeting_planned)
      (not (unscheduled ?m))
    )
  )
)