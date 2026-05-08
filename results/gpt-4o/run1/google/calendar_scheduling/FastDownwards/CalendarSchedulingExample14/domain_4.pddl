(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)

  (:types participant time_slot)

  (:predicates
    (available ?p - participant ?s - time_slot)
    (meeting_time_slot ?s - time_slot)
    (all_available ?s - time_slot)
  )

  (:action check_availability
    :parameters (?s - time_slot ?p1 ?p2 ?p3 - participant)
    :precondition 
      (and 
        (available ?p1 ?s)
        (available ?p2 ?s)
        (available ?p3 ?s)
      )
    :effect 
      (all_available ?s)
  )

  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition 
      (and 
        (all_available ?s)
      )
    :effect 
      (meeting_time_slot ?s)
  )
)