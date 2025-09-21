(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Slots t0..t15 map to 30-minute start times from 09:00 to 16:30:
  ;; t0=09:00, t1=09:30, t2=10:00, t3=10:30, t4=11:00, t5=11:30,
  ;; t6=12:00, t7=12:30, t8=13:00, t9=13:30, t10=14:00, t11=14:30,
  ;; t12=15:00, t13=15:30, t14=16:00, t15=16:30

  (:objects
    amy jonathan brittany matthew catherine carl - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - slot
  )

  (:init
    ;; Combined availability derived by reconciling each participant's provided constraints.
    ;; We assert free(...) only where every participant's local information allows that slot.
    ;; (Each participant was modeled by their own agent; here initial facts combine those constraints.)

    ;; Amy: free at all slots except t8 (13:00) and t13 (15:30).
    (free amy t0) (free amy t1) (free amy t2) (free amy t3)
    (free amy t4) (free amy t5) (free amy t6) (free amy t7)
    (free amy t9) (free amy t10) (free amy t11) (free amy t12)
    (free amy t14) (free amy t15)

    ;; Jonathan: busy at t0 (09:00), t2 (10:00), t5 (11:30), t7 (12:30).
    ;; So free at the remaining slots:
    (free jonathan t1) (free jonathan t3) (free jonathan t4)
    (free jonathan t6) (free jonathan t8) (free jonathan t9)
    (free jonathan t10) (free jonathan t11) (free jonathan t12)
    (free jonathan t13) (free jonathan t14) (free jonathan t15)

    ;; Brittany: busy at t1 (09:30) and t15 (16:30).
    (free brittany t0) (free brittany t2) (free brittany t3)
    (free brittany t4) (free brittany t5) (free brittany t6)
    (free brittany t7) (free brittany t8) (free brittany t9)
    (free brittany t10) (free brittany t11) (free brittany t12)
    (free brittany t13) (free brittany t14)

    ;; Matthew: busy at t0,t1,t7,t8,t9,t10,t12,t14 (per his local data).
    ;; So free at:
    (free matthew t2) (free matthew t3) (free matthew t4)
    (free matthew t5) (free matthew t6) (free matthew t11)
    (free matthew t13) (free matthew t15)

    ;; Catherine: busy at t0,t1,t2,t6,t7,t8,t9,t15 (per her local data).
    ;; So free at:
    (free catherine t3) (free catherine t4) (free catherine t5)
    (free catherine t10) (free catherine t11) (free catherine t12)
    (free catherine t13) (free catherine t14)

    ;; Carl: busy at t2,t3,t5,t6,t8,t9,t11,t12,t13,t14 (per his local data).
    ;; So free at:
    (free carl t0) (free carl t1) (free carl t4)
    (free carl t7) (free carl t10) (free carl t15)
  )

  ;; Goal: schedule the meeting once (any of the schedule-* actions will achieve this).
  (:goal (meeting-scheduled))
)