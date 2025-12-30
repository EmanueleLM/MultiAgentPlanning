(define (problem meeting-scheduling-24)
    (:domain meeting-scheduler)
    (:objects
        nob-hill presidio - location
    )
    (:init
        (at nob-hill)
        (not (traveled-to-presidio))
        (not (matthew-available))
        (not (meeting-started))
        (not (met-matthew))
    )
    (:goal (met-matthew))
)