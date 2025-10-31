(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Objects: persons and 30-minute start slots from 09:00 to 16:30 (work hours, 30-min granularity)
  (:objects
    madison linda logan virginia - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; persons and slots (typed objects already declare types; included for clarity)
    (person madison) (person linda) (person logan) (person virginia)
    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100) (slot s1130)
    (slot s1200) (slot s1230) (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Availability facts derived from private constraints + work hours.
    ;; Madison free slots (busy: 10:00, 14:30, 15:30, 16:30)
    (available madison s0900) (available madison s0930)
    (available madison s1030) (available madison s1100) (available madison s1130)
    (available madison s1200) (available madison s1230) (available madison s1300)
    (available madison s1330) (available madison s1400) (available madison s1500)
    (available madison s1600)

    ;; Linda is free the whole work day
    (available linda s0900) (available linda s0930) (available linda s1000) (available linda s1030)
    (available linda s1100) (available linda s1130) (available linda s1200) (available linda s1230)
    (available linda s1300) (available linda s1330) (available linda s1400) (available linda s1430)
    (available linda s1500) (available linda s1530) (available linda s1600) (available linda s1630)

    ;; Logan busy 09:00-12:00, 12:30-16:00, 16:30-17:00 -> free only 12:00 and 16:00
    (available logan s1200) (available logan s1600)

    ;; Virginia busy 09:30-11:00, 11:30-12:00, 13:00-14:30, 15:00-15:30, 16:00-17:00
    ;; free slots: 09:00, 11:00, 12:00, 12:30, 14:30, 15:30
    (available virginia s0900) (available virginia s1100)
    (available virginia s1200) (available virginia s1230)
    (available virginia s1430) (available virginia s1530)
  )

  ;; Goal: schedule one meeting (any single slot satisfying all participant availability)
  (:goal (meeting-scheduled))
)