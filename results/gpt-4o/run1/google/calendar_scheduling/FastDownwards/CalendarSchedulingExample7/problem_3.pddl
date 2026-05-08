(define (problem schedule_meeting_monday)
  (:domain meeting_scheduling)
  (:objects
    heather nicholas zachary - participant
    9_00 9_30 10_00 10_30 11_00 11_30 12_00 12_30 13_00 13_30 
    14_00 14_30 15_00 15_30 16_00 16_30 17_00 - timeslot
  )
  (:init
    (busy heather 9_00) (busy heather 9_30) 
    (busy heather 10_30) (busy heather 11_00)
    (busy heather 13_00) (busy heather 14_00)
    (busy heather 14_30) (busy heather 15_00)
    (busy heather 16_00) (busy heather 16_30)

    (busy zachary 9_00) (busy zachary 9_30)
    (busy zachary 10_00) (busy zachary 10_30)
    (busy zachary 11_00) (busy zachary 12_00)
    (busy zachary 12_30) (busy zachary 13_00)
    (busy zachary 13_30) (busy zachary 14_00)
    (busy zachary 14_30) (busy zachary 15_00)
    (busy zachary 15_30) (busy zachary 16_00)
    (busy zachary 16_30)

    (half_hour_block 9_30 10_00) 
    (half_hour_block 10_00 10_30)
    (half_hour_block 11_00 11_30) 
    (half_hour_block 11_30 12_00)
    (half_hour_block 12_00 12_30) 
    (half_hour_block 12_30 13_00)
    (half_hour_block 13_00 13_30)
  )
  (:goal
    (meeting_scheduled)
  )
)