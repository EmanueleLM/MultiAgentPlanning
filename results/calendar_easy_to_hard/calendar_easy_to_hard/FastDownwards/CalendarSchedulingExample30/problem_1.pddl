(define (problem CalendarSchedulingExample30)
  (:domain calendar-scheduling)
  (:objects
    eric jeremy joe brian brittany julia - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - timeslot
  )
  (:init
    ;; Eric free (busy t2, t7)
    (free eric t0) (free eric t1) (free eric t3) (free eric t4) (free eric t5) (free eric t6)
    (free eric t8) (free eric t9) (free eric t10) (free eric t11) (free eric t12) (free eric t13)
    (free eric t14) (free eric t15)

    ;; Jeremy free (busy t4,t5,t7,t12)
    (free jeremy t0) (free jeremy t1) (free jeremy t2) (free jeremy t3) (free jeremy t6)
    (free jeremy t8) (free jeremy t9) (free jeremy t10) (free jeremy t11) (free jeremy t13)
    (free jeremy t14) (free jeremy t15)

    ;; Joe free entire day
    (free joe t0) (free joe t1) (free joe t2) (free joe t3) (free joe t4) (free joe t5)
    (free joe t6) (free joe t7) (free joe t8) (free joe t9) (free joe t10) (free joe t11)
    (free joe t12) (free joe t13) (free joe t14) (free joe t15)

    ;; Brian free (only t3, t8, t10, t14)
    (free brian t3) (free brian t8) (free brian t10) (free brian t14)

    ;; Brittany free (busy t0,t3,t4,t5,t9,t10,t12,t15)
    (free brittany t1) (free brittany t2) (free brittany t6) (free brittany t7)
    (free brittany t8) (free brittany t11) (free brittany t13) (free brittany t14)

    ;; Julia free (busy t0,t1,t2,t3,t7,t9,t10,t11,t14,t15)
    (free julia t4) (free julia t5) (free julia t6) (free julia t8) (free julia t12) (free julia t13)
  )
  (:goal (scheduled))
)