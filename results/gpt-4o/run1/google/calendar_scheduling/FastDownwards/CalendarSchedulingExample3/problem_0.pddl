(define (problem schedule_meeting_problem)
  (:domain meeting_scheduler)
  (:objects
    arthur michael samantha - participant
    start_09_00 start_10_00 start_11_00 start_12_00 start_13_00 start_14_00 start_15_00 - time_slot
  )
  (:init
    ; Arthur's busy times
    (busy arthur start_09_00)
    (busy arthur start_10_00)
    (busy arthur start_11_00)
    (busy arthur start_16_00)

    ; Michael's busy times
    (busy michael start_13_00)
    (busy michael start_14_00)
    
    ; Samantha's busy times
    (busy samantha start_10_00)
    (busy samantha start_12_00)
    (busy samantha start_13_00)
    (busy samantha start_14_00)
    (busy samantha start_15_00)
    (busy samantha start_16_00)
  )
  (:goal
    (meeting_scheduled)
  )
)