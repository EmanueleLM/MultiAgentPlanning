(define (problem mystery-problem)
    (:domain mystery-abstract-domain)
    (:objects
        a - object
        b - object
        c - object
        d - object
    )
    (:init
        (= (total-cost) 0)
        ; Initial State: object a craves object c, object d craves object a, harmony is present, object b and object c are planets, object b and object d are provinces.
        (ObjectCraves a c)
        (ObjectCraves d a)
        (Harmony)
        (Planet b)
        (Planet c)
        (Province b)
        (Province d)
    )
    (:goal (and
        ; Goal State: object a craves object c, object b craves object d and object d craves object a.
        (ObjectCraves a c)
        (ObjectCraves b d)
        (ObjectCraves d a)
    ))
    (:metric minimize (total-cost))
)