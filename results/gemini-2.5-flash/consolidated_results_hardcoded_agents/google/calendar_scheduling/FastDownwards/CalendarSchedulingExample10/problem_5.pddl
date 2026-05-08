(define (problem schedule-meeting-10)
    (:domain calendar-scheduling)
    (:objects
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time-slot
    )

    (:init
        (= (total-cost) 0)

        ; --- Diana's availability (Busy: 11:30-12:00 (T5), 13:00-13:30 (T8)) ---
        (person-available diana t0) (person-available diana t1) (person-available diana t2)
        (person-available diana t3) (person-available diana t4)
        (person-available diana t6) (person-available diana t7)
        (person-available diana t9) (person-available diana t10) (person-available diana t11)
        (person-available diana t12) (person-available diana t13) (person-available diana t14) (person-available diana t15)

        ; --- Ethan's availability (All available) ---
        (person-available ethan t0) (person-available ethan t1) (person-available ethan t2)
        (person-available ethan t3) (person-available ethan t4) (person-available ethan t5)
        (person-available ethan t6) (person-available ethan t7) (person-available ethan t8)
        (person-available ethan t9) (person-available ethan t10) (person-available ethan t11)
        (person-available ethan t12) (person-available ethan t13) (person-available ethan t14) (person-available ethan t15)

        ; --- Janet's availability (Available: T2, T3, T4, T5, respecting busy times and preference not after 12:00) ---
        (person-available janet t2) (person-available janet t3) (person-available janet t4) (person-available janet t5)
    )

    (:goal (or
        (meeting-scheduled t2)
        (meeting-scheduled t3)
        (meeting-scheduled t4)
        (meeting-scheduled t5)
    ))

    (:metric minimize (total-cost))