(define (problem schedule_1h_meeting_monday)
  (:domain meeting_scheduling)

  (:objects
    anthony pamela zachary - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - timeslot
  )

  (:init
    ; successor (30-minute granularity) from 09:00 (t0) to 17:00 (t15)
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4)
    (succ t4 t5) (succ t5 t6) (succ t6 t7) (succ t7 t8)
    (succ t8 t9) (succ t9 t10) (succ t10 t11) (succ t11 t12)
    (succ t12 t13) (succ t13 t14) (succ t14 t15)

    (no_proposal_yet)

    ; Anthony busy: 09:30-10:00 (t1), 12:00-13:00 (t6,t7), 16:00-16:30 (t14)
    ; Available = all other slots
    (available anthony t0) (available anthony t2) (available anthony t3)
    (available anthony t4) (available anthony t5) (available anthony t8)
    (available anthony t9) (available anthony t10) (available anthony t11)
    (available anthony t12) (available anthony t13) (available anthony t15)

    ; Pamela busy: 09:30-10:00 (t1), 16:30-17:00 (t15)
    ; Preference: do not meet after 14:30 -> only slots up to t10 (14:00-14:30) allowed for meeting
    (available pamela t0) (available pamela t2) (available pamela t3)
    (available pamela t4) (available pamela t5) (available pamela t6)
    (available pamela t7) (available pamela t8) (available pamela t9)
    (available pamela t10)

    ; Zachary busy: 09:00-11:30 (t0..t4), 12:00-12:30 (t6), 13:00-13:30 (t8), 14:30-15:00 (t11), 16:00-17:00 (t14,t15)
    ; Available slots that can form contiguous 60-minute windows:
    (available zachary t5) (available zachary t7)
    (available zachary t9) (available zachary t10)
    (available zachary t12) (available zachary t13)
  )

  (:goal (and
    (meeting_scheduled)
    (attending anthony)
    (attending pamela)
    (attending zachary)
  ))
)