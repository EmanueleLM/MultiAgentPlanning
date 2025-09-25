(define (domain meeting-scheduling)
  (:requirements :typing :strips)
  (:types agent time)
  (:constants adam jerry matthew - agent)
  (:predicates
    (free ?a - agent ?t - time)
    (unscheduled)
    (meeting-scheduled)
    (scheduled ?t - time)
  )

  (:action adam-schedule
    :parameters (?t - time)
    :precondition (and
      (unscheduled)
      (free adam ?t) (free jerry ?t) (free matthew ?t)
    )
    :effect (and
      (not (unscheduled))
      (meeting-scheduled)
      (scheduled ?t)
    )
  )

  (:action jerry-schedule
    :parameters (?t - time)
    :precondition (and
      (unscheduled)
      (free adam ?t) (free jerry ?t) (free matthew ?t)
    )
    :effect (and
      (not (unscheduled))
      (meeting-scheduled)
      (scheduled ?t)
    )
  )

  (:action matthew-schedule
    :parameters (?t - time)
    :precondition (and
      (unscheduled)
      (free adam ?t) (free jerry ?t) (free matthew ?t)
    )
    :effect (and
      (not (unscheduled))
      (meeting-scheduled)
      (scheduled ?t)
    )
  )
)