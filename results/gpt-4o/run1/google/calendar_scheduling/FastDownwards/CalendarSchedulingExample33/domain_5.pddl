(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)

  (:predicates 
    (busy ?p - participant ?t - time_slot)
    (meeting_preference ?p - participant ?t - time_slot)
    (available ?p - participant ?t - time_slot)
    (next ?t1 - time_slot ?t2 - time_slot)
    (meeting_scheduled ?t1 - time_slot ?t2 - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and 
      (available lisa ?t1) (available lisa ?t2)
      (available bobby ?t1) (available bobby ?t2)
      (available randy ?t1) (available randy ?t2)
      (next ?t1 ?t2)
      (not (meeting_preference bobby ?t1)) (not (meeting_preference bobby ?t2))
    )
    :effect (and 
      (not (available lisa ?t1)) (not (available lisa ?t2))
      (not (available bobby ?t1)) (not (available bobby ?t2))
      (not (available randy ?t1)) (not (available randy ?t2))
      (busy lisa ?t1) (busy lisa ?t2)
      (busy bobby ?t1) (busy bobby ?t2)
      (busy randy ?t1) (busy randy ?t2)
      (meeting_scheduled ?t1 ?t2)
    )
  )
)