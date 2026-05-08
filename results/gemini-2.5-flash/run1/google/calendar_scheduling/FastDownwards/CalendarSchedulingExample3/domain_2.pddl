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
    :parameters (?t_start - time_point ?t_mid - time_point)
    :precondition (and
      (next_time ?t_start ?t_mid) ; Ensures ?t_mid is 30 mins after ?t_start, forming a 1-hour window
      ; Arthur must be free for both 30-minute segments of the 1-hour slot
      (not (is_busy_at arthur ?t_start))
      (not (is_busy_at arthur ?t_mid))
      ; Michael must be free for both 30-minute segments
      (not (is_busy_at michael ?t_start))
      (not (is_busy_at michael ?t_mid))
      ; Samantha must be free for both 30-minute segments
      (not (is_busy_at samantha ?t_start))
      (not (is_busy_at samantha ?t_mid))
    )
    :effect (meeting_scheduled ?t_start) ; Mark the start of the 1-hour meeting
  )
)