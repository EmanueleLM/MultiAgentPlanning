(define (problem schedule_meeting_monday)
  (:domain meeting_scheduling)
  (:objects
    heather nicholas zachary - participant
    9_00 9_30 10_00 10_30 11_00 11_30 12_00 12_30 13_00 13_30 14_00 14_30 15_00 15_30 16_00 16_30 - timeslot
  )
  (:init
    (busy heather 9_00) (busy heather 9_30) (busy heather 10_30) (busy heather 11_00) 
    (busy heather 13_00) (busy heather 14_00) (busy heather 14_30) (busy heather 15_00)
    (busy heather 16_00) (busy heather 16_30)

    (busy zachary 9_00) (busy zachary 9_30) (busy zachary 10_00) (busy zachary 10_30) 
    (busy zachary 11_00) (busy zachary 12_00) (busy zachary 12_30) (busy zachary 13_00) 
    (busy zachary 13_30) (busy zachary 14_00) (busy zachary 14_30) (busy zachary 15_00)
    (busy zachary 15_30) (busy zachary 16_00) (busy zachary 16_30)

    (half_hour_block 9_30 10_00) (half_hour_block 10_00 10_30) 
    (half_hour_block 11_00 11_30) (half_hour_block 11_30 12_00)
    (half_hour_block 12_00 12_30) (half_hour_block 12_30 13_00)
    (half_hour_block 13_00 13_30) (half_hour_block 14_00 14_30)
    (half_hour_block 15_00 15_30) (half_hour_block 15_30 16_00)

    (preferred zachary 9_30) (preferred zachary 10_00) (preferred zachary 11_00)
    (preferred zachary 11_30) (preferred zachary 12_00) (preferred zachary 12_30)
    (preferred zachary 13_00)
  )
  (:goal
    (and
      (meeting_scheduled)
      (or
        (scheduled 9_30) (scheduled 10_00)
        (scheduled 11_00) (scheduled 11_30)
        (scheduled 12_00) (scheduled 12_30)
        (scheduled 13_00)
      )
    )
  )
)