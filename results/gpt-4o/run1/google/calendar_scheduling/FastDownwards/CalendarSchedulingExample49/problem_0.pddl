(define (problem meeting_scheduling_instance)
  (:domain meeting_scheduling)
  (:objects
    time_slot_900_930 - time_slot
    time_slot_930_1000 - time_slot
    time_slot_1000_1030 - time_slot
    time_slot_1030_1100 - time_slot
    time_slot_1100_1130 - time_slot
    time_slot_1130_1200 - time_slot
    time_slot_1200_1230 - time_slot
    time_slot_1230_1300 - time_slot
    time_slot_1300_1330 - time_slot
    time_slot_1330_1400 - time_slot
    time_slot_1400_1430 - time_slot
    time_slot_1430_1500 - time_slot
    time_slot_1500_1530 - time_slot
    time_slot_1530_1600 - time_slot
    time_slot_1600_1630 - time_slot
    time_slot_1630_1700 - time_slot
    participant_teresa - participant
    participant_kathleen - participant
    participant_patricia - participant
  )
  (:init
    (is_free time_slot_1000_1030 participant_teresa)
    (is_free time_slot_1100_1130 participant_teresa)
    (is_free time_slot_1200_1230 participant_teresa)
    (is_free time_slot_1330_1400 participant_teresa)
    (is_free time_slot_1400_1430 participant_teresa)

    (is_free time_slot_1000_1030 participant_kathleen)
    (is_free time_slot_1030_1100 participant_kathleen)
    (is_free time_slot_1100_1130 participant_kathleen)
    (is_free time_slot_1130_1200 participant_kathleen)
    (is_free time_slot_1200_1230 participant_kathleen)
    (is_free time_slot_1430_1500 participant_kathleen)

    (is_free time_slot_1030_1100 participant_patricia)
    (is_free time_slot_1100_1130 participant_patricia)
    (is_free time_slot_1200_1230 participant_patricia)
    (is_free time_slot_1330_1400 participant_patricia)
    (is_free time_slot_1430_1500 participant_patricia)
    (is_free time_slot_1500_1530 participant_patricia)
    
    (kathleen_preference time_slot_1000_1030)
    (kathleen_preference time_slot_1030_1100)
    (kathleen_preference time_slot_1100_1130)
    (kathleen_preference time_slot_1130_1200)
    (kathleen_preference time_slot_1200_1230)
    (kathleen_preference time_slot_1330_1400)
  )
  (:goal
    (exists (?ts - time_slot)
      (or 
        (meeting_scheduled ?ts)
      )
    )
  )
)