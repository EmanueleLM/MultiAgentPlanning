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
    (valid_meeting_interval ?t - time_point) ; Denotes time points that can form part of a 1-hour meeting within 9:00-17:00.
  )

  (:action schedule_meeting
    :parameters (?t_start - time_point ?t_mid - time_point)
    :precondition (and
      (next_time ?t_start ?t_mid) ; Ensures ?t_mid is 30 mins after ?t_start, forming a 1-hour window
      (valid_meeting_interval ?t_start) ; Ensures the meeting starts within valid hours
      (valid_meeting_interval ?t_mid)   ; Ensures the 1-hour meeting ends by 17:00

      ; All participants must be free for both 30-minute segments of the 1-hour slot
      (not (is_busy_at arthur ?t_start))
      (not (is_busy_at arthur ?t_mid))
      (not (is_busy_at michael ?t_start))
      (not (is_busy_at michael ?t_mid))
      (not (is_busy_at samantha ?t_start))
      (not (is_busy_at samantha ?t_mid))
    )
    :effect (meeting_scheduled ?t_start) ; Mark the start of the 1-hour meeting
  )
)