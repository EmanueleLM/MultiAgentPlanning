```lisp
(define (problem visit_san_francisco)
    (:domain san_francisco_trip)
    (:objects
        richmond_district presidio - location
        you sarah - person
        t1315 t1415 t1515 - Object
    )
    (:init
        (at you richmond_district)
        (at sarah presidio)
        (available_sarah t1315)
        (available_sarah t1415)
        (available_sarah t1515)
    )
    (:goal
        (goal_achieved)
    )
)
```