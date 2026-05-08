(define (problem calendar_scheduling_21)
    (:domain calendar_scheduling)
    (:objects
        bobby scott kimberly - person
        the_meeting - meeting
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time_slot
    )
    (:init
        ;; Time slot ordering (30-minute intervals from 9:00 to 17:00)
        ;; t0 = 9:00-9:30, t1 = 9:30-10:00, ..., t15 = 16:30-17:00
        (next_slot t0 t1)
        (next_slot t1 t2)
        (next_slot t2 t3)
        (next_slot t3 t4)
        (next_slot t4 t5)
        (next_slot t5 t6)
        (next_slot t6 t7)
        (next_slot t7 t8)
        (next_slot t8 t9)
        (next_slot t9 t10)
        (next_slot t10 t11)
        (next_slot t11 t12)
        (next_slot t12 t13)
        (next_slot t13 t14)
        (next_slot t14 t15)

        ;; Bobby's schedule: wide open the entire day (9:00 to 17:00)
        (is_available bobby t0) (is_available bobby t1) (is_available bobby t2) (is_available bobby t3)
        (is_available bobby t4) (is_available bobby t5) (is_available bobby t6) (is_available bobby t7)
        (is_available bobby t8) (is_available bobby t9) (is_available bobby t10) (is_available bobby t11)
        (is_available bobby t12) (is_available bobby t13) (is_available bobby t14) (is_available bobby t15)

        ;; Scott's schedule:
        ;; Busy 11:30 to 12:00 (t5)
        ;; Busy 15:30 to 16:00 (t13)
        (is_available scott t0) (is_available scott t1) (is_available scott t2) (is_available scott t3)
        (is_available scott t4)
        ; t5 (11:30-12:00) is busy for scott - omitted from is_available
        (is_available scott t6) (is_available scott t7) (is_available scott t8) (is_available scott t9)
        (is_available scott t10) (is_available scott t11) (is_available scott t12)
        ; t13 (15:30-16:00) is busy for scott - omitted from is_available
        (is_available scott t14) (is_available scott t15)

        ;; Kimberly's schedule:
        ;; Busy 11:00 to 12:00 (t4, t5)
        ;; Busy 12:30 to 13:00 (t7)
        ;; Busy 13:30 to 14:00 (t9)
        ;; Busy 14:30 to 15:00 (t11)
        ;; Busy 15:30 to 17:00 (t13, t14, t15)
        (is_available kimberly t0) (is_available kimberly t1) (is_available kimberly t2) (is_available kimberly t3)
        ; t4 (11:00-11:30) is busy for kimberly - omitted from is_available
        ; t5 (11:30-12:00) is busy for kimberly - omitted from is_available
        (is_available kimberly t6)
        ; t7 (12:30-13:00) is busy for kimberly - omitted from is_available
        (is_available kimberly t8)
        ; t9 (13:30-14:00) is busy for kimberly - omitted from is_available
        (is_available kimberly t10)
        ; t11 (14:30-15:00) is busy for kimberly - omitted from is_available
        (is_available kimberly t12)
        ; t13 (15:30-16:00) is busy for kimberly - omitted from is_available
        ; t14 (16:00-16:30) is busy for kimberly - omitted from is_available
        ; t15 (16:30-17:00) is busy for kimberly - omitted from is_available
    )
    (:goal (exists (?s - time_slot) (meeting_scheduled the_meeting ?s)))
)