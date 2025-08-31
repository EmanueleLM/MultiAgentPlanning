(define (problem meet-james-integrated)
    (:domain integrated-meeting)
    (:objects
        James Traveler - person
        marina-district alamo-square - location
        t540 t555 t945 t960 t1035 t1050 t1110 t1125 t1140 t1155 t1200 - timepoint
    )
    (:init
        (at Traveler marina-district)
        (at James alamo-square)
        (at-time t945)
        (can-meet Traveler James)
        (next-time t540 t555)
        (next-time t555 t945)
        (next-time t945 t960)
        (next-time t960 t1035)
        (next-time t1035 t1050)
        (next-time t1050 t1110)
        (next-time t1110 t1125)
        (next-time t1125 t1140)
        (next-time t1140 t1155)
        (next-time t1155 t1200)
    )
    (:goal
        (met Traveler James)
    )
)