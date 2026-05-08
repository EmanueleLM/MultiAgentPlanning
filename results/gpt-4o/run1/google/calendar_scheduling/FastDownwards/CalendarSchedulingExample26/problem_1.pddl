(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:objects
    katherine nicole kevin - participant
    time_9_00 time_10_00 time_10_30 time_11_30 time_12_00 time_13_00 time_14_00 time_15_30 time_16_30 time_17_00 - time
  )
  
  (:init
    (is_free katherine time_9_00 time_17_00)
    (is_free nicole time_9_00 time_17_00)
    (is_free kevin time_10_00 time_10_30)
    (is_free kevin time_11_30 time_12_00)
    (is_free kevin time_15_30 time_16_30)
    
    (next_time time_9_00 time_10_00)
    (next_time time_10_00 time_10_30)
    (next_time time_10_30 time_11_30)
    (next_time time_11_30 time_12_00)
    (next_time time_12_00 time_13_00)
    (next_time time_13_00 time_14_00)
    (next_time time_14_00 time_15_30)
    (next_time time_15_30 time_16_30)
    (next_time time_16_30 time_17_00)
  )
  
  (:goal
    (exists (?t_start - time ?t_end - time) 
      (and 
        (meeting_scheduled katherine ?t_start ?t_end)
        (meeting_scheduled nicole ?t_start ?t_end)
        (meeting_scheduled kevin ?t_start ?t_end)
      )
    )
  )
)