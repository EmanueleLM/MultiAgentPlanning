(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types time_slot)
  (:predicates
    (at_time ?t - time_slot)
    (next ?t1 ?t2 - time_slot)
    (free_albert ?t - time_slot)
    (free_gregory ?t - time_slot)
    (free_benjamin ?t - time_slot)
    (meeting_scheduled)
  )

  ;; Action to move forward in time. This ensures the solver evaluates 
  ;; time slots in chronological order, allowing it to find the earliest slot.
  (:action advance_time
    :parameters (?t1 ?t2 - time_slot)
    :precondition (and (at_time ?t1) (next ?t1 ?t2))
    :effect (and (not (at_time ?t1)) (at_time ?t2))
  )

  ;; Action to schedule a 30-minute meeting at the current time slot.
  ;; All participants must be free during this slot.
  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and (at_time ?t)
                       (free_albert ?t)
                       (free_gregory ?t)
                       (free_benjamin ?t))
    :effect (meeting_scheduled)
  )
)