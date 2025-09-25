(define (domain meeting-scheduling)
  (:requirements :typing :strips)
  (:types agent time)
  (:predicates
    (free ?a - agent ?t - time)
    (unscheduled)
    (meeting-scheduled)
    (scheduled ?t - time)
  )

  ;; Adam proposes scheduling at a time slot (requires all participants free)
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

  ;; Jerry proposes scheduling at a time slot (requires all participants free)
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

  ;; Matthew proposes scheduling at a time slot (requires all participants free)
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