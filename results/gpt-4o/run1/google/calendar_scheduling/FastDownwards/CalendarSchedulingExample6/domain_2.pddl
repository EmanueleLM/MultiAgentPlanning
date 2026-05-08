(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)
  (:predicates 
    (available ?p - person ?t - time_slot)
    (consecutive ?t1 - time_slot ?t2 - time_slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and
      (not (meeting_scheduled))
      (consecutive ?t1 ?t2)
      (available thomas ?t1) (available thomas ?t2)
      (available dylan ?t1) (available dylan ?t2)
      (available jerry ?t1) (available jerry ?t2)
    )
    :effect (and (meeting_scheduled))
  )
)