```pddl
(define (domain integrated_meeting_schedule)
  (:requirements :strips :typing)

  (:types participant time - object)

  (:predicates
    (available ?p - participant ?t - time)
    (slot ?t - time)
    (scheduled ?t - time)
  )

  (:action schedule_meeting
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (available adam ?t)
      (available jerry ?t)
      (available matthew ?t)
      (not (scheduled ?t))
    )
    :effect (scheduled ?t)
  )

  (:action check_availability
    :parameters (?p - participant ?t - time)
    :precondition ()
    :effect (available ?p ?t)
  )
)
```