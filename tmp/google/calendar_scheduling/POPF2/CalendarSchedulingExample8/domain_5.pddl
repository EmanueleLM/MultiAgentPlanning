(define (domain integrated_meeting_schedule_fd)
  (:requirements :strips :typing :adl)

  (:types participant time - object)

  (:predicates
    (available ?p - participant ?t - time)
    (slot ?t - time)
    (scheduled ?t - time)
    (adjacent ?t1 - time ?t2 - time) ; was used to plan sequences
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

  (:action chain_slots
    :parameters (?t1 - time ?t2 - time)
    :precondition (adjacent ?t1 ?t2)
    :effect (and)
  )
)