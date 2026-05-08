(define (problem MeetingPlanningExample8)
    (:domain meeting-planning)
    (:objects
        chinatown marinadistrict - location
        stephanie - person
    )
    (:init
        (at chinatown)
        (= (current-time) 0) ; 9:00 AM
        (= (meeting-duration stephanie) 0)
        (= (total-friends-met) 0)
    )
    (:goal (and (met stephanie)))

    (:metric maximize (total-friends-met))
)