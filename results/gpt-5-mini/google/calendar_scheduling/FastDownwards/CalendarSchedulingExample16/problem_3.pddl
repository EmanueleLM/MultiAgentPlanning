(define (problem calendar_scheduling_example16_problem)
  (:domain calendar_scheduling_example16)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ;; Scott's available 30-min start slots (09:00-17:00, excluding his busy intervals)
    (available scott t0900)
    (available scott t1030)
    (available scott t1100)
    (available scott t1130)
    (available scott t1200)
    (available scott t1230)
    (available scott t1300)
    (available scott t1400)
    (available scott t1500)
    (available scott t1600)

    ;; Gabriel: no meetings -> available every half-hour start from 09:00 to 16:30
    (available gabriel t0900)
    (available gabriel t0930)
    (available gabriel t1000)
    (available gabriel t1030)
    (available gabriel t1100)
    (available gabriel t1130)
    (available gabriel t1200)
    (available gabriel t1230)
    (available gabriel t1300)
    (available gabriel t1330)
    (available gabriel t1400)
    (available gabriel t1430)
    (available gabriel t1500)
    (available gabriel t1530)
    (available gabriel t1600)
    (available gabriel t1630)

    ;; Christine's available 30-min start slots given her busy intervals
    (available christine t1000)
    (available christine t1230)
  )

  (:goal (meeting_scheduled))
)