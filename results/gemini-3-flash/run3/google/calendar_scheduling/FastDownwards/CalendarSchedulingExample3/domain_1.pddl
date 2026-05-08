(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types time_point person)
  (:predicates 
    (free ?p - person ?t1 - time_point ?t2 - time_point)
    (next ?t1 - time_point ?t2 - time_point)
    (meeting_scheduled)
  )

  (:action schedule_meeting_1h
    :parameters (?t1 - time_point ?t2 - time_point ?t3 - time_point)
    :precondition (and
      (next ?t1 ?t2)
      (next ?t2 ?t3)
      (free arthur ?t1 ?t2)
      (free arthur ?t2 ?t3)
      (free michael ?t1 ?t2)
      (free michael ?t2 ?t3)
      (free samantha ?t1 ?t2)
      (free samantha ?t2 ?t3)
    )
    :effect (meeting_scheduled)
  )
)