(define (problem meet-james-integrated-fd)
    (:domain integrated-meeting-fd)
    (:objects
        james traveler - person
        marina-district alamo-square - location
        t540 t555 t945 t960 t1035 t1050 t1110 t1125 t1140 t1155 t1200 - timepoint
    )
    (:init
        (at traveler marina-district)
        (at james alamo-square)
        (at-time t945)
        (can-meet traveler james)
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
        ; Defining time slots available for meeting
        (meet-slot t960)
        (meet-slot t1035)
        (meet-slot t1050)
        (meet-slot t1110)
        (meet-slot t1125)
        (meet-slot t1140)
        (meet-slot t1155)
    )
    (:goal
        (met traveler james)
    )
)