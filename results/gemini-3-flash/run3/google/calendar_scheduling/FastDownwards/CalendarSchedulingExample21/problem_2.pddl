(define (problem schedule_example_21)
  (:domain calendar_scheduling)

  (:objects
    slot_0900 slot_0930 slot_1000 slot_1030 slot_1100 slot_1130 slot_1200 slot_1230 slot_1300 slot_1330 slot_1400 slot_1430 slot_1500 slot_1530 slot_1600 slot_1630 - slot
  )

  (:init
    ;; Time continuity (each slot is 30 minutes)
    (next_slot slot_0900 slot_0930)
    (next_slot slot_0930 slot_1000)
    (next_slot slot_1000 slot_1030)
    (next_slot slot_1030 slot_1100)
    (next_slot slot_1100 slot_1130)
    (next_slot slot_1130 slot_1200)
    (next_slot slot_1200 slot_1230)
    (next_slot slot_1230 slot_1300)
    (next_slot slot_1300 slot_1330)
    (next_slot slot_1330 slot_1400)
    (next_slot slot_1400 slot_1430)
    (next_slot slot_1430 slot_1500)
    (next_slot slot_1500 slot_1530)
    (next_slot slot_1530 slot_1600)
    (next_slot slot_1600 slot_1630)

    ;; Bobby's schedule (wide open the entire day 9:00 to 17:00)
    (available bobby slot_0900)
    (available bobby slot_0930)
    (available bobby slot_1000)
    (available bobby slot_1030)
    (available bobby slot_1100)
    (available bobby slot_1130)
    (available bobby slot_1200)
    (available bobby slot_1230)
    (available bobby slot_1300)
    (available bobby slot_1330)
    (available bobby slot_1400)
    (available bobby slot_1430)
    (available bobby slot_1500)
    (available bobby slot_1530)
    (available bobby slot_1600)
    (available bobby slot_1630)

    ;; Scott's schedule (busy 11:30-12:00 [slot_1130], 15:30-16:00 [slot_1530])
    (available scott slot_0900)
    (available scott slot_0930)
    (available scott slot_1000)
    (available scott slot_1030)
    (available scott slot_1100)
    ;; slot_1130 is busy
    (available scott slot_1200)
    (available scott slot_1230)
    (available scott slot_1300)
    (available scott slot_1330)
    (available scott slot_1400)
    (available scott slot_1430)
    (available scott slot_1500)
    ;; slot_1530 is busy
    (available scott slot_1600)
    (available scott slot_1630)

    ;; Kimberly's schedule (busy 11:00-12:00 [1100, 1130], 12:30-13:00 [1230], 13:30-14:00 [1330], 14:30-15:00 [1430], 15:30-17:00 [1530, 1600, 1630])
    (available kimberly slot_0900)
    (available kimberly slot_0930)
    (available kimberly slot_1000)
    (available kimberly slot_1030)
    ;; slot_1100, slot_1130 are busy
    (available kimberly slot_1200)
    ;; slot_1230 is busy
    (available kimberly slot_1300)
    ;; slot_1330 is busy
    (available kimberly slot_1400)
    ;; slot_1430 is busy
    (available kimberly slot_1500)
    ;; slot_1530, slot_1600, slot_1630 are busy
  )

  (:goal (meeting_scheduled))
)