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
  )

  (:action david_reserve
    :parameters (?m - meeting ?h - hour)
    :precondition (and (unscheduled ?m) (free david ?h))
    :effect (and (reserved_david ?m ?h) (not (free david ?h)))
  )

  (:action debra_reserve
    :parameters (?m - meeting ?h - hour)
    :precondition (and (unscheduled ?m) (free debra ?h))
    :effect (and (reserved_debra ?m ?h) (not (free debra ?h)))
  )

  (:action kevin_reserve
    :parameters (?m - meeting ?h - hour)
    :precondition (and (unscheduled ?m) (free kevin ?h))
    :effect (and (reserved_kevin ?m ?h) (not (free kevin ?h)))
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