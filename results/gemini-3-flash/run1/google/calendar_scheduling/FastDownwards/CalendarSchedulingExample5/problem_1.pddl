(define (problem schedule_monday)
  (:domain calendar_scheduling)
  (:objects
    kathryn charlotte lauren - person
    t900_930 t930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Kathryn is free except during blocked slots: 9:00-9:30, 10:30-11:00, 11:30-12:00, 13:30-14:30, 16:30-17:00
    (available kathryn t930_1000)
    (available kathryn t1000_1030)
    (available kathryn t1100_1130)
    (available kathryn t1200_1230)
    (available kathryn t1230_1300)
    (available kathryn t1300_1330)
    (available kathryn t1430_1500)
    (available kathryn t1500_1530)
    (available kathryn t1530_1600)
    (available kathryn t1600_1630)

    ;; Charlotte is free except: 12:00-12:30, 16:00-16:30, and any time after 13:30
    (available charlotte t900_930)
    (available charlotte t930_1000)
    (available charlotte t1000_1030)
    (available charlotte t1030_1100)
    (available charlotte t1100_1130)
    (available charlotte t1130_1200)
    (available charlotte t1230_1300)
    (available charlotte t1300_1330)

    ;; Lauren is free except during blocked slots: 9:00-10:00, 12:00-12:30, 13:30-14:30, 15:00-16:00, 16:30-17:00
    (available lauren t1000_1030)
    (available lauren t1030_1100)
    (available lauren t1100_1130)
    (available lauren t1130_1200)
    (available lauren t1230_1300)
    (available lauren t1300_1330)
    (available lauren t1430_1500)
    (available lauren t1600_1630)
  )
  (:goal (meeting_scheduled))
)