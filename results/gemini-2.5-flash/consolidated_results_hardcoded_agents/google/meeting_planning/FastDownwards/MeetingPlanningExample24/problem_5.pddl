(define (problem meeting-scheduling-24)
    (:domain meeting-scheduler)
    (:objects
        nob-hill presidio - location
    )
    (:init
        (= (current-time) 0) ; Start at 9:00 AM
        (at nob-hill)
        (not (meeting-completed))
    )
    (:goal (and (meeting-completed)))
)