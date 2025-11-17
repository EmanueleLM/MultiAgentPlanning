(define (problem schedule-meeting-monday)
  (:domain schedule-meeting)

  (:objects
    diane kelly deborah - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; participants and slots
    (participant diane)
    (participant kelly)
    (participant deborah)

    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; ordered slot successor relation (explicit ordered stages)
    (first-slot s0900)
    (last-slot s1630)
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    ;; Availability facts derived from public busy schedules (closed-open [start,end), 30-min slots).
    ;; Diane busy: [09:00,09:30) -> s0900 busy; [12:00,12:30) -> s1200 busy; [14:30,15:30) -> s1430 and s1500 busy
    ;; Diane free at all other slots within work hours
    (free diane s0930) (free diane s1000) (free diane s1030) (free diane s1100)
    (free diane s1130) (free diane s1230) (free diane s1300) (free diane s1330)
    (free diane s1400) (free diane s1530) (free diane s1600) (free diane s1630)

    ;; Kelly busy: [09:30,10:00) -> s0930 busy; [10:30,11:00) -> s1030 busy
    ;; Kelly free at all other slots
    (free kelly s0900) (free kelly s1000) (free kelly s1100) (free kelly s1130)
    (free kelly s1200) (free kelly s1230) (free kelly s1300) (free kelly s1330)
    (free kelly s1400) (free kelly s1430) (free kelly s1500) (free kelly s1530)
    (free kelly s1600) (free kelly s1630)

    ;; Deborah busy: [09:00,09:30) -> s0900; [10:00,14:00) -> s1000..s1330; [14:30,17:00) -> s1430..s1630
    ;; Deborah free only at s0930 and s1400 within work hours
    (free deborah s0930) (free deborah s1400)
  )

  (:goal (scheduled))
)