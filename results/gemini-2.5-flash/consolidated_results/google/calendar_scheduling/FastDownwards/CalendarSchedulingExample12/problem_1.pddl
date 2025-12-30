(define (problem calendar-scheduling-12)
    (:domain calendar-scheduling)
    (:objects
        T900 T930 T1000 T1030 T1100 T1130 T1200 T1230 
        T1300 T1330 T1400 T1430 T1500 T1530 T1600 - time_slot
    )
    (:init
        ;; David (Available 9:00 - 17:00)
        (available_david T900) (available_david T930) 
        (available_david T1000) (available_david T1030) 
        (available_david T1100) (available_david T1130) 
        (available_david T1200) (available_david T1230) 
        (available_david T1300) (available_david T1330) 
        (available_david T1400) (available_david T1430) 
        (available_david T1500) (available_david T1530) 
        (available_david T1600) 

        ;; Debra (Available: 10:00, 13:00, 14:30, 15:00)
        (available_debra T1000)
        (available_debra T1300)
        (available_debra T1430)
        (available_debra T1500)

        ;; Kevin (Available: 12:00, 12:30, 13:00)
        (available_kevin T1200)
        (available_kevin T1230)
        (available_kevin T1300)
    )
    (:goal (meeting_scheduled))
)