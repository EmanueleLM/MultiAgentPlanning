(define (domain calendar_scheduling_example3)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    time_point
    person
  )

  (:predicates
    (is_busy_at ?p - person ?t - time_point)
    (next_time ?t1 - time_point ?t2 - time_point)
    (meeting_scheduled ?t - time_point)
  )

  (:action schedule_meeting
    :parameters (?t1 - time_point ?t2 - time_point)
    :precondition (and
      (next_time ?t1 ?t2)
      ; Arthur must be free for both slots
      (not (is_busy_at arthur ?t1))
      (not (is_busy_at arthur ?t2))
      ; Michael must be free for both slots
      (not (is_busy_at michael ?t1))
      (not (is_busy_at michael ?t2))
      ; Samantha must be free for both slots
      (not (is_busy_at samantha ?t1))
      (not (is_busy_at samantha ?t2))
    )
    :effect (meeting_scheduled ?t1)
  )
)