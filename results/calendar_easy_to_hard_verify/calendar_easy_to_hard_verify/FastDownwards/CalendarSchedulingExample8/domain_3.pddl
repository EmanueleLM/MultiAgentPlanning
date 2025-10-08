(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types agent timeslot)
  (:constants adam jerry matthew - agent)
  (:predicates
    (free ?a - agent ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
  )
  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (free adam ?t)
      (free jerry ?t)
      (free matthew ?t)
    )
    :effect (and (scheduled ?t) (meeting-scheduled))
  )
)