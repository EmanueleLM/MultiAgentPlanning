(define (problem meeting-planning-instance)
    (:domain meeting-planning)
    (:objects
        presidio northbeach - location
    )

    (:init
        (at presidio)
        (= (T) 0)
        (= (total-cost) 0)
    )

    (:goal (and
        (met_betty_75)
    ))

    (:metric minimize (total-cost))