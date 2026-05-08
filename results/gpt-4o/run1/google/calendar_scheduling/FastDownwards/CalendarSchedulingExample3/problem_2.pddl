(define (problem schedule_meeting_problem)
  (:domain meeting_scheduler)
  (:objects
    arthur michael samantha - participant
    start_09_00 start_09_30 start_10_00 start_10_30 start_11_00
    start_11_30 start_12_00 start_12_30 start_13_00 start_13_30
    start_14_00 start_14_30 start_15_00 start_15_30 start_16_00 start_16_30 - time_slot
  )
  (:init
    ; Arthur's busy times
    (busy arthur start_09_00)
    (busy arthur start_10_30)
    (busy arthur start_11_00)
    (busy arthur start_16_00)

    ; Michael's busy times
    (busy michael start_13_00)
    (busy michael start_14_00)
    
    ; Samantha's busy times
    (busy samantha start_10_30)
    (busy samantha start_12_00)
    (busy samantha start_12_30)
    (busy samantha start_13_00)
    (busy samantha start_13_30)
    (busy samantha start_14_00)
    (busy samantha start_14_30)
    (busy samantha start_15_30)

    ; Time slot adjacency
    (next start_09_00 start_09_30)
    (next start_09_30 start_10_00)
    (next start_10_00 start_10_30)
    (next start_10_30 start_11_00)
    (next start_11_00 start_11_30)
    (next start_11_30 start_12_00)
    (next start_12_00 start_12_30)
    (next start_12_30 start_13_00)
    (next start_13_00 start_13_30)
    (next start_13_30 start_14_00)
    (next start_14_00 start_14_30)
    (next start_14_30 start_15_00)
    (next start_15_00 start_15_30)
    (next start_15_30 start_16_00)
    (next start_16_00 start_16_30)
  )
  (:goal
    (meeting_scheduled)
  )
)