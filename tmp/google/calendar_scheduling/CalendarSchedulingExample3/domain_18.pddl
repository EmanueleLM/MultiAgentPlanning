(define (domain collective-scheduling-POPF2)
  (:requirements :strips :typing :negative-preconditions :equality :adl)

  (:types participant time_slot)

  (:constants arthur michael samantha - participant)

  (:predicates
    (busy ?p - participant ?t - time_slot)
    (available ?p - participant ?t - time_slot)
    (meeting_scheduled)
    (consecutive ?t1 ?t2 - time_slot)
    (marked_for_meeting ?t1 ?t2 - time_slot)
  )
  
  (:action mark-available
    :parameters (?p - participant ?t - time_slot)
    :precondition (not (busy ?p ?t))
    :effect (available ?p ?t))
  
  (:action mark-time-slot
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and 
                   (consecutive ?t1 ?t2)
                   (available arthur ?t1) 
                   (available arthur ?t2)
                   (available michael ?t1)
                   (available michael ?t2)
                   (available samantha ?t1)
                   (available samantha ?t2)
                   (not (marked_for_meeting ?t1 ?t2)))
    :effect (marked_for_meeting ?t1 ?t2))
    
  (:action schedule-meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (marked_for_meeting ?t1 ?t2)
    :effect (meeting_scheduled))
)