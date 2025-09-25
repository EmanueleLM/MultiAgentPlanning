(define (problem schedule-monday-60min-combined)
  (:domain meeting-scheduling-combined)

  (:objects
    madison diana shirley - participant

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (next s0900 s0930)
    (next s0930 s1000)
    (next s1000 s1030)
    (next s1030 s1100)
    (next s1100 s1130)
    (next s1130 s1200)
    (next s1200 s1230)
    (next s1230 s1300)
    (next s1300 s1330)
    (next s1330 s1400)
    (next s1400 s1430)
    (next s1430 s1500)
    (next s1500 s1530)
    (next s1530 s1600)
    (next s1600 s1630)

    ;; madison busy: 09:30-10:00, 11:30-12:00
    (busy madison s0930)
    (busy madison s1130)

    ;; diana busy: 11:00-11:30, 13:00-13:30
    (busy diana s1100)
    (busy diana s1300)

    ;; shirley busy: 09:00-12:00, 13:30-15:00, 15:30-17:00
    (busy shirley s0900) (busy shirley s0930) (busy shirley s1000) (busy shirley s1030) (busy shirley s1100) (busy shirley s1130)
    (busy shirley s1330) (busy shirley s1400) (busy shirley s1430)
    (busy shirley s1530) (busy shirley s1600) (busy shirley s1630)

    ;; free slots (all slots not listed as busy for each participant)
    ;; madison free
    (free madison s0900) (free madison s1000) (free madison s1030) (free madison s1100)
    (free madison s1200) (free madison s1230) (free madison s1300) (free madison s1330)
    (free madison s1400) (free madison s1430) (free madison s1500) (free madison s1530)
    (free madison s1600) (free madison s1630)

    ;; diana free
    (free diana s0900) (free diana s0930) (free diana s1000) (free diana s1030)
    (free diana s1130) (free diana s1200) (free diana s1230) (free diana s1330)
    (free diana s1400) (free diana s1430) (free diana s1500) (free diana s1530)
    (free diana s1600) (free diana s1630)

    ;; shirley free
    (free shirley s1200) (free shirley s1230) (free shirley s1300) (free shirley s1500)
  )

  (:goal (meeting-scheduled))
)