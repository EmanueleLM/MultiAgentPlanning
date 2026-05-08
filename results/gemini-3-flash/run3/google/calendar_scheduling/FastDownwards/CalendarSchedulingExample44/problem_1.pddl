(define (problem calendar_problem_44)
  (:domain calendar_scheduling)
  (:objects
    isabella ronald amanda - person
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Isabella is free all day, but prefers not to meet after 13:00.
    ;; We encode this preference as a hard constraint for this problem.
    (available isabella t0900_0930)
    (available isabella t0930_1000)
    (available isabella t1000_1030)
    (available isabella t1030_1100)
    (available isabella t1100_1130)
    (available isabella t1130_1200)
    (available isabella t1200_1230)
    (available isabella t1230_1300)

    ;; Ronald blocked: 11:30-12:00, 14:00-14:30, 16:00-17:00
    (available ronald t0900_0930)
    (available ronald t0930_1000)
    (available ronald t1000_1030)
    (available ronald t1030_1100)
    (available ronald t1100_1130)
    ;; 11:30-12:00 blocked
    (available ronald t1200_1230)
    (available ronald t1230_1300)
    (available ronald t1300_1330)
    (available ronald t1330_1400)
    ;; 14:00-14:30 blocked
    (available ronald t1430_1500)
    (available ronald t1500_1530)
    (available ronald t1530_1600)
    ;; 16:00-17:00 blocked

    ;; Amanda busy: 9:30-12:00, 12:30-13:00, 13:30-14:00, 15:30-17:00
    (available amanda t0900_0930)
    ;; 9:30-12:00 busy
    (available amanda t1200_1230)
    ;; 12:30-13:00 busy
    (available amanda t1300_1330)
    ;; 13:30-14:00 busy
    (available amanda t1400_1430)
    (available amanda t1430_1500)
    (available amanda t1500_1530)
    ;; 15:30-17:00 busy
  )
  (:goal (meeting_scheduled))
)