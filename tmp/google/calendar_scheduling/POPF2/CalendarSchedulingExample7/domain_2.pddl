```lisp
(define (domain unified-meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant time-slot)
  
  (:predicates
    ;; Participants' availability
    (available ?p - participant ?t - time-slot)
    
    ;; Meeting scheduled status for a time-slot
    (meeting-scheduled ?t - time-slot)
    
    ;; Participant attending status
    (participant-attending ?p - participant ?t - time-slot)
  )

  ;; Action to schedule a meeting when all are available
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