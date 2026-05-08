(define (problem trip_planning_example41_problem)
    (:domain trip_planning_example41)
    (:objects
        stockholm athens mykonos - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_end - day
        day_needs_1_fake day_needs_2_fake - day
    )
    (:init
        (current_day day_1)
        (at_city stockholm)

        (next_day day_1 day_2)
        (next_day day_2 day_3)
        (next_day day_3 day_4)
        (next_day day_4 day_5)
        (next_day day_5 day_6)
        (next_day day_6 day_7)
        (next_day day_7 day_8)
        (next_day day_8 day_9)
        (next_day day_9 day_10)
        (next_day day_10 day_11)
        (next_day day_11 day_12)
        (next_day day_12 day_13)
        (next_day day_13 day_end)

        (direct_flight athens mykonos)
        (direct_flight mykonos athens)
        (direct_flight stockholm athens)
        (direct_flight athens stockholm)

        (conference_on_day day_1)
        (conference_city day_1 stockholm)
        (conference_on_day day_6)
        (conference_city day_6 stockholm)
    )
    (:goal
        (and
            (current_day day_end)
            
            ; Stockholm (6 days)
            (spent_day_in stockholm day_1)
            (spent_day_in stockholm day_2)
            (spent_day_in stockholm day_3)
            (spent_day_in stockholm day_4)
            (spent_day_in stockholm day_5)
            (spent_day_in stockholm day_6)

            ; Athens (5 days)
            (spent_day_in athens day_7)
            (spent_day_in athens day_8)
            (spent_day_in athens day_9)
            (spent_day_in athens day_10)
            (spent_day_in athens day_11)

            ; Mykonos (4 days) - requires 2 more days than available (day_12, day_13)
            (spent_day_in mykonos day_12)
            (spent_day_in mykonos day_13)
            (spent_day_in mykonos day_needs_1_fake) ; Represents a needed day beyond the 13 available
            (spent_day_in mykonos day_needs_2_fake) ; Represents another needed day beyond the 13 available
        )
    )
)