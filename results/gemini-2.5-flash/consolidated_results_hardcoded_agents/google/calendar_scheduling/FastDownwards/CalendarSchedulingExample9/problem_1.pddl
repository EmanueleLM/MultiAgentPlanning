(define (problem calendar-scheduling-9)
    (:domain calendar-scheduling)
    (:objects
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - time_point 
    )

    (:init
        (= (total-cost) 0)
        
        ;; Diane's availability (A: S1, S2, S3, S4, S5, S7, S8, S9, S10, S13, S14, S15)
        (is_available diane t1)
        (is_available diane t2)
        (is_available diane t3)
        (is_available diane t4)
        (is_available diane t5)
        (is_available diane t7)
        (is_available diane t8)
        (is_available diane t9)
        (is_available diane t10)
        (is_available diane t13)
        (is_available diane t14)
        (is_available diane t15)

        ;; Kelly's availability (A: S0, S2, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15)
        (is_available kelly t0)
        (is_available kelly t2)
        (is_available kelly t4)
        (is_available kelly t5)
        (is_available kelly t6)
        (is_available kelly t7)
        (is_available kelly t8)
        (is_available kelly t9)
        (is_available kelly t10)
        (is_available kelly t11)
        (is_available kelly t12)
        (is_available kelly t13)
        (is_available kelly t14)
        (is_available kelly t15)

        ;; Deborah's availability (A: S1, S10)
        (is_available deborah t1)
        (is_available deborah t10)
    )

    (:goal (and
        (first_slot_found)
    ))

    (:metric minimize (total-cost))
)