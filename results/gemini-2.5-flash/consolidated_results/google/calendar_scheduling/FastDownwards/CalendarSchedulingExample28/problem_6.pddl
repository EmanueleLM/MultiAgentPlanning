(define (problem scheduling-28)
    (:domain calendar-scheduling-28)
    (:objects
        brittany emily doris - person
        t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - time
    )
    (:init
        (= (total-cost) 0)

        ; Brittany Availability (Unavailable t9 (13:00), t15 (16:00))
        (available brittany t1) (available brittany t2) (available brittany t3)
        (available brittany t4) (available brittany t5) (available brittany t6)
        (available brittany t7) (available brittany t8)
        (available brittany t10) (available brittany t11) (available brittany t12)
        (available brittany t13) (available brittany t14)
        (available brittany t16)

        ; Emily Availability (Available t1-t16)
        (available emily t1) (available emily t2) (available emily t3)
        (available emily t4) (available emily t5) (available emily t6)
        (available emily t7) (available emily t8) (available emily t9)
        (available emily t10) (available emily t11) (available emily t12)
        (available emily t13) (available emily t14) (available emily t15)
        (available emily t16)

        ; Doris Availability (Available t5 (11:00), t12 (14:30))
        (available doris t5)
        (available doris t12)
    )
    (:goal
        (meeting-scheduled)
    )
    (:metric minimize (total-cost))
)