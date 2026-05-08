(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types participant time_slot day)

  (:predicates 
    (occupied ?p - participant ?ts - time_slot)
    (adjacent ?t1 - time_slot ?t2 - time_slot)
    (meeting_scheduled ?d - day ?t1 - time_slot ?t2 - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot ?monday - day)
    :precondition (and 
      (adjacent ?t1 ?t2)
      (not (occupied kathryn ?t1))
      (not (occupied kathryn ?t2))
      (not (occupied charlotte ?t1))
      (not (occupied charlotte ?t2))
      (not (occupied lauren ?t1))
      (not (occupied lauren ?t2))
    )
    :effect (and
      (meeting_scheduled ?monday ?t1 ?t2)
    )
  )
)