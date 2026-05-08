(define (problem schedule_monday_meeting)
  (:domain jack_of_all_trades)
  (:objects
    david eric roger - person
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - slot
  )
  (:init
    (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5) (next t5 t6)
    (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10) (next t10 t11)
    (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16)

    (busy eric t1) (busy eric t4) (busy eric t5) (busy eric t13)

    (busy roger t2) (busy roger t3) (busy roger t5) (busy roger t6)
    (busy roger t8) (busy roger t12) (busy roger t14) (busy roger t15)
  )
  (:goal (meeting_scheduled))
)