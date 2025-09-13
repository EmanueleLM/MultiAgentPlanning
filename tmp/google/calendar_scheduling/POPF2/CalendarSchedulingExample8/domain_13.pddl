(define (domain integrated_meeting_schedule_fd_modified)
  (:requirements :strips :typing :adl :equality)

  (:types participant time - object)

  (:predicates
    (available ?p - participant ?t - time)
    (slot ?t - time)
    (scheduled ?t - time)
    (adjacent ?t1 - time ?t2 - time)
    (can_schedule ?t - time ?p1 - participant ?p2 - participant ?p3 - participant)
  )

  (:action schedule_meeting
    :parameters (?t - time ?a - participant ?j - participant ?m - participant)
    :precondition (and
      (can_schedule ?t ?a ?j ?m)
      (not (scheduled ?t))
      (available ?a ?t)
      (available ?j ?t)
      (available ?m ?t)
    )
    :effect (scheduled ?t)
  )
)