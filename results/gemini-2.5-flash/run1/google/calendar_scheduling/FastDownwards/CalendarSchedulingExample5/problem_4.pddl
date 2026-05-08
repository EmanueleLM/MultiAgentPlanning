(define (problem calendar_scheduling_example5)
  (:domain calendar_scheduling_domain)
  (:objects
    kathryn charlotte lauren - person
    slot_0900 slot_0930 slot_1000 slot_1030 slot_1100 slot_1130
    slot_1200 slot_1230 slot_1300 slot_1330 slot_1400 slot_1430
    slot_1500 slot_1530 slot_1600 slot_1630 - time_slot
  )
  (:init
    ; Kathryn's availability
    (available kathryn slot_0930)
    (available kathryn slot_1000)
    (available kathryn slot_1100)
    (available kathryn slot_1200)
    (available kathryn slot_1230)
    (available kathryn slot_1300)
    (available kathryn slot_1430)
    (available kathryn slot_1500)
    (available kathryn slot_1530)
    (available kathryn slot_1600)

    ; Charlotte's availability
    (available charlotte slot_0900)
    (available charlotte slot_0930)
    (available charlotte slot_1000)
    (available charlotte slot_1030)
    (available charlotte slot_1100)
    (available charlotte slot_1130)
    (available charlotte slot_1230)
    (available charlotte slot_1300)
    (available charlotte slot_1330)
    (available charlotte slot_1400)
    (available charlotte slot_1430)
    (available charlotte slot_1500)
    (available charlotte slot_1530)
    (available charlotte slot_1630)

    ; Charlotte's preferences (not after 13:30, meaning slots starting at or before 13:00)
    (charlotte_prefers slot_0900)
    (charlotte_prefers slot_0930)
    (charlotte_prefers slot_1000)
    (charlotte_prefers slot_1030)
    (charlotte_prefers slot_1100)
    (charlotte_prefers slot_1130)
    (charlotte_prefers slot_1200)
    (charlotte_prefers slot_1230)
    (charlotte_prefers slot_1300)

    ; Lauren's availability
    (available lauren slot_1000)
    (available lauren slot_1030)
    (available lauren slot_1100)
    (available lauren slot_1130)
    (available lauren slot_1230)
    (available lauren slot_1300)
    (available lauren slot_1430)
    (available lauren slot_1600)
  )
  (:goal (exists (?s - time_slot) (meeting_scheduled ?s)))