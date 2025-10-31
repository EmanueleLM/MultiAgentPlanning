(define (problem schedule-monday-30min)
  (:domain meeting-schedule)
  (:objects
    p1 p2 p3 - participant
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - timeslot
  )

  (:init
    ; Participant 1 availabilities
    (available p1 slot_0900_0930)
    (available p1 slot_0930_1000)
    (available p1 slot_1000_1030)
    (available p1 slot_1030_1100)
    (available p1 slot_1100_1130)
    (available p1 slot_1130_1200)
    (available p1 slot_1200_1230)
    (available p1 slot_1230_1300)
    (available p1 slot_1330_1400)
    (available p1 slot_1400_1430)
    (available p1 slot_1430_1500)
    (available p1 slot_1500_1530)
    (available p1 slot_1530_1600)
    (available p1 slot_1630_1700)

    ; Participant 2 availabilities
    (available p2 slot_0900_0930)
    (available p2 slot_0930_1000)
    (available p2 slot_1000_1030)
    (available p2 slot_1030_1100)
    (available p2 slot_1100_1130)
    (available p2 slot_1130_1200)
    (available p2 slot_1200_1230)
    (available p2 slot_1230_1300)
    (available p2 slot_1300_1330)
    (available p2 slot_1330_1400)
    (available p2 slot_1400_1430)
    (available p2 slot_1430_1500)
    (available p2 slot_1500_1530)
    (available p2 slot_1530_1600)
    (available p2 slot_1600_1630)
    (available p2 slot_1630_1700)

    ; Participant 3 availabilities
    (available p3 slot_1100_1130)
    (available p3 slot_1430_1500)

    ; Precomputed common (earliest) slot across all participants
    ; Earliest common 30-minute slot on Monday within 09:00-17:00 is 11:00-11:30
    (common slot_1100_1130)
  )

  (:goal (and (scheduled) (assigned slot_1100_1130)))
)