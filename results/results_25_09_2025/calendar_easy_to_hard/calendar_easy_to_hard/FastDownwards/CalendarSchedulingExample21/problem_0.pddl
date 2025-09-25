(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling-multiagent)

  ;; Objects:
  ;; times t0 .. t15 correspond to 30-minute slots from 09:00 to 16:30
  ;; Note: meeting duration is 60 minutes = two consecutive 30-min slots.
  (:objects
    bobby scott kim - agent
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )

  (:init
    ;; Succession relation for 30-min quantization (09:00 -> 09:30 -> ... -> 16:30)
    (succ t0 t1)  (succ t1 t2)  (succ t2 t3)  (succ t3 t4)
    (succ t4 t5)  (succ t5 t6)  (succ t6 t7)  (succ t7 t8)
    (succ t8 t9)  (succ t9 t10) (succ t10 t11)(succ t11 t12)
    (succ t12 t13)(succ t13 t14)(succ t14 t15)

    ;; Bobby's availability: Bobby is available the entire day on Monday (all 30-min slots)
    (available bobby t0)  (available bobby t1)  (available bobby t2)  (available bobby t3)
    (available bobby t4)  (available bobby t5)  (available bobby t6)  (available bobby t7)
    (available bobby t8)  (available bobby t9)  (available bobby t10) (available bobby t11)
    (available bobby t12) (available bobby t13) (available bobby t14) (available bobby t15)

    ;; Scott's availability: Scott is busy 11:30-12:00 (t5) and 15:30-16:00 (t13)
    ;; So he is available in all slots except t5 and t13.
    (available scott t0)  (available scott t1)  (available scott t2)  (available scott t3)
    (available scott t4)                      (available scott t6)  (available scott t7)
    (available scott t8)  (available scott t9)  (available scott t10) (available scott t11)
    (available scott t12)                     (available scott t14) (available scott t15)

    ;; Kimberly's availability: busy intervals:
    ;; 11:00-12:00 -> t4 and t5
    ;; 12:30-13:00 -> t7
    ;; 13:30-14:00 -> t9
    ;; 14:30-15:00 -> t11
    ;; 15:30-17:00 -> t13, t14, t15
    ;; So available slots: t0,t1,t2,t3,t6,t8,t10,t12
    (available kimberly t0) (available kimberly t1) (available kimberly t2) (available kimberly t3)
    (available kimberly t6) (available kimberly t8) (available kimberly t10) (available kimberly t12)
  )

  ;; Goal: A meeting must be scheduled (meeting-scheduled becomes true).
  ;; The planner will choose a start time where all three agents reserved the same consecutive pair.
  (:goal (meeting-scheduled))
)