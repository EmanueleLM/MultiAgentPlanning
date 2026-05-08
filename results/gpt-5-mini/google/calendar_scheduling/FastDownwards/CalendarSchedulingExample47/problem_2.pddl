(define (problem schedule_monday_meeting)
  (:domain jack_of_all_trades)
  (:objects
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - slot
  )
  (:init
    ; consecutive half-hour slots from 9:00 to 17:00 (t1 = 9:00-9:30, t16 = 16:30-17:00)
    (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5) (next t5 t6)
    (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10) (next t10 t11)
    (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16)

    ; existing busy slots from the problem statement
    ; Eric: 9:00-9:30 (t1), 10:30-11:30 (t4,t5), 15:00-15:30 (t13)
    (busy eric t1) (busy eric t4) (busy eric t5) (busy eric t13)

    ; Roger: 9:30-10:30 (t2,t3), 11:00-12:00 (t5,t6), 12:30-13:00 (t8),
    ;        14:30-15:00 (t12), 15:30-16:30 (t14,t15)
    (busy roger t2) (busy roger t3) (busy roger t5) (busy roger t6)
    (busy roger t8) (busy roger t12) (busy roger t14) (busy roger t15)
  )
  (:goal (meeting_scheduled))
)