(define (problem schedule_meeting_instance)
  (:domain meeting_scheduler)
  (:objects
    scott gabriel christine - participant
    time_9_00 time_9_30 time_10_00 time_10_30
    time_11_00 time_11_30 time_12_00 time_12_30
    time_13_00 time_13_30 time_14_00 time_14_30
    time_15_00 time_15_30 time_16_00 time_16_30
    time_17_00 - time
  )
  (:init
    (next_time time_9_00 time_9_30)
    (next_time time_9_30 time_10_00)
    (next_time time_10_00 time_10_30)
    (next_time time_10_30 time_11_00)
    (next_time time_11_00 time_11_30)
    (next_time time_11_30 time_12_00)
    (next_time time_12_00 time_12_30)
    (next_time time_12_30 time_13_00)
    (next_time time_13_00 time_13_30)
    (next_time time_13_30 time_14_00)
    (next_time time_14_00 time_14_30)
    (next_time time_14_30 time_15_00)
    (next_time time_15_00 time_15_30)
    (next_time time_15_30 time_16_00)
    (next_time time_16_00 time_16_30)
    (next_time time_16_30 time_17_00)

    ; Modeling consecutive time slots for half-hour meetings
    (consecutive time_9_00 time_9_30)
    (consecutive time_9_30 time_10_00)
    (consecutive time_10_00 time_10_30)
    ;(expand further for the rest as needed)

    ; Busy schedules for participants
    (is_busy scott time_9_30 time_10_00)
    (is_busy scott time_13_30 time_14_00)
    (is_busy scott time_14_30 time_15_00)
    (is_busy scott time_15_30 time_16_00)
    (is_busy scott time_16_30 time_17_00)

    (is_busy christine time_9_00 time_10_00)
    (is_busy christine time_10_30 time_12_30)
    (is_busy christine time_13_00 time_17_00)

    ; Initial free slots
    (free_slot time_9_00 time_10_00)
    (free_slot time_10_30 time_11_00)
    ;(expand further for the rest as needed)
  )
  (:goal
    (exists (?t1 - time ?t2 - time) 
      (meeting_scheduled ?t1 ?t2)
    )
  )
)