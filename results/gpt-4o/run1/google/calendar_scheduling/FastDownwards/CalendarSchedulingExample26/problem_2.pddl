(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:objects
    katherine nicole kevin - participant
    time_9_00 time_10_00 time_10_30 time_11_30 time_12_00 
    time_13_00 time_14_00 time_15_30 time_16_30 time_17_00 - time
  )
  
  (:init
    (is_free katherine time_9_00 time_17_00)
    (is_free nicole time_9_00 time_17_00)
    (is_free kevin time_10_00 time_10_30)
    (is_free kevin time_11_30 time_12_00)
    (is_free kevin time_15_30 time_16_30)

    ; Define time adjacency for meeting scheduling
    (adjacent time_9_00 time_10_00)
    (adjacent time_10_00 time_11_00)
    (adjacent time_11_00 time_12_00)
    (adjacent time_12_00 time_13_00)
    (adjacent time_13_00 time_14_00)
    (adjacent time_14_00 time_15_00)
    (adjacent time_15_00 time_16_00)
    (adjacent time_16_00 time_17_00)

    ; Add possible meeting times (start and end must be within the same hour slot)
    (meeting_possible time_11_30 time_12_30)
    (meeting_possible time_15_30 time_16_30)
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