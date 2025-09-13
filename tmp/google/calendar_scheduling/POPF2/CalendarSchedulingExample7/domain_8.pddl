```lisp
(define (domain unified-meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant time-slot)
  
  (:predicates
    (available ?p - participant ?t - time-slot)
    (meeting-scheduled ?t - time-slot)
    (participant-attending ?p - participant ?t - time-slot)
  )

  (:action schedule-meeting
    :parameters (?t - time-slot)
    :precondition (and
      (available heather ?t)
      (available nicholas ?t)
      (available zachary ?t)
      (not (meeting-scheduled ?t))
    )
    :effect (and
      (meeting-scheduled ?t)
      (participant-attending heather ?t)
      (participant-attending nicholas ?t)
      (participant-attending zachary ?t)
    )
  )
)
```