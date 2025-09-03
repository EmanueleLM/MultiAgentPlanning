(define (problem meet-james-integrated)
    (:domain integrated-meeting)

    (:objects
        James Traveler - person
        marina-district alamo-square - location
        t540 t555 t945 t960 t1050 t1200 - timepoint
    )

    (:init
        (at Traveler marina-district)
        (at James alamo-square)
        (at-time t540)
        (can-meet Traveler James)
    )

    (:goal
        (met Traveler James)
    )
)