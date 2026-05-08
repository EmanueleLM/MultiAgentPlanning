(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)
  (:predicates
    (available ?p - participant ?s - time_slot)
    (meeting_scheduled ?s - time_slot)
  )
  (:action Schedule_Meeting
    :parameters (?s - time_slot)
    :precondition (and 
      (available stephen ?s)
      (available edward ?s)
      (available angela ?s)
      (not (meeting_scheduled ?s))
    )
    :effect (meeting_scheduled ?s)
  )
)