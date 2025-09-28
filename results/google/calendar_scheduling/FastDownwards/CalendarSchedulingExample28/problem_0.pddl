(define (problem schedule-30min-monday)
  (:domain meeting-domain)

  ; Timeslot naming convention:
  ; t1  = 09:00-09:30
  ; t2  = 09:30-10:00
  ; t3  = 10:00-10:30
  ; t4  = 10:30-11:00
  ; t5  = 11:00-11:30
  ; t6  = 11:30-12:00
  ; t7  = 12:00-12:30
  ; t8  = 12:30-13:00
  ; t9  = 13:00-13:30
  ; t10 = 13:30-14:00
  ; t11 = 14:00-14:30
  ; t12 = 14:30-15:00
  ; t13 = 15:00-15:30
  ; t14 = 15:30-16:00
  ; t15 = 16:00-16:30
  ; t16 = 16:30-17:00

  (:objects
    jesse nancy isabella harold linda - person
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - timeslot
  )

  (:init
    ; Jesse busy: 10:00-10:30 (t3), 15:00-15:30 (t13)
    (busy jesse t3)
    (busy jesse t13)

    ; Nancy busy: 09:00-09:30 (t1), 10:30-11:00 (t4), 13:30-14:00 (t10), 14:30-15:00 (t12)
    (busy nancy t1)
    (busy nancy t4)
    (busy nancy t10)
    (busy nancy t12)

    ; Isabella busy: 09:00-10:00 (t1,t2), 11:30-12:00 (t6), 15:30-16:00 (t14)
    (busy isabella t1)
    (busy isabella t2)
    (busy isabella t6)
    (busy isabella t14)

    ; Harold busy: 09:00-10:00 (t1,t2), 10:30-16:30 (t4..t15)
    (busy harold t1)
    (busy harold t2)
    (busy harold t4)
    (busy harold t5)
    (busy harold t6)
    (busy harold t7)
    (busy harold t8)
    (busy harold t9)
    (busy harold t10)
    (busy harold t11)
    (busy harold t12)
    (busy harold t13)
    (busy harold t14)
    (busy harold t15)

    ; Linda busy: 09:00-10:00 (t1,t2), 12:00-12:30 (t7), 13:30-16:00 (t10,t11,t12,t13,t14)
    (busy linda t1)
    (busy linda t2)
    (busy linda t7)
    (busy linda t10)
    (busy linda t11)
    (busy linda t12)
    (busy linda t13)
    (busy linda t14)
  )

  ; Hard constraint: prefer earliest feasible meeting time -> encoded as required goal timeslot.
  ; Given the participants' unavailable slots above, the earliest common 30-minute slot is t16 (16:30-17:00).
  (:goal (and
    (meeting-scheduled)
    (scheduled-at t16)
  ))
)