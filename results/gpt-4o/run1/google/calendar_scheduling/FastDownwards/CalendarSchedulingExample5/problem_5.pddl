(define (problem schedule_meeting_instance)
  (:domain schedule_meeting)

  (:objects 
    kathryn charlotte lauren - participant
    monday - day
    time_9_00 time_9_30 time_10_00 time_10_30 time_11_00 time_11_30 
    time_12_00 time_12_30 time_13_00 time_13_30 time_14_00 time_14_30 
    time_15_00 time_15_30 time_16_00 time_16_30 time_17_00 - time_slot
  )

  (:init
    (occupied kathryn time_9_00)
    (occupied kathryn time_9_30)
    (occupied kathryn time_10_30)
    (occupied kathryn time_11_30)
    (occupied kathryn time_13_30)
    (occupied kathryn time_14_30)
    (occupied kathryn time_16_30)
    (occupied charlotte time_12_00)
    (occupied charlotte time_12_30)
    (occupied charlotte time_16_00)
    (occupied lauren time_9_00)
    (occupied lauren time_9_30)
    (occupied lauren time_12_00)
    (occupied lauren time_12_30)
    (occupied lauren time_13_30)
    (occupied lauren time_14_30)
    (occupied lauren time_15_00)
    (occupied lauren time_16_00)
    (occupied lauren time_16_30)
    (adjacent time_9_00 time_9_30)
    (adjacent time_9_30 time_10_00)
    (adjacent time_10_00 time_10_30)
    (adjacent time_10_30 time_11_00)
    (adjacent time_11_00 time_11_30)
    (adjacent time_11_30 time_12_00)
    (adjacent time_12_00 time_12_30)
    (adjacent time_12_30 time_13_00)
    (adjacent time_13_00 time_13_30)
    (adjacent time_13_30 time_14_00)
    (adjacent time_14_00 time_14_30)
    (adjacent time_14_30 time_15_00)
    (adjacent time_15_00 time_15_30)
    (adjacent time_15_30 time_16_00)
    (adjacent time_16_00 time_16_30)
    (adjacent time_16_30 time_17_00)
  )

  (:goal
    (exists (?t1 - time_slot ?t2 - time_slot)
      (and
        (meeting_scheduled monday ?t1 ?t2)
        (adjacent ?t1 ?t2)
      )
    )
  )
)