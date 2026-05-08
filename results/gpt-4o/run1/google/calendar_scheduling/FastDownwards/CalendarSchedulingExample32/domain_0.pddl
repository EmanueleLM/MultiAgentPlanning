(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)
  (:predicates 
    (busy ?p - person ?t - time_slot)
    (prefers_before_9_30 ?p - person)
    (free_to_meet ?p - person ?t - time_slot)
    (meeting_scheduled ?t - time_slot)
  )
  
  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and
                    (free_to_meet emily ?t)
                    (free_to_meet melissa ?t)
                    (free_to_meet frank ?t)
                    (not (prefers_before_9_30 frank))
                  )
    :effect (meeting_scheduled ?t)
  )
)