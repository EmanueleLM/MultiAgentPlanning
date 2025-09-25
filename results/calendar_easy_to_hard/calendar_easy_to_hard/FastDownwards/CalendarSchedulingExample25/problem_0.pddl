(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)

  (:objects
    anthony pamela zachary - agent

    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )

  (:init
    ;; time successor relations (half-hour granularity)
    (succ t09_00 t09_30) (succ t09_30 t10_00) (succ t10_00 t10_30) (succ t10_30 t11_00)
    (succ t11_00 t11_30) (succ t11_30 t12_00) (succ t12_00 t12_30) (succ t12_30 t13_00)
    (succ t13_00 t13_30) (succ t13_30 t14_00) (succ t14_00 t14_30) (succ t14_30 t15_00)
    (succ t15_00 t15_30) (succ t15_30 t16_00) (succ t16_00 t16_30)

    ;; initial scheduling flag
    (unscheduled)

    ;; Pamela's preference: no meetings starting after 13:30 (so meeting must start at or before 13:30).
    ;; We encode allowed start times for Pamela as pamela-accepts-start on times <= 13:30.
    (pamela-accepts-start t09_00) (pamela-accepts-start t09_30) (pamela-accepts-start t10_00)
    (pamela-accepts-start t10_30) (pamela-accepts-start t11_00) (pamela-accepts-start t11_30)
    (pamela-accepts-start t12_00) (pamela-accepts-start t12_30) (pamela-accepts-start t13_00)
    (pamela-accepts-start t13_30)

    ;; Free slots for each agent (only those slots not privately busy).
    ;; Anthony busy: 09:30, 12:00-13:00 (12:00 & 12:30), 16:00
    ;; So anthony is free at all other half-hour slots:
    (free anthony t09_00) (free anthony t10_00) (free anthony t10_30)
    (free anthony t11_00) (free anthony t11_30)
    (free anthony t13_00) (free anthony t13_30) (free anthony t14_00)
    (free anthony t14_30) (free anthony t15_00) (free anthony t15_30) (free anthony t16_30)

    ;; Pamela busy: 09:30, 16:30
    ;; Pamela free at other times (but starts constrained via pamela-accepts-start)
    (free pamela t09_00) (free pamela t10_00) (free pamela t10_30) (free pamela t11_00)
    (free pamela t11_30) (free pamela t12_00) (free pamela t12_30) (free pamela t13_00)
    (free pamela t13_30) (free pamela t14_00) (free pamela t14_30) (free pamela t15_00)
    (free pamela t15_30) (free pamela t16_00)

    ;; Zachary busy: 09:00-11:30 (t09_00,t09_30,t10_00,t10_30,t11_00,t11_30),
    ;; 12:00-12:30 (t12_00),
    ;; 13:00-13:30 (t13_00),
    ;; 14:30-15:00 (t14_30),
    ;; 16:00-17:00 (t16_00,t16_30)
    ;; So zachary is free at the remaining slots:
    (free zachary t12_30) (free zachary t13_30)
    (free zachary t14_00) (free zachary t15_00) (free zachary t15_30)
  )

  (:goal (meeting-scheduled))
)