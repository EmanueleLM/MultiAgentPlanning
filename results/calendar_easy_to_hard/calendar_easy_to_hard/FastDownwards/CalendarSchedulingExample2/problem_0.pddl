(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    roy kathryn amy - agent
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot
  )

  (:init
    ;; Roy's private hard constraints (unavailable slots: 9:00, 10:00, 11:00, 12:30)
    ;; Therefore Roy is available at all other work half-hour slots
    (available roy t9_30)  (available roy t10_30) (available roy t11_30)
    (available roy t12_00) (available roy t13_00)  (available roy t13_30)
    (available roy t14_00) (available roy t14_30)  (available roy t15_00)
    (available roy t15_30) (available roy t16_00)  (available roy t16_30)

    ;; Kathryn's private hard constraints (unavailable: 9:30, 16:30)
    ;; So Kathryn is available at other slots within work hours
    (available kathryn t9_00) (available kathryn t10_00) (available kathryn t10_30)
    (available kathryn t11_00) (available kathryn t11_30) (available kathryn t12_00)
    (available kathryn t12_30) (available kathryn t13_00) (available kathryn t13_30)
    (available kathryn t14_00) (available kathryn t14_30) (available kathryn t15_00)
    (available kathryn t15_30) (available kathryn t16_00)

    ;; Amy's private hard constraints:
    ;; Unavailable intervals: 9:00-14:30, 15:00-16:00, 16:30-17:00
    ;; Preference "would prefer not to meet after 15:30" treated as hard constraint: disallow starts after 15:30.
    ;; Interpreting blocked intervals as [start, end) on slot start times, the only slot that remains available for Amy is 14:30.
    (available amy t14_30)
  )

  ;; Goal: schedule the meeting (any slot) that satisfies all agents' hard constraints.
  (:goal (meeting-scheduled))
)