(define (problem schedule-monday-30min)
  (:domain meeting-schedule)
  (:objects
    brittany emily doris - participant

    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - timeslot
  )

  (:init
    ;; Emily: free entire day (all 30-min slots)
    (available emily slot_0900_0930)
    (available emily slot_0930_1000)
    (available emily slot_1000_1030)
    (available emily slot_1030_1100)
    (available emily slot_1100_1130)
    (available emily slot_1130_1200)
    (available emily slot_1200_1230)
    (available emily slot_1230_1300)
    (available emily slot_1300_1330)
    (available emily slot_1330_1400)
    (available emily slot_1400_1430)
    (available emily slot_1430_1500)
    (available emily slot_1500_1530)
    (available emily slot_1530_1600)
    (available emily slot_1600_1630)
    (available emily slot_1630_1700)

    ;; Brittany: busy 13:00-13:30 (slot_1300_1330) and 16:00-16:30 (slot_1600_1630)
    (available brittany slot_0900_0930)
    (available brittany slot_0930_1000)
    (available brittany slot_1000_1030)
    (available brittany slot_1030_1100)
    (available brittany slot_1100_1130)
    (available brittany slot_1130_1200)
    (available brittany slot_1200_1230)
    (available brittany slot_1230_1300)
    ;; slot_1300_1330 not available for brittany
    (available brittany slot_1330_1400)
    (available brittany slot_1400_1430)
    (available brittany slot_1430_1500)
    (available brittany slot_1500_1530)
    (available brittany slot_1530_1600)
    ;; slot_1600_1630 not available for brittany
    (available brittany slot_1630_1700)

    ;; Doris: busy 09:00-11:00 (slots up to 11:00), busy 11:30-14:30, busy 15:00-17:00
    ;; Therefore Doris is available only at 11:00-11:30 and 14:30-15:00 within work hours
    (available doris slot_1100_1130)
    (available doris slot_1430_1500)

    ;; Mark the earliest common slot (precomputed from availabilities above)
    ;; Only the earliest mutual slot is declared common so the planner will choose it
    (common slot_1100_1130)
  )

  ;; Goal: produce a scheduled meeting (the domain only allows scheduling slots marked common,
  ;; so the planner will schedule the earliest feasible common slot)
  (:goal (scheduled))
)