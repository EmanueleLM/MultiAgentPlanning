(define (problem schedule-kcl-monday)
  (:domain calendar-meeting)
  (:objects
    kathryn charlotte lauren - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; next relations (ordered 30-minute timeslots across the work window)
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ;; allowed slots (Charlotte: do not meet after 13:30 -> meeting must finish by 13:30, so latest start 13:00)
    (allowed t0900) (allowed t0930) (allowed t1000) (allowed t1030)
    (allowed t1100) (allowed t1130) (allowed t1200) (allowed t1230) (allowed t1300)

    ;; free facts derived from participants' busy intervals (busy intervals are half-open [start,end))
    ;; Kathryn busy: 09:00, 10:30, 11:30, 13:30-14:30 (13:30,14:00), 16:30
    ;; Kathryn free = all slots except t0900 t1030 t1130 t1330 t1400 t1630
    (free kathryn t0930) (free kathryn t1000) (free kathryn t1100) (free kathryn t1200)
    (free kathryn t1230) (free kathryn t1300) (free kathryn t1430) (free kathryn t1500)
    (free kathryn t1530) (free kathryn t1600)

    ;; Charlotte busy: 12:00, 16:00
    ;; Charlotte free = all slots except t1200 t1600
    (free charlotte t0900) (free charlotte t0930) (free charlotte t1000) (free charlotte t1030)
    (free charlotte t1100) (free charlotte t1130) (free charlotte t1230) (free charlotte t1300)
    (free charlotte t1330) (free charlotte t1400) (free charlotte t1430) (free charlotte t1500)
    (free charlotte t1530) (free charlotte t1630)

    ;; Lauren busy: 09:00-10:00 (t0900,t0930), 12:00 (t1200), 13:30-14:30 (t1330,t1400), 15:00-16:00 (t1500,t1530), 16:30 (t1630)
    ;; Lauren free = all slots except t0900 t0930 t1200 t1330 t1400 t1500 t1530 t1630
    (free lauren t1000) (free lauren t1030) (free lauren t1100) (free lauren t1130)
    (free lauren t1230) (free lauren t1300) (free lauren t1430) (free lauren t1600)
  )
  (:goal (scheduled))
)