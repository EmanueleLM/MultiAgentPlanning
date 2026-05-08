(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)
  (:predicates
    (is_busy ?p - person ?t - time_slot)
    (meeting_scheduled ?t - time_slot)
    (next_slot ?t1 - time_slot ?t2 - time_slot)
  )
  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and 
      (next_slot ?t1 ?t2)
      (not (meeting_scheduled ?t1))
      (not (meeting_scheduled ?t2))
      (forall (?p - person) (not (is_busy ?p ?t1)))
      (forall (?p - person) (not (is_busy ?p ?t2)))
    )
    :effect (and
      (meeting_scheduled ?t1)
      (meeting_scheduled ?t2)
    )
  )
)