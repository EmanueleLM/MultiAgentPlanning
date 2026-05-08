(define (problem meeting-scheduling-24)
    (:domain meeting-scheduler)
    (:objects
        nob-hill presidio - location
    )
    (:init
        (at nob-hill)
        (= (total-time) 0)
        (not (matthew-available))
        (not (meeting-started))
        (not (arrived-presidio-early))
        (not (met-matthew))
    )
    (:goal (met-matthew))

    (:metric minimize (total-time))
)