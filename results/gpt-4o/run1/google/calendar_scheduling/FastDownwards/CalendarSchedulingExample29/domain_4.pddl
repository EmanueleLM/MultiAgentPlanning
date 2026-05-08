(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)
  (:predicates
    (busy ?p - person ?s - time_slot)
    (next_slot ?s1 ?s2 - time_slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s1 ?s2 - time_slot)
    :precondition 
      (and 
        (next_slot ?s1 ?s2)
        (not (busy madison ?s1))
        (not (busy madison ?s2))
        (not (busy diana ?s1))
        (not (busy diana ?s2))
        (not (busy shirley ?s1))
        (not (busy shirley ?s2))
      )
    :effect 
      (meeting_scheduled)
  )
)