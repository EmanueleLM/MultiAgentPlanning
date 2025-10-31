(define (problem schedule-one-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    karen brandon donald kelly - agent

    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )

  (:init
    ; Public constraint encoded as only the earliest feasible common slot being proposed:
    ; Earliest common available slot across karen, brandon, donald, kelly is 14:00-14:30 (s1400_1430).
    (proposed s1400_1430)

    ; Availabilities derived strictly from provided busy intervals (30-min granularity).
    ; Karen (busy 09:00-10:30, 16:30-17:00)
    (available karen s1030_1100)
    (available karen s1100_1130)
    (available karen s1130_1200)
    (available karen s1200_1230)
    (available karen s1230_1300)
    (available karen s1300_1330)
    (available karen s1330_1400)
    (available karen s1400_1430)
    (available karen s1430_1500)
    (available karen s1500_1530)
    (available karen s1530_1600)
    (available karen s1600_1630)

    ; Brandon (busy 09:30-10:00, 10:30-11:00, 11:30-12:30, 15:30-16:00, 16:30-17:00)
    (available brandon s0900_0930)
    (available brandon s1000_1030)
    (available brandon s1100_1130)
    (available brandon s1230_1300)
    (available brandon s1300_1330)
    (available brandon s1330_1400)
    (available brandon s1400_1430)
    (available brandon s1430_1500)
    (available brandon s1500_1530)
    (available brandon s1600_1630)

    ; Donald (busy 09:00-10:30, 11:00-14:00, 14:30-17:00)
    (available donald s1030_1100)
    (available donald s1400_1430)

    ; Kelly (busy 09:00-09:30, 10:30-11:00, 11:30-12:00, 13:30-14:00, 14:30-15:30, 16:00-17:00)
    (available kelly s0930_1000)
    (available kelly s1000_1030)
    (available kelly s1100_1130)
    (available kelly s1200_1230)
    (available kelly s1230_1300)
    (available kelly s1300_1330)
    (available kelly s1400_1430)
    (available kelly s1530_1600)
  )

  (:goal (and
    (meeting-held)
    (attending karen)
    (attending brandon)
    (attending donald)
    (attending kelly)
  ))
)