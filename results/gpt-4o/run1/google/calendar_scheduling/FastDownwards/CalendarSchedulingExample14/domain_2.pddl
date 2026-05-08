(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)

  (:types participant time_slot)

  (:predicates
    (available ?p - participant ?s - time_slot)
    (meeting_scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition 
      (and 
        (available brandon ?s)
        (available jerry ?s)
        (available bradley ?s)
      )
    :effect 
      (meeting_scheduled ?s)
  )
)