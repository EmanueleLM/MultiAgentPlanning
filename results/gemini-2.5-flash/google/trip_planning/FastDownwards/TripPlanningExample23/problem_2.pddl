(define (problem trip_planning_example23_problem)
    (:domain trip_planning_example23)
    (:objects
        london bucharest riga - city
        day1 day2 day3 day4 day5 day6 day7 day8 - day
    )
    (:init
        (current_city london) ; Starting point: London (as no specific start is given)
        (current_day day1)

        ; Day progression relations
        (next_day day1 day2)
        (next_day day2 day3)
        (next_day day3 day4)
        (next_day day4 day5)
        (next_day day5 day6)
        (next_day day6 day7)
        (next_day day7 day8)

        ; Direct flight connections (bidirectional)
        (connected london bucharest)
        (connected bucharest london)
        (connected bucharest riga)
        (connected riga bucharest)

        ; Days when the agent MUST be in Riga for the workshop
        (must_be_in_riga day5)
        (must_be_in_riga day6)
        (must_be_in_riga day7)
        (must_be_in_riga day8)
    )
    (:goal (and
        (day_processed day8) ; The entire 8-day trip must be planned and completed
    ))