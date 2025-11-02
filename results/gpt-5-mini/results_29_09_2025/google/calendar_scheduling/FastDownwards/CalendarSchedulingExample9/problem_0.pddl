(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    diane kelly deborah - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ;; persons and slots
    (person diane) (person kelly) (person deborah)
    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100) (slot s1130)
    (slot s1200) (slot s1230) (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Diane's availability (30-minute start slots within 09:00-17:00, excluding busy intervals)
    ;; Diane busy: 09:00-09:30, 12:00-12:30, 14:30-15:30
    (available diane s0930)
    (available diane s1000)
    (available diane s1030)
    (available diane s1100)
    (available diane s1130)
    (available diane s1230)
    (available diane s1300)
    (available diane s1330)
    (available diane s1400)
    (available diane s1530)
    (available diane s1600)
    (available diane s1630)

    ;; Kelly's availability (busy: 09:30-10:00, 10:30-11:00)
    (available kelly s0900)
    (available kelly s1000)
    (available kelly s1100)
    (available kelly s1130)
    (available kelly s1200)
    (available kelly s1230)
    (available kelly s1300)
    (available kelly s1330)
    (available kelly s1400)
    (available kelly s1430)
    (available kelly s1500)
    (available kelly s1530)
    (available kelly s1600)
    (available kelly s1630)

    ;; Deborah's availability (busy: 09:00-09:30, 10:00-14:00, 14:30-17:00)
    (available deborah s0930)
    (available deborah s1400)
  )

  ;; Goal: schedule the required 30-minute meeting at the earliest feasible common slot.
  ;; Earliest common feasible slot computed from availabilities is 14:00-14:30 (s1400).
  (:goal (scheduled s1400))
)