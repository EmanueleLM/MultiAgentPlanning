(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    heather nicholas zachary - participant

    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - timeslot
  )

  (:init
    ;-- Heather's provided availability (Heather's Monday calendar)
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

    ;-- Nicholas's provided availability (full work-hours availability)
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

    ;-- Zachary's provided available slots with preferences encoded as strict constraints:
    ;   "preferred" slots are treated as allowed; "dispreferred" slots are treated as forbidden
    ;   (preferences are encoded as hard constraints per instructions)
    (available zachary s1030_1100)   ; Zachary: 10:30-11:00 (preferred)
    (available zachary s1200_1230)   ; Zachary: 12:00-12:30 (preferred)
    (available zachary s1300_1330)   ; Zachary: 13:00-13:30 (preferred)
    ; Zachary's 16:30-17:00 was marked 'dispreferred' in input and is therefore NOT included
    ; (available zachary s1630_1700)  ; intentionally omitted as disallowed

    ; Note: no (scheduled) fact in init => scheduled is false initially
  )

  (:goal (scheduled))
)