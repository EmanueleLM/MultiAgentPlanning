(define (problem schedule_meeting_44)
  (:domain calendar_scheduling)
  (:objects
    isabella ronald amanda - person
    slot_0900 slot_0930 slot_1000 slot_1030 slot_1100 slot_1130 slot_1200 slot_1230 slot_1300 slot_1330 slot_1400 slot_1430 slot_1500 slot_1530 slot_1600 slot_1630 - slot
  )
  (:init
    ;; Isabella is free the entire day
    (free isabella slot_0900)
    (free isabella slot_0930)
    (free isabella slot_1000)
    (free isabella slot_1030)
    (free isabella slot_1100)
    (free isabella slot_1130)
    (free isabella slot_1200)
    (free isabella slot_1230)
    (free isabella slot_1300)
    (free isabella slot_1330)
    (free isabella slot_1400)
    (free isabella slot_1430)
    (free isabella slot_1500)
    (free isabella slot_1530)
    (free isabella slot_1600)
    (free isabella slot_1630)

    ;; Ronald is busy: 11:30-12:00, 14:00-14:30, 16:00-17:00
    (free ronald slot_0900)
    (free ronald slot_0930)
    (free ronald slot_1000)
    (free ronald slot_1030)
    (free ronald slot_1100)
    ;; Ronald busy slot_1130
    (free ronald slot_1200)
    (free ronald slot_1230)
    (free ronald slot_1300)
    (free ronald slot_1330)
    ;; Ronald busy slot_1400
    (free ronald slot_1430)
    (free ronald slot_1500)
    (free ronald slot_1530)
    ;; Ronald busy slot_1600, slot_1630

    ;; Amanda is busy: 9:30-12:00, 12:30-13:00, 13:30-14:00, 15:30-17:00
    (free amanda slot_0900)
    ;; Amanda busy slot_0930, slot_1000, slot_1030, slot_1100, slot_1130
    (free amanda slot_1200)
    ;; Amanda busy slot_1230
    (free amanda slot_1300)
    ;; Amanda busy slot_1330
    (free amanda slot_1400)
    (free amanda slot_1430)
    (free amanda slot_1500)
    ;; Amanda busy slot_1530, slot_1600, slot_1630

    ;; Isabella prefers not to meet after 13:00 (so slots starting before 13:00 are preferred)
    (is_preferred slot_0900)
    (is_preferred slot_0930)
    (is_preferred slot_1000)
    (is_preferred slot_1030)
    (is_preferred slot_1100)
    (is_preferred slot_1130)
    (is_preferred slot_1200)
    (is_preferred slot_1230)
  )
  (:goal (meeting_scheduled))
)