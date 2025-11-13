(define (problem schedule-meeting-monday)
  (:domain schedule-meeting)

  (:objects
    diane kelly deborah - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; participant and slot declarations
    (participant diane)
    (participant kelly)
    (participant deborah)
    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100) (slot s1130)
    (slot s1200) (slot s1230) (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Availability facts (free ?participant ?slot) derived from public busy schedules.
    ;; Diane busy: s0900, s1200, s1430, s1500 -> free everywhere else
    (free diane s0930) (free diane s1000) (free diane s1030) (free diane s1100)
    (free diane s1130) (free diane s1230) (free diane s1300) (free diane s1330)
    (free diane s1400) (free diane s1530) (free diane s1600) (free diane s1630)

    ;; Kelly busy: s0930, s1030 -> free everywhere else
    (free kelly s0900) (free kelly s1000) (free kelly s1100) (free kelly s1130)
    (free kelly s1200) (free kelly s1230) (free kelly s1300) (free kelly s1330)
    (free kelly s1400) (free kelly s1430) (free kelly s1500) (free kelly s1530)
    (free kelly s1600) (free kelly s1630)

    ;; Deborah busy: s0900, s1000, s1030, s1100, s1130, s1200, s1230, s1300, s1330, s1430, s1500, s1530, s1600, s1630
    ;; Deborah free only at s0930 and s1400
    (free deborah s0930) (free deborah s1400)
  )

  (:goal (scheduled))
)