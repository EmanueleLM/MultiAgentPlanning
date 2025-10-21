(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - timeslot
  )

  (:init
    ;; Heather's availability (busy: 09:00-09:30, 10:30-11:00, 13:00-14:00, 14:30-15:00, 16:00-16:30)
    (available heather s0930_1000)
    (available heather s1000_1030)
    (available heather s1100_1130)
    (available heather s1130_1200)
    (available heather s1200_1230)
    (available heather s1230_1300)
    (available heather s1400_1430)
    (available heather s1500_1530)
    (available heather s1530_1600)
    (available heather s1630_1700)

    ;; Nicholas is free the whole work day (09:00-17:00)
    (available nicholas s0900_0930)
    (available nicholas s0930_1000)
    (available nicholas s1000_1030)
    (available nicholas s1030_1100)
    (available nicholas s1100_1130)
    (available nicholas s1130_1200)
    (available nicholas s1200_1230)
    (available nicholas s1230_1300)
    (available nicholas s1300_1330)
    (available nicholas s1330_1400)
    (available nicholas s1400_1430)
    (available nicholas s1430_1500)
    (available nicholas s1500_1530)
    (available nicholas s1530_1600)
    (available nicholas s1600_1630)
    (available nicholas s1630_1700)

    ;; Zachary's availability (busy: 09:00-10:30, 11:00-12:00, 12:30-13:00, 13:30-16:30)
    ;; He prefers not to meet after 14:00 (soft preference)
    (available zachary s1030_1100)
    (available zachary s1200_1230)
    (available zachary s1300_1330)
    (available zachary s1630_1700)

    ;; Preferred timeslots (start before 14:00) according to Zachary's soft preference:
    (preferred s0900_0930)
    (preferred s0930_1000)
    (preferred s1000_1030)
    (preferred s1030_1100)
    (preferred s1100_1130)
    (preferred s1130_1200)
    (preferred s1200_1230)
    (preferred s1230_1300)
    (preferred s1300_1330)
    (preferred s1330_1400)

    ;; initialize total-cost
    (= (total-cost) 0)
  )

  ;; minimize total-cost to respect Zachary's soft preference when possible
  (:metric minimize (total-cost))

  ;; goal: a meeting has been scheduled
  (:goal (and (scheduled)))
)