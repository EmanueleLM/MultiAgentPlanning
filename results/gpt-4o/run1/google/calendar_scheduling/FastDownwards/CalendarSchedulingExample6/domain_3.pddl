(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)
  (:predicates 
    (available ?p - person ?t - time_slot)
    (consecutive ?t1 - time_slot ?t2 - time_slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?p1 - person ?p2 - person ?p3 - person ?t1 - time_slot ?t2 - time_slot)
    :precondition (and
      (not (meeting_scheduled))
      (consecutive ?t1 ?t2)
      (available ?p1 ?t1) (available ?p1 ?t2)
      (available ?p2 ?t1) (available ?p2 ?t2)
      (available ?p3 ?t1) (available ?p3 ?t2)
    )
    :effect (and (meeting_scheduled))
  )
)