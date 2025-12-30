(define (problem meeting-scheduling-24)
    (:domain meeting-scheduler)
    (:objects
        nob-hill presidio - location
        T0 T17 T120 T150 - time
    )
    (:init
        (time-stage T0) ; Start at 9:00 AM (0 minutes)
        (at nob-hill)
    )
    (:goal (and (meeting-completed)))
)