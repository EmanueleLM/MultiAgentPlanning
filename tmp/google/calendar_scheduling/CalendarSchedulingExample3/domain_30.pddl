(define (domain collective-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality :adl :action-costs)

  (:types participant time_slot)

  (:constants arthur michael samantha - participant)

  (:predicates
    (busy ?p - participant ?t - time_slot)
    (free ?p - participant ?t - time_slot)
    (marked_for_meeting ?p - participant ?t1 ?t2 - time_slot)
    (meeting_scheduled ?t1 ?t2 - time_slot)
    (next ?t1 ?t2 - time_slot)
    (available_slot ?t1 ?t2 - time_slot)
    (proposed_schedule ?t1 ?t2 - time_slot)
  )

  (:action determine-free-slot
    :parameters (?p - participant ?t1 ?t2 - time_slot)
    :precondition (and 
                   (next ?t1 ?t2)
                   (free ?p ?t1) 
                   (free ?p ?t2))
    :effect (marked_for_meeting ?p ?t1 ?t2))

  (:action confirm-availability
    :parameters (?t1 ?t2 - time_slot)
    :precondition (and
                   (marked_for_meeting arthur ?t1 ?t2)
                   (marked_for_meeting michael ?t1 ?t2)
                   (marked_for_meeting samantha ?t1 ?t2))
    :effect (available_slot ?t1 ?t2))
    
  (:action propose-meeting
    :parameters (?t1 ?t2 - time_slot)
    :precondition (available_slot ?t1 ?t2)
    :effect (proposed_schedule ?t1 ?t2))

  (:action finalize-meeting
    :parameters (?t1 ?t2 - time_slot)
    :precondition (proposed_schedule ?t1 ?t2)
    :effect (meeting_scheduled ?t1 ?t2))
)