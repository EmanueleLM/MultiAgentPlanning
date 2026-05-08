(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (next ?t1 ?t2 - time)
    (is_free ?p - person ?t1 ?t2 - time)
    (meeting_scheduled)
  )

  (:action schedule_1hr_meeting
    :parameters (?t1 ?t2 ?t3 - time)
    :precondition (and
      (next ?t1 ?t2)
      (next ?t2 ?t3)
      (is_free madison ?t1 ?t2)
      (is_free madison ?t2 ?t3)
      (is_free diana ?t1 ?t2)
      (is_free diana ?t2 ?t3)
      (is_free shirley ?t1 ?t2)
      (is_free shirley ?t2 ?t3)
    )
    :effect (meeting_scheduled)
  )
)