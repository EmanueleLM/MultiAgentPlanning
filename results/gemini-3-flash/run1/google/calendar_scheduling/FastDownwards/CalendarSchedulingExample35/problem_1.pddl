(define (problem calendar_35)
  (:domain calendar_scheduling)
  (:objects
    slot_0900 slot_0930 slot_1000 slot_1030 slot_1100 slot_1130 slot_1200 slot_1230 slot_1300 slot_1330 slot_1400 slot_1430 slot_1500 slot_1530 slot_1600 slot_1630 - slot
  )
  (:init
    ;; Bradley: Free the entire day (9:00 to 17:00) but does not want to meet before 14:30.
    ;; Available slots: 14:30-15:00, 15:00-15:30, 15:30-16:00, 16:00-16:30, 16:30-17:00.
    (is_free bradley slot_1430)
    (is_free bradley slot_1500)
    (is_free bradley slot_1530)
    (is_free bradley slot_1600)
    (is_free bradley slot_1630)

    ;; Zachary: Busy 10:00 to 10:30 (slot_1000), 15:00 to 15:30 (slot_1500).
    (is_free zachary slot_0900)
    (is_free zachary slot_0930)
    ;; slot_1000 busy
    (is_free zachary slot_1030)
    (is_free zachary slot_1100)
    (is_free zachary slot_1130)
    (is_free zachary slot_1200)
    (is_free zachary slot_1230)
    (is_free zachary slot_1300)
    (is_free zachary slot_1330)
    (is_free zachary slot_1400)
    (is_free zachary slot_1430)
    ;; slot_1500 busy
    (is_free zachary slot_1530)
    (is_free zachary slot_1600)
    (is_free zachary slot_1630)

    ;; Teresa: Busy 9:00-10:30 (slot_0900, slot_0930, slot_1000)
    ;; Busy 11:00-12:30 (slot_1100, slot_1130, slot_1200)
    ;; Busy 13:00-14:00 (slot_1300, slot_1330)
    ;; Busy 14:30-16:30 (slot_1430, slot_1500, slot_1530, slot_1600)
    (is_free teresa slot_1030)
    (is_free teresa slot_1230)
    (is_free teresa slot_1400)
    (is_free teresa slot_1630)
  )
  (:goal (meeting_booked))
)