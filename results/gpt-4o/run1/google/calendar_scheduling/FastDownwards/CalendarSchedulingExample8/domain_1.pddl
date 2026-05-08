(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types participant time_slot)

  (:predicates
    (busy ?p - participant ?t - time_slot)
    (consecutive ?t1 - time_slot ?t2 - time_slot)
    (meeting_scheduled ?t - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and
      (consecutive ?t1 ?t2)
      (not (busy adam ?t1))
      (not (busy adam ?t2))
      (not (busy jerry ?t1))
      (not (busy jerry ?t2))
      (not (busy matthew ?t1))
      (not (busy matthew ?t2))
    )
    :effect (meeting_scheduled ?t1)
  )
)