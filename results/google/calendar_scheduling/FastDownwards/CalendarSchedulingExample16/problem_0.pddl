(define (problem schedule-meeting)
  (:domain multiagent-scheduling)
  (:objects
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )

  (:init
    ;; Public information (encoded implicitly by the time objects & granularity)
    ;; Agent-specific availability based on private busy information provided
    ;; Scott: busy at 09:30,10:00,13:30,14:30,15:30,16:30 -> free at other work slots
    (scott_free t09_00)
    (scott_free t10_30)
    (scott_free t11_00)
    (scott_free t11_30)
    (scott_free t12_00)
    (scott_free t12_30)
    (scott_free t13_00)
    (scott_free t14_00)
    (scott_free t15_00)
    (scott_free t16_00)

    ;; Gabriel: "No meetings on Monday" -> free for all slots within work hours
    (gabriel_free t09_00) (gabriel_free t09_30) (gabriel_free t10_00) (gabriel_free t10_30)
    (gabriel_free t11_00) (gabriel_free t11_30) (gabriel_free t12_00) (gabriel_free t12_30)
    (gabriel_free t13_00) (gabriel_free t13_30) (gabriel_free t14_00) (gabriel_free t14_30)
    (gabriel_free t15_00) (gabriel_free t15_30) (gabriel_free t16_00) (gabriel_free t16_30)

    ;; Christine: busy at 09:00-10:00 (09:00,09:30), 10:30-12:30 (10:30,11:00,11:30,12:00),
    ;; 13:00-17:00 (13:00..16:30). From that, the remaining free slots within work hours are:
    ;; 10:00 and 12:30.
    (christine_free t10_00)
    (christine_free t12_30)

    ;; No meeting scheduled initially
    ;; (meeting_scheduled) is absent initially
  )

  ;; Goal: schedule a single 30-minute meeting (one time-slot) that works for all participants.
  ;; The plan should produce (meeting_scheduled) (and also (meeting_at ?t) for the chosen slot).
  (:goal (meeting_scheduled))
)