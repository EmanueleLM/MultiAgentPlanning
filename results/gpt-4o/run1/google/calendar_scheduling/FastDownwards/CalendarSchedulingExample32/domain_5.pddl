(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)

  (:predicates 
    (busy ?p - person ?t - time_slot)
    (can_meet ?p - person ?t - time_slot)
    (meeting_scheduled ?t - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and
                    (can_meet emily ?t)
                    (can_meet melissa ?t)
                    (can_meet frank ?t)
                  )
    :effect (meeting_scheduled ?t)
  )
)