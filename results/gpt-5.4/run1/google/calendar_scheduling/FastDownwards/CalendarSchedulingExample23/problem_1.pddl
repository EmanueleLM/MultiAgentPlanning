(define (problem monday_meeting_instance)
  (:domain monday_meeting_scheduling)

  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - slot
    meeting_1 - meeting
  )

  (:init
    (next_slot t0900_0930 t0930_1000)
    (next_slot t0930_1000 t1000_1030)
    (next_slot t1000_1030 t1030_1100)
    (next_slot t1030_1100 t1100_1130)
    (next_slot t1100_1130 t1130_1200)
    (next_slot t1130_1200 t1200_1230)
    (next_slot t1200_1230 t1230_1300)
    (next_slot t1230_1300 t1300_1330)
    (next_slot t1300_1330 t1330_1400)
    (next_slot t1330_1400 t1400_1430)
    (next_slot t1400_1430 t1430_1500)
    (next_slot t1430_1500 t1500_1530)
    (next_slot t1500_1530 t1530_1600)
    (next_slot t1530_1600 t1600_1630)
    (next_slot t1600_1630 t1630_1700)

    (valid_start t0900_0930)
    (valid_start t0930_1000)
    (valid_start t1000_1030)
    (valid_start t1030_1100)
    (valid_start t1100_1130)
    (valid_start t1130_1200)
    (valid_start t1200_1230)
    (valid_start t1230_1300)
    (valid_start t1300_1330)
    (valid_start t1330_1400)
    (valid_start t1400_1430)
    (valid_start t1430_1500)
    (valid_start t1500_1530)
    (valid_start t1530_1600)
    (valid_start t1600_1630)

    (busy billy t1130_1200)
    (busy billy t1300_1330)
    (busy billy t1330_1400)
    (busy billy t1400_1430)
    (busy billy t1430_1500)
    (busy billy t1600_1630)

    (busy maria t0900_0930)
    (busy maria t1000_1030)
    (busy maria t1300_1330)
    (busy maria t1400_1430)

    (busy william t0930_1000)
    (busy william t1200_1230)
    (busy william t1330_1400)
    (busy william t1400_1430)
    (busy william t1430_1500)
    (busy william t1530_1600)
    (busy william t1600_1630)
    (busy william t1630_1700)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)