(define (problem meeting-planning-problem)
    (:domain meeting-planning)
    (:objects
        bayview golden-gate-park - location
    )
    (:init
        (at bayview)
        (= (total-cost) 0)
        (not (met_barbara))
        ; No (can-start-meeting-window) initially, it becomes true after travel
    )
    (:goal
        (and
            (met_barbara)
        )
    )
    (:metric minimize (total-cost))
)