(define (problem meeting-planning-instance)
    (:domain meeting-planning)
    (:objects
    )

    (:init
        (at presidio)
        (= (t) 0)
        (= (total-cost) 0)
    )

    (:goal (and
        (met-betty)
    ))

    (:metric minimize (total-cost))