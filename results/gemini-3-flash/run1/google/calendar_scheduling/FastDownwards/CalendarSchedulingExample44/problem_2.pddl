(define (problem schedule_meeting_44)
  (:domain calendar_scheduling)
  (:objects
    slot_0900 slot_0930 slot_1000 slot_1030 slot_1100 slot_1130 slot_1200 slot_1230 slot_1300 slot_1330 slot_1400 slot_1430 slot_1500 slot_1530 slot_1600 slot_1630 - slot
  )
  (:init
    ;; Isabella is free the entire day from 9:00 to 17:00.
    (isabella_free slot_0900)
    (isabella_free slot_0930)
    (isabella_free slot_1000)
    (isabella_free slot_1030)
    (isabella_free slot_1100)
    (isabella_free slot_1130)
    (isabella_free slot_1200)
    (isabella_free slot_1230)
    (isabella_free slot_1300)
    (isabella_free slot_1330)
    (isabella_free slot_1400)
    (isabella_free slot_1430)
    (isabella_free slot_1500)
    (isabella_free slot_1530)
    (isabella_free slot_1600)
    (isabella_free slot_1630)

    ;; Ronald is busy 11:30-12:00, 14:00-14:30, 16:00-17:00.
    (ronald_free slot_0900)
    (ronald_free slot_0930)
    (ronald_free slot_1000)
    (ronald_free slot_1030)
    (ronald_free slot_1100)
    ;; Ronald busy slot_1130
    (ronald_free slot_1200)
    (ronald_free slot_1230)
    (ronald_free slot_1300)
    (ronald_free slot_1330)
    ;; Ronald busy slot_1400
    (ronald_free slot_1430)
    (ronald_free slot_1500)
    (ronald_free slot_1530)
    ;; Ronald busy slot_1600, slot_1630

    ;; Amanda is busy 9:30-12:00, 12:30-13:00, 13:30-14:00, 15:30-17:00.
    (amanda_free slot_0900)
    ;; Amanda busy slot_0930, 1000, 1030, 1100, 1130
    (amanda_free slot_1200)
    ;; Amanda busy slot_1230
    (amanda_free slot_1300)
    ;; Amanda busy slot_1330
    (amanda_free slot_1400)
    (amanda_free slot_1430)
    (amanda_free slot_1500)
    ;; Amanda busy slot_1530, 1600, 1630

    ;; Isabella would rather not meet after 13:00.
    ;; Preferred slots start at or before 12:30 (so they end by 13:00).
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