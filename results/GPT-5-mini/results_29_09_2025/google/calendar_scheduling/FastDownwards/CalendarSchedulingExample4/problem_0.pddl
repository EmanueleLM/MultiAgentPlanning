(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    donna john billy - agent

    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )

  (:init
    ;; Donna free slots (busy: 14:00-14:30, 15:30-16:00)
    (free donna s0900_0930)
    (free donna s0930_1000)
    (free donna s1000_1030)
    (free donna s1030_1100)
    (free donna s1100_1130)
    (free donna s1130_1200)
    (free donna s1200_1230)
    (free donna s1230_1300)
    (free donna s1300_1330)
    (free donna s1330_1400)
    (free donna s1430_1500)
    (free donna s1500_1530)
    (free donna s1600_1630)
    (free donna s1630_1700)

    ;; John free slots (busy: 11:00-11:30, 16:30-17:00)
    (free john s0900_0930)
    (free john s0930_1000)
    (free john s1000_1030)
    (free john s1030_1100)
    (free john s1130_1200)
    (free john s1200_1230)
    (free john s1230_1300)
    (free john s1300_1330)
    (free john s1330_1400)
    (free john s1400_1430)
    (free john s1430_1500)
    (free john s1500_1530)
    (free john s1600_1630)

    ;; Billy free slots (busy: 09:00-10:00, 10:30-14:00, 14:30-17:00)
    (free billy s1000_1030)
    (free billy s1400_1430)
  )

  ;; Hard constraint: select the earliest feasible common slot.
  ;; The earliest common available 30-minute slot is s1000_1030.
  (:goal (and (scheduled s1000_1030)))
)