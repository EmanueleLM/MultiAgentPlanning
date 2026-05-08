(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    diana ethan janet - participant
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot
  )

  ;; Initial availability encoded as "free" start slots for a 30-minute meeting.
  ;; Slots represent valid 30-minute start times between 09:00 and 16:30 (meeting ends by 17:00).
  ;; Diana: busy 11:30-12:00 and 13:00-13:30 (those start times removed).
  ;; Ethan: fully available.
  ;; Janet: busy 09:00-10:00, 12:30-13:00, 14:00-15:00, 15:30-17:00 and explicitly does not meet after 12:00.
  ;; The preference "not after 12:00" is enforced here by allowing start times that finish by 12:00 (latest start 11:30).
  (:init
    ;; diana availability (all 30-min start times except those that overlap her busy intervals)
    (free diana t09_00)
    (free diana t09_30)
    (free diana t10_00)
    (free diana t10_30)
    (free diana t11_00)
    (free diana t12_00)
    (free diana t12_30)
    (free diana t13_30)
    (free diana t14_00)
    (free diana t14_30)
    (free diana t15_00)
    (free diana t15_30)
    (free diana t16_00)
    (free diana t16_30)

    ;; ethan availability (fully available)
    (free ethan t09_00) (free ethan t09_30) (free ethan t10_00) (free ethan t10_30)
    (free ethan t11_00) (free ethan t11_30) (free ethan t12_00) (free ethan t12_30)
    (free ethan t13_00) (free ethan t13_30) (free ethan t14_00) (free ethan t14_30)
    (free ethan t15_00) (free ethan t15_30) (free ethan t16_00) (free ethan t16_30)

    ;; janet availability respecting her hard busy times and the preference to not meet after 12:00.
    ;; Allowed start times end no later than 12:00, so latest start is 11:30.
    (free janet t10_00)
    (free janet t10_30)
    (free janet t11_00)
    (free janet t11_30)
  )

  (:goal (meeting-scheduled))
)