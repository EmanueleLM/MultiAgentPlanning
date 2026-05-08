(define (problem meeting_scheduling_20)
    (:domain meeting_scheduler)
    (:objects
        me - person
        joseph - person
        CHINATOWN NOBHILL - location
    )
    (:init
        ; Initial State
        (at me CHINATOWN)
        (at joseph NOBHILL) 
        (is-available joseph NOBHILL)

        ; Status tracking
        (not (at-nobhill))
        (not (waited-for-joseph))

        ; Time initialization (T=0)
        (= (current-time) 0)
        (= (meeting-duration me joseph) 0)
        (= (total-cost) 0)
    )
    (:goal (and
        (goal-met)
    ))
    (:metric minimize (total-cost))
)