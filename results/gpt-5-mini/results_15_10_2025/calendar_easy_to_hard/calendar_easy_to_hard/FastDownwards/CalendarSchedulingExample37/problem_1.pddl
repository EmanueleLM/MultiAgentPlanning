(define (problem CalendarSchedulingExample37)
  (:domain calendar-scheduling)
  (:objects
    ronald stephen brittany dorothy rebecca jordan - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ; Ronald: free all slots
    (free ronald t0900) (free ronald t0930) (free ronald t1000) (free ronald t1030)
    (free ronald t1100) (free ronald t1130) (free ronald t1200) (free ronald t1230)
    (free ronald t1300) (free ronald t1330) (free ronald t1400) (free ronald t1430)
    (free ronald t1500) (free ronald t1530) (free ronald t1600) (free ronald t1630)

    ; Stephen: busy at 10:00 (t1000) and 12:00 (t1200)
    (free stephen t0900) (free stephen t0930) (free stephen t1030) (free stephen t1100)
    (free stephen t1130) (free stephen t1230) (free stephen t1300) (free stephen t1330)
    (free stephen t1400) (free stephen t1430) (free stephen t1500) (free stephen t1530)
    (free stephen t1600) (free stephen t1630)

    ; Brittany: busy at 11:00 (t1100), 13:30 (t1330), 15:30 (t1530), 16:30 (t1630)
    (free brittany t0900) (free brittany t0930) (free brittany t1000) (free brittany t1030)
    (free brittany t1130) (free brittany t1200) (free brittany t1230) (free brittany t1300)
    (free brittany t1400) (free brittany t1430) (free brittany t1500) (free brittany t1600)

    ; Dorothy: busy at t0900,t1000,t1100,t1130,t1200,t1300,t1330,t1400,t1430,t1530,t1600,t1630
    (free dorothy t0930) (free dorothy t1030) (free dorothy t1230) (free dorothy t1500)

    ; Rebecca: busy at t0930,t1000,t1100,t1200,t1300,t1330,t1400,t1430,t1500,t1530,t1600,t1630
    (free rebecca t0900) (free rebecca t1030) (free rebecca t1130) (free rebecca t1230)

    ; Jordan: busy at t0900,t1000,t1030,t1130,t1300,t1330,t1400,t1430,t1530,t1600
    (free jordan t0930) (free jordan t1100) (free jordan t1200) (free jordan t1230)
    (free jordan t1500) (free jordan t1630)
  )
  (:goal (meeting-scheduled))
)