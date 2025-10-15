(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  ;; Objects: three participants and discrete 30-minute slots between 09:00 and 17:00.
  ;; Slot naming convention sHHMM_HHMM (start_end).
  (:objects
    roy kathryn amy - person

    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )

  (:init
    ;; Meeting initially not scheduled
    (unscheduled)

    ;; Availability facts derived from public work hours (09:00-17:00) minus each agent's busy intervals.
    ;; Roy: busy 09:00-09:30, 10:00-10:30, 11:00-11:30, 12:30-13:00
    ;; => Roy available on all slots within work hours except those listed as busy.
    (available roy s0930_1000)
    (available roy s1030_1100)
    (available roy s1130_1200)
    (available roy s1200_1230)
    (available roy s1300_1330)
    (available roy s1330_1400)
    (available roy s1400_1430)
    (available roy s1430_1500)
    (available roy s1500_1530)
    (available roy s1530_1600)
    (available roy s1600_1630)
    (available roy s1630_1700)

    ;; Kathryn: busy 09:30-10:00 and 16:30-17:00
    ;; => Kathryn available on all other slots in work hours.
    (available kathryn s0900_0930)
    (available kathryn s1000_1030)
    (available kathryn s1030_1100)
    (available kathryn s1100_1130)
    (available kathryn s1130_1200)
    (available kathryn s1200_1230)
    (available kathryn s1230_1300)
    (available kathryn s1300_1330)
    (available kathryn s1330_1400)
    (available kathryn s1400_1430)
    (available kathryn s1430_1500)
    (available kathryn s1500_1530)
    (available kathryn s1530_1600)
    (available kathryn s1600_1630)

    ;; Amy: busy 09:00-14:30, 15:00-16:00, 16:30-17:00
    ;; Preference "would rather not meet after 15:30" is treated as a strict constraint
    ;; (i.e., meeting must end by 15:30). With the above busy intervals that leaves only
    ;; 14:30-15:00 as an available slot for Amy.
    (available amy s1430_1500)
  )

  ;; Goal: produce a single scheduled meeting (the schedule action will ensure the chosen slot is available for all three).
  (:goal (scheduled))
)