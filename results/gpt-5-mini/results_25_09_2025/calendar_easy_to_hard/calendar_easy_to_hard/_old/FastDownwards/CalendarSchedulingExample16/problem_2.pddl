(define (problem integrated-schedule-monday)
  (:domain multiagent-scheduling)
  (:objects
    scott gabriel christine - person
    monday - day
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ;; slots per agent
    (scott_slot s0900) (scott_slot s0930) (scott_slot s1000) (scott_slot s1030)
    (scott_slot s1100) (scott_slot s1130) (scott_slot s1200) (scott_slot s1230)
    (scott_slot s1300) (scott_slot s1330) (scott_slot s1400) (scott_slot s1430)
    (scott_slot s1500) (scott_slot s1530) (scott_slot s1600) (scott_slot s1630)

    (gabriel_slot s0900) (gabriel_slot s0930) (gabriel_slot s1000) (gabriel_slot s1030)
    (gabriel_slot s1100) (gabriel_slot s1130) (gabriel_slot s1200) (gabriel_slot s1230)
    (gabriel_slot s1300) (gabriel_slot s1330) (gabriel_slot s1400) (gabriel_slot s1430)
    (gabriel_slot s1500) (gabriel_slot s1530) (gabriel_slot s1600) (gabriel_slot s1630)

    (christine_slot s0900) (christine_slot s0930) (christine_slot s1000) (christine_slot s1030)
    (christine_slot s1100) (christine_slot s1130) (christine_slot s1200) (christine_slot s1230)
    (christine_slot s1300) (christine_slot s1330) (christine_slot s1400) (christine_slot s1430)
    (christine_slot s1500) (christine_slot s1530) (christine_slot s1600) (christine_slot s1630)

    ;; work hours and day mapping
    (slot_of s0900 monday) (slot_of s0930 monday) (slot_of s1000 monday) (slot_of s1030 monday)
    (slot_of s1100 monday) (slot_of s1130 monday) (slot_of s1200 monday) (slot_of s1230 monday)
    (slot_of s1300 monday) (slot_of s1330 monday) (slot_of s1400 monday) (slot_of s1430 monday)
    (slot_of s1500 monday) (slot_of s1530 monday) (slot_of s1600 monday) (slot_of s1630 monday)

    (work_hour s0900) (work_hour s0930) (work_hour s1000) (work_hour s1030)
    (work_hour s1100) (work_hour s1130) (work_hour s1200) (work_hour s1230)
    (work_hour s1300) (work_hour s1330) (work_hour s1400) (work_hour s1430)
    (work_hour s1500) (work_hour s1530) (work_hour s1600) (work_hour s1630)

    ;; agent availabilities based on their private information (Monday)
    ;; Scott busy: 09:30-10:30 (s0930,s1000), 13:30-14:00 (s1330), 14:30-15:00 (s1430), 15:30-16:00 (s1530), 16:30-17:00 (s1630)
    ;; Therefore Scott is available on other work slots:
    (scott_available s0900) (scott_available s1030) (scott_available s1100) (scott_available s1130)
    (scott_available s1200) (scott_available s1230) (scott_available s1300) (scott_available s1400)
    (scott_available s1500) (scott_available s1600)

    ;; Gabriel: no meetings on Monday -> available all slots
    (gabriel_available s0900) (gabriel_available s0930) (gabriel_available s1000) (gabriel_available s1030)
    (gabriel_available s1100) (gabriel_available s1130) (gabriel_available s1200) (gabriel_available s1230)
    (gabriel_available s1300) (gabriel_available s1330) (gabriel_available s1400) (gabriel_available s1430)
    (gabriel_available s1500) (gabriel_available s1530) (gabriel_available s1600) (gabriel_available s1630)

    ;; Christine busy: 09:00-10:00 (s0900,s0930), 10:30-12:30 (s1030,s1100,s1130,s1200), 13:00-17:00 (s1300..s1630)
    ;; Therefore Christine is available only at s1000 and s1230
    (christine_available s1000) (christine_available s1230)
  )
  (:goal (and
            (orchestrator_confirmed s1230)
            (scott_scheduled s1230)
            (gabriel_scheduled s1230)
            (christine_scheduled s1230)
         )
  )
)