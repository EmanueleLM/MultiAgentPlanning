(define (domain meeting_scheduling)

  (:requirements :strips :typing :negative-preconditions)
  
  (:types
    participant
    time_slot
  )
  
  (:predicates
    (available ?p - participant ?t - time_slot)
    (scheduled ?p - participant ?t - time_slot)
    (meeting_can_start_at ?t - time_slot)
    (adjacent_time_slots ?t1 - time_slot ?t2 - time_slot)
  )
  
  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and
      (meeting_can_start_at ?t1)
      (adjacent_time_slots ?t1 ?t2)
      (available andrew ?t1)
      (available andrew ?t2)
      (available grace ?t1)
      (available grace ?t2)
      (available samuel ?t1)
      (available samuel ?t2)
    )
    :effect (and
      (scheduled andrew ?t1)
      (scheduled andrew ?t2)
      (scheduled grace ?t1)
      (scheduled grace ?t2)
      (scheduled samuel ?t1)
      (scheduled samuel ?t2)
      (not (meeting_can_start_at ?t1))
    )
  )
)