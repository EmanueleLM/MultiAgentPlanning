(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)

  (:predicates
    (busy ?p - person ?t - time_slot)
    (available ?p - person ?t - time_slot)
    (meeting_scheduled ?t - time_slot)
    (consecutive ?t1 - time_slot ?t2 - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and 
      (consecutive ?t1 ?t2)
      (available donna ?t1) (available donna ?t2)
      (available john ?t1) (available john ?t2)
      (available billy ?t1) (available billy ?t2)
      (not (meeting_scheduled ?t1))
      (not (meeting_scheduled ?t2))
    )
    :effect (and 
      (meeting_scheduled ?t1)
    )
  )
)