(define (problem calendar_scheduling_example_27)
  (:domain calendar_scheduling)
  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100
    t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - slot
  )

  (:init
    ;; Starting time
    (current_slot t0900_0930)

    ;; Temporal ordering of slots
    (next t0900_0930 t0930_1000)
    (next t0930_1000 t1000_1030)
    (next t1000_1030 t1030_1100)
    (next t1030_1100 t1100_1130)
    (next t1100_1130 t1130_1200)
    (next t1130_1200 t1200_1230)
    (next t1200_1230 t1230_1300)
    (next t1230_1300 t1300_1330)
    (next t1300_1330 t1330_1400)
    (next t1330_1400 t1400_1430)
    (next t1400_1430 t1430_1500)
    (next t1430_1500 t1500_1530)
    (next t1500_1530 t1530_1600)
    (next t1530_1600 t1600_1630)
    (next t1600_1630 t1630_1700)

    ;; Jesse's availability (Busy: 10:00-10:30, 15:30-16:00)
    (available_jesse t0900_0930)
    (available_jesse t0930_1000)
    (available_jesse t1030_1100)
    (available_jesse t1100_1130)
    (available_jesse t1130_1200)
    (available_jesse t1200_1230)
    (available_jesse t1230_1300)
    (available_jesse t1300_1330)
    (available_jesse t1330_1400)
    (available_jesse t1400_1430)
    (available_jesse t1430_1500)
    (available_jesse t1500_1530)
    (available_jesse t1600_1630)
    (available_jesse t1630_1700)

    ;; Kathryn's availability (Wide open)
    (available_kathryn t0900_0930)
    (available_kathryn t0930_1000)
    (available_kathryn t1000_1030)
    (available_kathryn t1030_1100)
    (available_kathryn t1100_1130)
    (available_kathryn t1130_1200)
    (available_kathryn t1200_1230)
    (available_kathryn t1230_1300)
    (available_kathryn t1300_1330)
    (available_kathryn t1330_1400)
    (available_kathryn t1400_1430)
    (available_kathryn t1430_1500)
    (available_kathryn t1500_1530)
    (available_kathryn t1530_1600)
    (available_kathryn t1600_1630)
    (available_kathryn t1630_1700)

    ;; Megan's availability (Busy: 10:30-11:00, 11:30-12:30, 13:30-14:30, 15:00-16:30)
    (available_megan t0900_0930)
    (available_megan t0930_1000)
    (available_megan t1000_1030)
    (available_megan t1100_1130)
    (available_megan t1230_1300)
    (available_megan t1300_1330)
    (available_megan t1430_1500)
    (available_megan t1630_1700)
  )

  (:goal
    (scheduled)
  )
)