(define (problem meeting-scheduling-24)
    (:domain meeting-scheduler)
    (:objects
        nob-hill presidio - location
    )
    (:init
        (time-T0) ; Start at 9:00 AM (0 minutes)
        (at nob-hill)
        (not (meeting-completed))
    )
    (:goal (and (meeting-completed)))
)