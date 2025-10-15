(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    amy jonathan brittany matthew catherine carl - person
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - time
  )
  (:init
    ;; Amy available: 09:00-09:30 (t1),09:30-10:00 (t2),10:00-10:30 (t3),10:30-11:00 (t4),
    ;; 11:00-11:30 (t5),11:30-12:00 (t6),12:00-12:30 (t7),12:30-13:00 (t8),
    ;; 13:30-14:00 (t10),14:00-14:30 (t11),14:30-15:00 (t12),15:00-15:30 (t13),
    ;; 16:00-16:30 (t15),16:30-17:00 (t16)
    (available amy t1) (available amy t2) (available amy t3) (available amy t4)
    (available amy t5) (available amy t6) (available amy t7) (available amy t8)
    (available amy t10) (available amy t11) (available amy t12) (available amy t13)
    (available amy t15) (available amy t16)

    ;; Jonathan available: t2,t4,t5,t7,t9,t10,t11,t12,t13,t14,t15,t16
    (available jonathan t2) (available jonathan t4) (available jonathan t5) (available jonathan t7)
    (available jonathan t9) (available jonathan t10) (available jonathan t11) (available jonathan t12)
    (available jonathan t13) (available jonathan t14) (available jonathan t15) (available jonathan t16)

    ;; Brittany available: t1,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15
    (available brittany t1) (available brittany t3) (available brittany t4) (available brittany t5)
    (available brittany t6) (available brittany t7) (available brittany t8) (available brittany t9)
    (available brittany t10) (available brittany t11) (available brittany t12) (available brittany t13)
    (available brittany t14) (available brittany t15)

    ;; Matthew available: t3,t4,t5,t6,t7,t12,t14,t16
    (available matthew t3) (available matthew t4) (available matthew t5) (available matthew t6)
    (available matthew t7) (available matthew t12) (available matthew t14) (available matthew t16)

    ;; Catherine available: t4,t5,t6,t11,t12,t13,t14,t15
    (available catherine t4) (available catherine t5) (available catherine t6) (available catherine t11)
    (available catherine t12) (available catherine t13) (available catherine t14) (available catherine t15)

    ;; Carl available: t1,t2,t5,t8,t11,t16
    (available carl t1) (available carl t2) (available carl t5) (available carl t8) (available carl t11) (available carl t16)
  )
  (:goal (meeting-scheduled))
)