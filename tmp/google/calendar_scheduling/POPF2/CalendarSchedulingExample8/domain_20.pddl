(define (domain calendar_scheduling)
  (:requirements :strips :typing :adl :equality :action-costs)
  
  (:types participant time - object)
  
  (:predicates
    (available ?p - participant ?t - time)
    (slot ?t - time)
    (scheduled ?t - time)
    (adjacent ?t1 - time ?t2 - time)
    (can_schedule ?t - time)
    (required_participants_available ?t - time)
  )

  (:action check_availability
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (exists (?a - participant ?j - participant ?m - participant)
        (and
          (available ?a ?t)
          (available ?j ?t)
          (available ?m ?t)
        )
      )
    )
    :effect (required_participants_available ?t)
  )

  (:action schedule_meeting
    :parameters (?t - time)
    :precondition (and
      (can_schedule ?t)
      (not (scheduled ?t))
      (required_participants_available ?t)
    )
    :effect (scheduled ?t)
    :cost (total-cost) 1
  )
)