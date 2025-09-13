(define (domain integrated_meeting_schedule)
  (:requirements :strips :typing :negative-preconditions)

  (:types participant time - object)

  (:predicates
    (available ?p - participant ?t - time)
    (slot ?t - time)
    (scheduled ?t - time)
  )

  (:action schedule_meeting
    :parameters (?t - time ?a - participant ?j - participant ?m - participant)
    :precondition (and
      (slot ?t)
      (available ?a ?t)
      (available ?j ?t)
      (available ?m ?t)
      (not (scheduled ?t))
    )
    :effect (scheduled ?t)
  )

  (:action check_availability
    :parameters (?p - participant ?t - time)
    :precondition (and 
      (slot ?t)
    )
    :effect (available ?p ?t)
  )
)