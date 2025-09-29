(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    nicole christine anna terry julie abigail - person
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - slot
  )
  (:init
    ; Nicole free slots (busy: 10:00-10:30 -> t3; 14:30-15:00 -> t12)
    (free nicole t1) (free nicole t2) (free nicole t4) (free nicole t5)
    (free nicole t6) (free nicole t7) (free nicole t8) (free nicole t9)
    (free nicole t10) (free nicole t11) (free nicole t13) (free nicole t14)
    (free nicole t15) (free nicole t16)

    ; Christine free slots (busy: 11:00-11:30 -> t5; 12:30-13:00 -> t8)
    (free christine t1) (free christine t2) (free christine t3) (free christine t4)
    (free christine t6) (free christine t7) (free christine t9) (free christine t10)
    (free christine t11) (free christine t12) (free christine t13) (free christine t14)
    (free christine t15) (free christine t16)

    ; Anna free slots (busy: 09:30-10:30 -> t2,t3; 11:00-11:30 -> t5; 12:30-13:00 -> t8; 15:30-16:00 -> t14; 16:30-17:00 -> t16)
    ; Preference "would rather not meet before 14:00" treated as hard constraint => Anna only allows >= t11.
    (free anna t11) (free anna t13) (free anna t15)

    ; Terry free slots (busy: 09:30-11:30 -> t2,t3,t4,t5; 13:00-13:30 -> t9; 14:00-15:30 -> t11,t12,t13)
    (free terry t1) (free terry t6) (free terry t7) (free terry t8)
    (free terry t10) (free terry t14) (free terry t15) (free terry t16)

    ; Julie free slots (busy: 10:00-12:00 -> t3,t4,t5,t6; 12:30-13:30 -> t8,t9; 14:00-15:00 -> t11,t12)
    (free julie t1) (free julie t2) (free julie t7) (free julie t10)
    (free julie t13) (free julie t14) (free julie t15) (free julie t16)

    ; Abigail free slots (busy: 09:00-10:00 -> t1,t2; 11:30-12:00 -> t6; 12:30-14:00 -> t8,t9,t10; 14:30-15:00 -> t12; 16:30-17:00 -> t16)
    (free abigail t3) (free abigail t4) (free abigail t5) (free abigail t7)
    (free abigail t11) (free abigail t13) (free abigail t14) (free abigail t15)

    ; Feasible slots are those that are free for all participants AND respect Anna's hard preference.
    ; Intersection computed from the above availabilities yields a single feasible slot: t15 (16:00-16:30).
    (feasible t15)
  )
  (:goal (meeting-scheduled))
)