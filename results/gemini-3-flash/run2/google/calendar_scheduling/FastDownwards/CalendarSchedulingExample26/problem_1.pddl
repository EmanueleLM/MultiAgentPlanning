(define (problem calendar_problem_26)
  (:domain calendar_scheduling_26)
  (:objects
    katherine nicole kevin - person
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100 
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300 
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500 
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - timeslot
  )
  (:init
    ;; Successive time slots
    (consecutive slot_0900_0930 slot_0930_1000)
    (consecutive slot_0930_1000 slot_1000_1030)
    (consecutive slot_1000_1030 slot_1030_1100)
    (consecutive slot_1030_1100 slot_1100_1130)
    (consecutive slot_1100_1130 slot_1130_1200)
    (consecutive slot_1130_1200 slot_1200_1230)
    (consecutive slot_1200_1230 slot_1230_1300)
    (consecutive slot_1230_1300 slot_1300_1330)
    (consecutive slot_1300_1330 slot_1330_1400)
    (consecutive slot_1330_1400 slot_1400_1430)
    (consecutive slot_1400_1430 slot_1430_1500)
    (consecutive slot_1430_1500 slot_1500_1530)
    (consecutive slot_1500_1530 slot_1530_1600)
    (consecutive slot_1530_1600 slot_1600_1630)
    (consecutive slot_1600_1630 slot_1630_1700)

    ;; Katherine is free the entire day
    (free katherine slot_0900_0930)
    (free katherine slot_0930_1000)
    (free katherine slot_1000_1030)
    (free katherine slot_1030_1100)
    (free katherine slot_1100_1130)
    (free katherine slot_1130_1200)
    (free katherine slot_1200_1230)
    (free katherine slot_1230_1300)
    (free katherine slot_1300_1330)
    (free katherine slot_1330_1400)
    (free katherine slot_1400_1430)
    (free katherine slot_1430_1500)
    (free katherine slot_1500_1530)
    (free katherine slot_1530_1600)
    (free katherine slot_1600_1630)
    (free katherine slot_1630_1700)

    ;; Nicole is wide open the entire day
    (free nicole slot_0900_0930)
    (free nicole slot_0930_1000)
    (free nicole slot_1000_1030)
    (free nicole slot_1030_1100)
    (free nicole slot_1100_1130)
    (free nicole slot_1130_1200)
    (free nicole slot_1200_1230)
    (free nicole slot_1230_1300)
    (free nicole slot_1300_1330)
    (free nicole slot_1330_1400)
    (free nicole slot_1400_1430)
    (free nicole slot_1430_1500)
    (free nicole slot_1500_1530)
    (free nicole slot_1530_1600)
    (free nicole slot_1600_1630)
    (free nicole slot_1630_1700)

    ;; Kevin's free slots (derived from blocked periods)
    ;; 9:00-10:00 blocked, 10:00-10:30 free, 10:30-11:30 blocked, 11:30-12:00 free, 12:00-15:30 blocked, 15:30-16:30 free, 16:30-17:00 blocked
    (free kevin slot_1000_1030)
    (free kevin slot_1130_1200)
    (free kevin slot_1530_1600)
    (free kevin slot_1600_1630)
  )
  (:goal (scheduled katherine nicole kevin))
)