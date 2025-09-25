(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    roy kathryn amy - agent
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot
  )

  (:init
    ;; Roy's availability on Monday (worked out from Roy's private blocks):
    ;; Roy is blocked at 9:00, 10:00, 11:00, 12:30
    (available roy t9_30)
    (available roy t10_30)
    (available roy t11_30)
    (available roy t12_00)
    (available roy t13_00)
    (available roy t13_30)
    (available roy t14_00)
    (available roy t14_30)
    (available roy t15_00)
    (available roy t15_30)
    (available roy t16_00)
    (available roy t16_30)

    ;; Kathryn's availability on Monday (blocked at 9:30 and 16:30)
    (available kathryn t9_00)
    (available kathryn t10_00)
    (available kathryn t10_30)
    (available kathryn t11_00)
    (available kathryn t11_30)
    (available kathryn t12_00)
    (available kathryn t12_30)
    (available kathryn t13_00)
    (available kathryn t13_30)
    (available kathryn t14_00)
    (available kathryn t14_30)
    (available kathryn t15_00)
    (available kathryn t15_30)
    (available kathryn t16_00)

    ;; Amy's availability on Monday (blocked 9:00-14:30, 15:00-16:00, 16:30-17:00).
    ;; From that, Amy is available at 14:30-15:00 and at 16:00-16:30.
    ;; Amy prefers not to meet after 15:30 (preference noted in commentary, not encoded here).
    (available amy t14_30)
    (available amy t16_00)
  )

  ;; Goal: schedule a half-hour meeting on Monday.
  ;; Based on the agents' availabilities and Amy's stated preference (prefer not after 15:30),
  ;; t14_30 (14:30-15:00) is a common available slot before 15:30. We set the goal
  ;; to have the meeting scheduled at t14_30.
  (:goal (meeting-scheduled t14_30))
)