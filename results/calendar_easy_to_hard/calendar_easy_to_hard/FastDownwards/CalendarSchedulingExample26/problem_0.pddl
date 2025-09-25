(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    katherine nicole kevin - agent
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - slot
  )

  (:init
    ;; Successor relation for 30-minute consecutive slots between 09:00 and 17:00
    (succ t0 t1)   ;; 09:00-09:30 -> 09:30-10:00
    (succ t1 t2)   ;; 09:30-10:00 -> 10:00-10:30
    (succ t2 t3)   ;; 10:00-10:30 -> 10:30-11:00
    (succ t3 t4)   ;; 10:30-11:00 -> 11:00-11:30
    (succ t4 t5)   ;; 11:00-11:30 -> 11:30-12:00
    (succ t5 t6)   ;; 11:30-12:00 -> 12:00-12:30
    (succ t6 t7)   ;; 12:00-12:30 -> 12:30-13:00
    (succ t7 t8)   ;; 12:30-13:00 -> 13:00-13:30
    (succ t8 t9)   ;; 13:00-13:30 -> 13:30-14:00
    (succ t9 t10)  ;; 13:30-14:00 -> 14:00-14:30
    (succ t10 t11) ;; 14:00-14:30 -> 14:30-15:00
    (succ t11 t12) ;; 14:30-15:00 -> 15:00-15:30
    (succ t12 t13) ;; 15:00-15:30 -> 15:30-16:00
    (succ t13 t14) ;; 15:30-16:00 -> 16:00-16:30
    (succ t14 t15) ;; 16:00-16:30 -> 16:30-17:00

    ;; Public/shared info is encoded via the slot set above (09:00-17:00, 30-min slots)
    ;; Private availability for each agent encoded with (free <agent> <slot>)

    ;; Katherine: free all Monday 09:00-17:00 (all slots)
    (free katherine t0) (free katherine t1) (free katherine t2) (free katherine t3)
    (free katherine t4) (free katherine t5) (free katherine t6) (free katherine t7)
    (free katherine t8) (free katherine t9) (free katherine t10) (free katherine t11)
    (free katherine t12) (free katherine t13) (free katherine t14) (free katherine t15)

    ;; Nicole: free all Monday 09:00-17:00 (all slots)
    (free nicole t0) (free nicole t1) (free nicole t2) (free nicole t3)
    (free nicole t4) (free nicole t5) (free nicole t6) (free nicole t7)
    (free nicole t8) (free nicole t9) (free nicole t10) (free nicole t11)
    (free nicole t12) (free nicole t13) (free nicole t14) (free nicole t15)

    ;; Kevin: busy on several intervals. We encode free only for slots that are available.
    ;; Kevin busy: 09:00-10:00 (t0,t1), 10:30-11:30 (t3,t4), 12:00-15:30 (t6..t12), 16:30-17:00 (t15)
    ;; Therefore free slots for Kevin are t2 (10:00-10:30), t5 (11:30-12:00), t13 (15:30-16:00), t14 (16:00-16:30)
    (free kevin t2) (free kevin t5) (free kevin t13) (free kevin t14)
  )

  ;; Goal: schedule a 60-minute (two consecutive 30-min slots) meeting that fits everyone's calendar.
  ;; Given the combined availability, the only consecutive free pair for Kevin is t13 + t14 (15:30-16:30),
  ;; so the planner should arrive at meeting-scheduled t13 t14.
  (:goal (meeting-scheduled t13 t14))
)