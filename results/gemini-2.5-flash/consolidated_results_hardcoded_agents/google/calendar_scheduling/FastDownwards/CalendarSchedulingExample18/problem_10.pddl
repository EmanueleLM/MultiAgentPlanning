(define (problem calendar-scheduling-18-problem)
    (:domain calendar-scheduling-18)
    (:objects
        T8 T9 - preferred-slot ; T8 (12:30-13:00), T9 (13:00-13:30)
        T15 - penalized-slot  ; T15 (16:00-16:30)
    )
    (:init
        (= (total-cost) 0)
    )
    (:goal (chosen-yet))
    (:metric minimize (total-cost))
)