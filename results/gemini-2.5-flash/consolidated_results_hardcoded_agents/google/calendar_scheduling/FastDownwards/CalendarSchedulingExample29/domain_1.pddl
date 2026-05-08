(define (domain scheduling-meeting)
  (:requirements :strips :typing)
  (:types
    time-point slot
  )
  (:predicates
    ; Temporal structure
    (next-time ?t1 - time-point ?t2 - time-point)
    (slot-starts-at ?s - slot ?t - time-point)
    (next-slot ?s1 - slot ?s2 - slot)

    ; Availability constraints (merged from agents)
    (slot-available-madison ?s - slot)
    (slot-available-diana ?s - slot)
    (slot-available-shirley ?s - slot)
    
    ; Meeting status
    (meeting-scheduled ?s - slot) ; Marks the start slot of the 1-hour meeting
  )
  
  (:action schedule-meeting
    :parameters (?s1 - slot ?s2 - slot ?t_start - time-point)
    :precondition (and
      (next-slot ?s1 ?s2)
      (slot-starts-at ?s1 ?t_start)

      ; All participants must be free in S1 (30 minutes)
      (slot-available-madison ?s1)
      (slot-available-diana ?s1)
      (slot-available-shirley ?s1)

      ; All participants must be free in S2 (next 30 minutes, completing 1 hour)
      (slot-available-madison ?s2)
      (slot-available-diana ?s2)
      (slot-available-shirley ?s2)
    )
    :effect (and
      (meeting-scheduled ?s1)
    )
  )
)