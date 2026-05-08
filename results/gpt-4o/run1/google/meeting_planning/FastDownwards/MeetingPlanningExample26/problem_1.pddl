(define (problem visit_san_francisco)
    (:domain san_francisco_visit)
    (:objects
        richmond_district presidio - location
        sarah - person
    )
    (:init
        (at richmond_district)
        (visited_richmond_district)
    )
    (:goal
        (and
            (satisfied_goal)
            (visited_richmond_district)
        )
    )
)