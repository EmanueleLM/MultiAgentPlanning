(define (problem calendar_scheduling_example18)
  (:domain calendar_scheduling)
  (:objects
    time_0900 time_0930 time_1000 time_1030 time_1100 time_1130
    time_1200 time_1230 time_1300 time_1330 time_1400 time_1430
    time_1500 time_1530 time_1600 time_1630 - timeslot
  )
  (:init
    ;; Brian: no meetings all day
    (available brian time_0900)
    (available brian time_0930)
    (available brian time_1000)
    (available brian time_1030)
    (available brian time_1100)
    (available brian time_1130)
    (available brian time_1200)
    (available brian time_1230)
    (available brian time_1300)
    (available brian time_1330)
    (available brian time_1400)
    (available brian time_1430)
    (available brian time_1500)
    (available brian time_1530)
    (available brian time_1600)
    (available brian time_1630)

    ;; Billy: busy 10:00-10:30 (time_1000), 11:30-12:00 (time_1130), 
    ;; 14:00-14:30 (time_1400), 16:30-17:00 (time_1630)
    ;; Also avoids after 15:30 (time_1530, time_1600, time_1630)
    (available billy time_0900)
    (available billy time_0930)
    ;; time_1000 busy
    (available billy time_1030)
    (available billy time_1100)
    ;; time_1130 busy
    (available billy time_1200)
    (available billy time_1230)
    (available billy time_1300)
    (available billy time_1330)
    ;; time_1400 busy
    (available billy time_1430)
    (available billy time_1500)
    ;; time_1530 avoid
    ;; time_1600 avoid
    ;; time_1630 busy/avoid

    ;; Patricia: blocked 9:00-12:30 (time_0900-time_1200), 
    ;; 13:30-14:00 (time_1330), 14:30-16:00 (time_1430, time_1500, time_1530), 
    ;; 16:30-17:00 (time_1630)
    ;; Gaps of availability: 12:30-13:30, 14:00-14:30, 16:00-16:30
    (available patricia time_1230)
    (available patricia time_1300)
    (available patricia time_1400)
    (available patricia time_1600)
  )
  (:goal (meeting_scheduled))
)