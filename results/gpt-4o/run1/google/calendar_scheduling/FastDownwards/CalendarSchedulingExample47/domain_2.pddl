(define (domain scheduling_meeting)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types person time_slot)
  
  (:predicates
    (available_at ?p - person ?t - time_slot)
    (meeting_slot ?t1 - time_slot ?t2 - time_slot)
    (meeting_scheduled ?p1 - person ?p2 - person ?p3 - person ?t1 - time_slot ?t2 - time_slot)
  )

  (:action schedule_meeting
    :parameters (?p1 - person ?p2 - person ?p3 - person ?t1 - time_slot ?t2 - time_slot)
    :precondition (and 
      (available_at ?p1 ?t1)
      (available_at ?p1 ?t2)
      (available_at ?p2 ?t1)
      (available_at ?p2 ?t2)
      (available_at ?p3 ?t1)
      (available_at ?p3 ?t2)
      (meeting_slot ?t1 ?t2)
      (not (meeting_scheduled ?p1 ?p2 ?p3 ?t1 ?t2))
    )
    :effect (meeting_scheduled ?p1 ?p2 ?p3 ?t1 ?t2)
  )
)