(define (problem meeting-planning-temporal-23)
    (:domain meeting-scheduler-classical)

    (:objects
    )

    (:init
        (at-location bayview) 
        (time-T540) ; Start time 9:00 AM (540 min)
        (= (total-cost) 0) ; Time passed since T=540
    )

    (:goal
        (john-met)
    )
)