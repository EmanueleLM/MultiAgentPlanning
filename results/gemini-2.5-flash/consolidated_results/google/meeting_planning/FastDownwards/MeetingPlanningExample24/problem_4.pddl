(define (problem meeting-scheduling-24)
    (:domain meeting-scheduler)
    (:objects
        nob-hill presidio - location
    )
    (:init
        (at nob-hill)
        (not (arrived-presidio))
        (not (time-to-meet))
        (not (meeting-started))
        (not (met-matthew))
    )
    (:goal (met-matthew))
)