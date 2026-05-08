(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)

  (:types participant time_slot)

  (:predicates
    (available ?p - participant ?s - time_slot)
    (meeting_scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s - time_slot ?p1 ?p2 ?p3 - participant)
    :precondition 
      (and 
        (available ?p1 ?s)
        (available ?p2 ?s)
        (available ?p3 ?s)
      )
    :effect 
      (meeting_scheduled ?s)
  )
)