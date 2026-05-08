(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)
  
  (:predicates 
    (available ?p - participant ?t - time_slot)
    (preferred ?p - participant ?t - time_slot)
    (fits_meeting_duration ?t1 ?t2 - time_slot)
    (before ?t1 ?t2 - time_slot)
    (meeting_scheduled_at ?t - time_slot)
  )
  
  (:action schedule_meeting
   :parameters (?p1 ?p2 ?p3 - participant ?t1 ?t2 - time_slot)
   :precondition (and (available ?p1 ?t1)
                      (available ?p2 ?t1)
                      (available ?p3 ?t1)
                      (available ?p1 ?t2)
                      (available ?p2 ?t2)
                      (available ?p3 ?t2)
                      (fits_meeting_duration ?t1 ?t2))
   :effect (meeting_scheduled_at ?t1)
  )
)