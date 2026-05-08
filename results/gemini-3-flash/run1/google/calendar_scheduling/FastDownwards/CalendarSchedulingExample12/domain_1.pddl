(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person time_slot)
  (:predicates
    (free ?p - person ?t - time_slot)
    (next ?t1 ?t2 - time_slot)
    (meeting_scheduled)
  )

  (:action schedule_1hour_meeting
    :parameters (?t1 ?t2 ?t3 - time_slot)
    :precondition (and
      (next ?t1 ?t2)
      (next ?t2 ?t3)
      (free david ?t1)
      (free david ?t2)
      (free debra ?t1)
      (free debra ?t2)
      (free kevin ?t1)
      (free kevin ?t2)
    )
    :effect (meeting_scheduled)
  )
)