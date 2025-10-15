(define (problem meeting-monday)
  (:domain schedule-meeting)
  (:objects
    nicholas emma catherine steven adam lori - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )

  ;; Discrete 30-minute slots:
  ;; t0 = 09:00, t1 = 09:30, t2 = 10:00, t3 = 10:30, t4 = 11:00, t5 = 11:30,
  ;; t6 = 12:00, t7 = 12:30, t8 = 13:00, t9 = 13:30, t10 = 14:00, t11 = 14:30,
  ;; t12 = 15:00, t13 = 15:30, t14 = 16:00, t15 = 16:30

  (:init
    ;; Nicholas: free entire workday 09:00-17:00 (t0..t15)
    (free nicholas t0) (free nicholas t1) (free nicholas t2) (free nicholas t3)
    (free nicholas t4) (free nicholas t5) (free nicholas t6) (free nicholas t7)
    (free nicholas t8) (free nicholas t9) (free nicholas t10) (free nicholas t11)
    (free nicholas t12) (free nicholas t13) (free nicholas t14) (free nicholas t15)

    ;; Emma: free entire workday t0..t15
    (free emma t0) (free emma t1) (free emma t2) (free emma t3)
    (free emma t4) (free emma t5) (free emma t6) (free emma t7)
    (free emma t8) (free emma t9) (free emma t10) (free emma t11)
    (free emma t12) (free emma t13) (free emma t14) (free emma t15)

    ;; Catherine busy: t0 (09:00), t5 (11:30), t9 (13:30), t13 (15:30)
    ;; So Catherine free at all other slots:
    (free catherine t1) (free catherine t2) (free catherine t3) (free catherine t4)
    (free catherine t6) (free catherine t7) (free catherine t8)
    (free catherine t10) (free catherine t11) (free catherine t12)
    (free catherine t14) (free catherine t15)

    ;; Steven busy: t0 (09:00) and 10:00-16:30 -> busy t2..t14 (end-exclusive),
    ;; so Steven free at t1 (09:30) and t15 (16:30)
    (free steven t1) (free steven t15)

    ;; Adam busy: 09:00-10:00 -> t0,t1; 10:30-13:00 -> t3..t7;
    ;; 13:30-14:00 -> t9; 14:30-16:30 -> t11..t14 (end-exclusive on last endpoint)
    ;; Adam free at t2 (10:00), t8 (13:00), t10 (14:00), t15 (16:30)
    (free adam t2) (free adam t8) (free adam t10) (free adam t15)

    ;; Lori busy: 09:00-11:30 -> t0..t4; 12:30-13:30 -> t7,t8; 16:00-16:30 -> t14
    ;; Lori free at t5,t6,t9,t10,t11,t12,t13,t15
    (free lori t5) (free lori t6) (free lori t9) (free lori t10)
    (free lori t11) (free lori t12) (free lori t13) (free lori t15)

    ;; To enforce selection of the earliest feasible common slot we inferred (t15 = 16:30)
    ;; we mark only that slot as allowed. The model uses discrete 30-min slots and meeting
    ;; duration 30 minutes is one slot.
    (allowed t15)
  )

  (:goal (meeting-scheduled))
)