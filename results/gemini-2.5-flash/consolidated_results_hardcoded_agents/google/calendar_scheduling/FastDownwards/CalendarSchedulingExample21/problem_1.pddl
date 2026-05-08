(define (problem CalendarSchedulingExample21)
    (:domain scheduling_meeting)
    (:objects
        bobby scott kimberly - participant
        t00 t01 t02 t03 t04 t05 t06 t07 t08 t09 t10 t11 t12 t13 t14 t15 t16 - time_point
    )

    (:init
        ;; Time progression (30 minute slots)
        (next_slot t00 t01) (next_slot t01 t02) (next_slot t02 t03) (next_slot t03 t04) 
        (next_slot t04 t05) (next_slot t05 t06) (next_slot t06 t07) (next_slot t07 t08) 
        (next_slot t08 t09) (next_slot t09 t10) (next_slot t10 t11) (next_slot t11 t12) 
        (next_slot t12 t13) (next_slot t13 t14) (next_slot t14 t15) (next_slot t15 t16) 

        (not (meeting_scheduled))

        ;; --- Participant Availability ---
        
        ; 1. Bobby: Free 9:00 to 17:00 (T00 through T15)
        (available bobby t00) (available bobby t01) (available bobby t02) (available bobby t03) 
        (available bobby t04) (available bobby t05) (available bobby t06) (available bobby t07) 
        (available bobby t08) (available bobby t09) (available bobby t10) (available bobby t11) 
        (available bobby t12) (available bobby t13) (available bobby t14) (available bobby t15)

        ; 2. Scott: Busy 11:30-12:00 (T05), 15:30-16:00 (T13).
        (available scott t00) (available scott t01) (available scott t02) (available scott t03) 
        (available scott t04) 
        ; t05 busy
        (available scott t06) (available scott t07) (available scott t08) (available scott t09) 
        (available scott t10) (available scott t11) (available scott t12) 
        ; t13 busy
        (available scott t14) (available scott t15)

        ; 3. Kimberly: Busy 11:00-12:00 (T04, T05), 12:30-13:00 (T07), 13:30-14:00 (T09), 14:30-15:00 (T11), 15:30-17:00 (T13, T14, T15).
        (available kimberly t00) (available kimberly t01) (available kimberly t02) (available kimberly t03) 
        ; t04, t05 busy
        (available kimberly t06) 
        ; t07 busy
        (available kimberly t08) 
        ; t09 busy
        (available kimberly t10) 
        ; t11 busy
        (available kimberly t12) 
        ; t13, t14, t15 busy
    )

    (:goal (meeting_scheduled))
)