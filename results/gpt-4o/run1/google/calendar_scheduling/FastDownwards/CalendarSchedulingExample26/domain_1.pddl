(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time)
  
  (:predicates
    (is_free ?p - participant ?t_start - time ?t_end - time)
    (next_time ?t1 - time ?t2 - time)
    (meeting_scheduled ?p - participant ?t_start - time ?t_end - time)
  )
  
  (:action schedule_meeting
    :parameters (?t_start - time ?t_end - time)
    :precondition
      (and
         (is_free katherine ?t_start ?t_end)
         (is_free nicole ?t_start ?t_end)
         (is_free kevin ?t_start ?t_end)
         (next_time time_9_00 ?t_start)
         (next_time ?t_start ?t_end)
         (next_time ?t_end time_17_00)
         (not (next_time time_15_30 ?t_start)) ; Ensure end time is at or before 15:30
         (or (not (next_time ?t_start time_13_00)) (next_time time_14_00 ?t_start)) ; Block busy periods for Kevin: 12:00-15:30
         (or (not (next_time ?t_start time_10_00)) (next_time time_10_30 ?t_start)) ; Block busy period 9:00-10:00
         (or (not (next_time ?t_start time_10_30)) (next_time time_11_30 ?t_start)) ; Block busy period 10:30-11:30
         (or (not (next_time ?t_start time_16_30)) (next_time time_17_00 ?t_start)) ; Block busy period 16:30-17:00
      )
    :effect
      (and
         (meeting_scheduled katherine ?t_start ?t_end)
         (meeting_scheduled nicole ?t_start ?t_end)
         (meeting_scheduled kevin ?t_start ?t_end)
      )
  )
)