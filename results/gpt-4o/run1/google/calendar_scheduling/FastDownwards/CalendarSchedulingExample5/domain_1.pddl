(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types participant time_slot day)

  (:predicates 
    (occupied ?p - participant ?t1 - time_slot ?t2 - time_slot)
    (preference ?p - participant ?t - time_slot)
    (meeting_scheduled ?d - day ?t1 - time_slot ?t2 - time_slot)
    (connection ?t1 - time_slot ?t2 - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and 
      (connection ?t1 ?t2)
      (not (occupied kathryn ?t1 ?t2))
      (not (occupied charlotte ?t1 ?t2))
      (not (occupied lauren ?t1 ?t2))
      (not (preference charlotte ?t1))
    )
    :effect (meeting_scheduled monday ?t1 ?t2)
  )
)