(define (problem meeting-problem-integrated)
  (:domain meeting-scheduler-integrated)
  (:objects
     diane deborah - person
     slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
     slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
     slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
     slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )
  (:init
     ; Agent 1: Diane busy; timeslots are 30-min intervals
     (busy diane slot_0900_0930)
     (busy diane slot_1200_1230)
     (busy diane slot_1430_1500)
     (busy diane slot_1500_1530)

     ; Agent 2: Deborah busy at 9:30-10:00 and 10:30-11:00 (in these units)
     (busy deborah slot_0930_1000)
     (busy deborah slot_1030_1100)

     ; Agent 3: Free statuses indicate availability for 10:00-10:30 and 14:00-14:30
     (free diane slot_1000_1030)
     (free deborah slot_1000_1030)
     (free diane slot_1400_1430)
     (free deborah slot_1400_1430)
  )
  (:goal (scheduled slot_1000_1030))
)