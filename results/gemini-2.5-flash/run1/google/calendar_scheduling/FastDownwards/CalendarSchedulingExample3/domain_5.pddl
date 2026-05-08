(define (domain calendar_scheduling_example3)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    time_point
    person
  )
  (:constants
    arthur michael samantha - person
  )

  (:predicates
    (is_busy_at ?p - person ?t - time_point)
    (next_time ?t1 - time_point ?t2 - time_point)
    (meeting_scheduled ?t - time_point)
    (valid_meeting_interval ?t - time_point)
    (meeting_found) ; New predicate to indicate a meeting has been scheduled
  )

  (:action schedule_meeting
    :parameters (?t_start - time_point ?t_mid - time_point)
    :precondition (and
      (next_time ?t_start ?t_mid)
      (valid_meeting_interval ?t_start)
      (valid_meeting_interval ?t_mid)

      (not (is_busy_at arthur ?t_start))
      (not (is_busy_at arthur ?t_mid))
      (not (is_busy_at michael ?t_start))
      (not (is_busy_at michael ?t_mid))
      (not (is_busy_at samantha ?t_start))
      (not (is_busy_at samantha ?t_mid))
    )
    :effect (and
      (meeting_scheduled ?t_start)
      (meeting_found) ; Set this predicate to true upon scheduling a meeting
    )
  )
)