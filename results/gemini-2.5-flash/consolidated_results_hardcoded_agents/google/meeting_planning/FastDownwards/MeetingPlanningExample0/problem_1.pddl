(define (problem meeting-planning-0)
    (:domain meeting-planning)
    (:objects
        traveler - agent
        stephanie - agent
        marina mission - location
    )
    (:init
        ; Traveler starts at Marina at t=0
        (at traveler marina)

        ; Initial state for predicates that change
        (not (met stephanie))
        (not (available stephanie marina))
        (not (available stephanie mission)) ; Initially unavailable until t=90

        ; Stephanie availability window: 10:30 AM (t=90) to 1:30 PM (t=270)
        (at 90 (available stephanie mission))
        (at 270 (not (available stephanie mission)))
    )

    (:goal (and
        (met stephanie)
    ))
)