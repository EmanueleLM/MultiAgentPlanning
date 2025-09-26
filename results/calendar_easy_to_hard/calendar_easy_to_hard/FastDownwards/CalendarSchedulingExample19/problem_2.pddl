(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; Marie busy 11:00-11:30 and 15:00-16:30 -> unavailable s11_00, s15_00, s15_30, s16_00
    (available marie s09_00)
    (available marie s09_30)
    (available marie s10_00)
    (available marie s10_30)
    (available marie s11_30)
    (available marie s12_00)
    (available marie s12_30)
    (available marie s13_00)
    (available marie s13_30)
    (available marie s14_00)
    (available marie s14_30)
    (available marie s16_30)

    ;; Janice busy 12:30-13:00 and 13:30-15:00 -> unavailable s12_30, s13_30, s14_00, s14_30
    (available janice s09_00)
    (available janice s09_30)
    (available janice s10_00)
    (available janice s10_30)
    (available janice s11_00)
    (available janice s11_30)
    (available janice s12_00)
    (available janice s13_00)
    (available janice s15_00)
    (available janice s15_30)
    (available janice s16_00)
    (available janice s16_30)

    ;; Elijah busy 10:00-13:00, 14:30-15:00, 16:00-16:30 -> unavailable s10_00,s10_30,s11_00,s11_30,s12_00,s12_30,s14_30,s16_00
    (available elijah s09_00)
    (available elijah s09_30)
    (available elijah s13_00)
    (available elijah s13_30)
    (available elijah s14_00)
    (available elijah s15_00)
    (available elijah s15_30)
    (available elijah s16_30)

    ;; Theresa busy 09:30-10:30,12:00-13:00,13:30-14:00,14:30-15:00,15:30-16:00,16:30-17:00
    ;; and preference: do not meet after 12:00 -> allowed start slots must be at or before s11_30
    (available theresa s09_00)
    (available theresa s10_30)
    (available theresa s11_00)
    (available theresa s11_30)

    (unscheduled)
  )

  (:goal (exists (?s - slot) (meeting-scheduled ?s)))
)