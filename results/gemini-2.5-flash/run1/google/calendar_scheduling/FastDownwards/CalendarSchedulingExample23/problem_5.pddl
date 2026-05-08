(define (problem calendar-scheduling-example23-problem)
    (:domain calendar-scheduling-example23)
    (:objects
        billy maria william - person
        t900 t930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 - time-slot
    )
    (:init
        (= (total-cost) 0)

        ; Define slot order for cost minimization (earlier slots have lower cost)
        (= (slot-order t900) 1)
        (= (slot-order t930) 2)
        (= (slot-order t1000) 3)
        (= (slot-order t1030) 4)
        (= (slot-order t1100) 5)
        (= (slot-order t1130) 6)
        (= (slot-order t1200) 7)
        (= (slot-order t1230) 8)
        (= (slot-order t1300) 9)
        (= (slot-order t1330) 10)
        (= (slot-order t1400) 11)
        (= (slot-order t1430) 12)
        (= (slot-order t1500) 13)
        (= (slot-order t1530) 14)
        (= (slot-order t1600) 15)

        ; Billy's calculated available 1-hour start times: ['9:00', '9:30', '10:00', '10:30', '12:00', '15:00']
        (is-available billy t900)
        (is-available billy t930)
        (is-available billy t1000)
        (is-available billy t1030)
        (is-available billy t1200)
        (is-available billy t1500)

        ; Maria's calculated available 1-hour start times: ['10:30', '11:00', '11:30', '12:00', '14:30', '15:00', '15:30', '16:00']
        (is-available maria t1030)
        (is-available maria t1100)
        (is-available maria t1130)
        (is-available maria t1200)
        (is-available maria t1430)
        (is-available maria t1500)
        (is-available maria t1530)
        (is-available maria t1600)

        ; William's calculated available 1-hour start times: ['10:00', '10:30', '11:00', '12:30']
        (is-available william t1000)
        (is-available william t1030)
        (is-available william t1100)
        (is-available william t1230)
    )
    (:goal (exists (?s - time-slot) (meeting-scheduled ?s)))
    (:metric minimize (total-cost))
)