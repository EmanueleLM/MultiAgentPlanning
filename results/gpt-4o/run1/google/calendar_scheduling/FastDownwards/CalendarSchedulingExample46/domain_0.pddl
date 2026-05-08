(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    participant 
    time_slot
  )
  (:predicates
    (available ?p - participant ?t - time_slot)
    (meeting_possible ?t1 - time_slot ?t2 - time_slot)
    (scheduled ?t1 - time_slot ?t2 - time_slot)
  )
  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (meeting_possible ?t1 ?t2)
    :effect (scheduled ?t1 ?t2))
)