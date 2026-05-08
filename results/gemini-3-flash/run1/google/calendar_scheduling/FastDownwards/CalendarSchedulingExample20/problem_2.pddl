(define (problem schedule_20)
  (:domain calendar_scheduling)
  (:objects
    slot_0900 slot_0930 slot_1000 slot_1030 slot_1100 slot_1130 slot_1200 slot_1230
    slot_1300 slot_1330 slot_1400 slot_1430 slot_1500 slot_1530 slot_1600 slot_1630 - timeslot
  )
  (:init
    ;; Ralph's availability
    ;; Ralph busy: 13:30-14:00 (slot_1330), 14:30-15:00 (slot_1430)
    (available ralph slot_0900)
    (available ralph slot_0930)
    (available ralph slot_1000)
    (available ralph slot_1030)
    (available ralph slot_1100)
    (available ralph slot_1130)
    (available ralph slot_1200)
    (available ralph slot_1230)
    (available ralph slot_1300)
    (available ralph slot_1400)
    (available ralph slot_1500)
    (available ralph slot_1530)
    (available ralph slot_1600)
    (available ralph slot_1630)

    ;; Peter's availability
    ;; Peter busy: 9:00-9:30 (slot_0900), 11:00-13:00 (slot_1100, 1130, 1200, 1230), 16:00-16:30 (slot_1600)
    (available peter slot_0930)
    (available peter slot_1000)
    (available peter slot_1030)
    (available peter slot_1300)
    (available peter slot_1330)
    (available peter slot_1400)
    (available peter slot_1430)
    (available peter slot_1500)
    (available peter slot_1530)
    (available peter slot_1630)

    ;; Daniel's availability
    ;; Daniel busy: 9:00-10:00, 10:30-15:30, 16:00-17:00
    ;; Preference: Avoid meetings after 13:30.
    ;; Only slot_1000 satisfies both schedule and avoidance of slots after 13:30.
    (available daniel slot_1000)
  )
  (:goal (meeting_scheduled))
)