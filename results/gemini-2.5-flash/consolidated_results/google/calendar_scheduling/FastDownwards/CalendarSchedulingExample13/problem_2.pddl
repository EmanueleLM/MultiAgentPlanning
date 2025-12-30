(define (problem calendar_scheduling_p13)
    (:domain scheduling_c13)
    
    (:init
        (= (total-cost) 0)

        ; --- Non-Preferred Slots (t < 13:00 / t0 to t7) ---
        (non-preferred t0) (non-preferred t1) (non-preferred t2) (non-preferred t3) 
        (non-preferred t4) (non-preferred t5) (non-preferred t6) (non-preferred t7)

        ; --- Gerald Availability (Available: 9:30-13:00, 14:00-15:00, 15:30-16:00) ---
        (available gerald t1) (available gerald t2) (available gerald t3) (available gerald t4) 
        (available gerald t5) (available gerald t6) (available gerald t7) 
        (available gerald t10) (available gerald t11)
        (available gerald t13)

        ; --- Roy Availability (All Day) ---
        (available roy t0) (available roy t1) (available roy t2) (available roy t3) 
        (available roy t4) (available roy t5) (available roy t6) (available roy t7) 
        (available roy t8) (available roy t9) (available roy t10) (available roy t11) 
        (available roy t12) (available roy t13) (available roy t14) (available roy t15)

        ; --- Barbara Availability (Available: 9:00-9:30, 10:00-11:30, 14:00-14:30, 15:00-15:30) ---
        (available barbara t0) 
        (available barbara t2) (available barbara t3) (available barbara t4) 
        (available barbara t10) 
        (available barbara t12)
    )

    (:goal (meeting-found))

    (:metric minimize (total-cost))
)