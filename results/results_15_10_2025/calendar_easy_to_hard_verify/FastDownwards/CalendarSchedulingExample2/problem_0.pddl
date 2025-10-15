(define (problem schedule-monday)
  (:domain meeting-scheduling)

  ;; Objects: three persons and all 30-minute slots between 09:00 and 17:00 on Monday
  (:objects
    roy kathryn amy - person
    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )

  (:init
    ;; Persons and slots
    (person roy) (person kathryn) (person amy)
    (slot s0900_0930) (slot s0930_1000) (slot s1000_1030) (slot s1030_1100)
    (slot s1100_1130) (slot s1130_1200) (slot s1200_1230) (slot s1230_1300)
    (slot s1300_1330) (slot s1330_1400) (slot s1400_1430) (slot s1430_1500)
    (slot s1500_1530) (slot s1530_1600) (slot s1600_1630) (slot s1630_1700)

    ;; Availability facts computed from each participant's busy intervals.
    ;; Roy: busy 09:00-09:30, 10:00-10:30, 11:00-11:30, 12:30-13:00 -> not available at those start times
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
    ;; Preference "would rather not meet after 15:30" treated as a hard constraint -> meeting must end by 15:30
    ;; Therefore only slot available consistent with busy times and preference is 14:30-15:00.
    (available amy s1430_1500)
  )

  ;; Goal: one meeting scheduled (action enforces availability of all three)
  (:goal (scheduled))
)