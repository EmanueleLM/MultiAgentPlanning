(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    benjamin hannah brenda - person

    t0900_0930 t0930_1000 t1000_1030 t1030_1100
    t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - slot
  )

  (:init
    ;; participants
    (participant benjamin)
    (participant hannah)
    (participant brenda)

    ;; all slots are declared (not strictly necessary but explicit)
    (slot t0900_0930) (slot t0930_1000) (slot t1000_1030) (slot t1030_1100)
    (slot t1100_1130) (slot t1130_1200) (slot t1200_1230) (slot t1230_1300)
    (slot t1300_1330) (slot t1330_1400) (slot t1400_1430) (slot t1430_1500)
    (slot t1500_1530) (slot t1530_1600) (slot t1600_1630) (slot t1630_1700)

    ;; Benjamin is free the entire day
    (free benjamin t0900_0930) (free benjamin t0930_1000) (free benjamin t1000_1030)
    (free benjamin t1030_1100) (free benjamin t1100_1130) (free benjamin t1130_1200)
    (free benjamin t1200_1230) (free benjamin t1230_1300) (free benjamin t1300_1330)
    (free benjamin t1330_1400) (free benjamin t1400_1430) (free benjamin t1430_1500)
    (free benjamin t1500_1530) (free benjamin t1530_1600) (free benjamin t1600_1630)
    (free benjamin t1630_1700)

    ;; Hannah is free the entire day
    (free hannah t0900_0930) (free hannah t0930_1000) (free hannah t1000_1030)
    (free hannah t1030_1100) (free hannah t1100_1130) (free hannah t1130_1200)
    (free hannah t1200_1230) (free hannah t1230_1300) (free hannah t1300_1330)
    (free hannah t1330_1400) (free hannah t1400_1430) (free hannah t1430_1500)
    (free hannah t1500_1530) (free hannah t1530_1600) (free hannah t1600_1630)
    (free hannah t1630_1700)

    ;; Brenda: busy at 09:30-10:00, 11:30-12:30, and 14:00-16:30.
    ;; So she is free in all slots except those that overlap her meetings.
    (free brenda t0900_0930)
    ;; t0930_1000 is busy -> not declared free
    (free brenda t1000_1030) (free brenda t1030_1100) (free brenda t1100_1130)
    ;; t1130_1200 and t1200_1230 are busy -> not declared free
    (free brenda t1230_1300) (free brenda t1300_1330) (free brenda t1330_1400)
    ;; t1400_1430, t1430_1500, t1500_1530, t1530_1600, t1600_1630 are busy -> not declared free
    (free brenda t1630_1700)

    ;; Benjamin prefers not to meet after 09:30.
    ;; To represent this preference as a hard requirement for this orchestration,
    ;; we mark only the slot 09:00-09:30 as acceptable for Benjamin.
    (acceptable-for-benjamin t0900_0930)
  )

  ;; Global goal: schedule a single 30-minute meeting (one slot) that satisfies
  ;; availability and Benjamin's stated preference.
  ;; Given the provided private information, the only slot satisfying all constraints
  ;; is 09:00-09:30 (t0900_0930).
  (:goal (and (scheduled t0900_0930)))
)