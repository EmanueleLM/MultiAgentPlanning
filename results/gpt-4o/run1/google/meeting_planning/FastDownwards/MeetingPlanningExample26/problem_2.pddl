(define (problem visit_san_francisco)
    (:domain san_francisco_trip)
    (:objects
        richmond_district presidio - location
        you sarah - person
        t0915 t1115 t1315 t1515 - time
    )
    (:init
        (at you richmond_district)
        (time_available sarah t1315 t1515)
    )
    (:goal
        (goal_achieved)
    )
)