(define (problem CalendarSchedulingExample14-problem)
  (:domain calendar_scheduling)
  (:objects
    ts_0900 ts_0930 ts_1000 ts_1030 ts_1100 ts_1130 ts_1200 ts_1230
    ts_1300 ts_1330 ts_1400 ts_1430 ts_1500 ts_1530 ts_1600 ts_1630 - timeslot
  )
  (:init
    ;; Jerry: no meetings all day -> free at every timeslot
    (free jerry ts_0900) (free jerry ts_0930) (free jerry ts_1000) (free jerry ts_1030)
    (free jerry ts_1100) (free jerry ts_1130) (free jerry ts_1200) (free jerry ts_1230)
    (free jerry ts_1300) (free jerry ts_1330) (free jerry ts_1400) (free jerry ts_1430)
    (free jerry ts_1500) (free jerry ts_1530) (free jerry ts_1600) (free jerry ts_1630)

    ;; Brandon busy 13:00-14:00 (ts_1300, ts_1330), 15:30-16:00 (ts_1530), 16:30-17:00 (ts_1630)
    ;; So Brandon is free at all other timeslots within 09:00-17:00
    (free brandon ts_0900) (free brandon ts_0930) (free brandon ts_1000) (free brandon ts_1030)
    (free brandon ts_1100) (free brandon ts_1130) (free brandon ts_1200) (free brandon ts_1230)
    (free brandon ts_1400) (free brandon ts_1430) (free brandon ts_1500) (free brandon ts_1600)

    ;; Bradley busy 09:00-11:30 (ts_0900..ts_1130), 12:00-15:00 (ts_1200..ts_1430), 16:00-16:30 (ts_1600)
    ;; Bradley's free timeslots are ts_1500, ts_1530, ts_1630
    (free bradley ts_1500) (free bradley ts_1530) (free bradley ts_1630)

    ;; Mark Brandon's preference: prefer meeting start times at or after 14:30 (informational only)
    (preferred ts_1430) (preferred ts_1500) (preferred ts_1530) (preferred ts_1600) (preferred ts_1630)
  )
  (:goal (meeting_scheduled))
)