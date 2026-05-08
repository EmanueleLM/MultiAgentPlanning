(define (problem tripplanningexample22)
    (:domain trip-planning)
    (:objects
        me - traveler
        c_berlin c_frankfurt c_bucharest - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day_index ; Added day_12 for 11 activity days (Day 1 to Day 11)
        b0 b1 b2 b3 b4 b5 b6 b7 - berlin_day_count
    )

    (:init
        ; Traveler's initial location (assuming Berlin to prioritize show)
        (at me c_berlin)

        ; Current day
        (current_day day_1)

        ; Day sequencing to allow for 11 activity days (plan length 11)
        (next_day day_1 day_2) (next_day day_2 day_3) (next_day day_3 day_4)
        (next_day day_4 day_5) (next_day day_5 day_6) (next_day day_6 day_7)
        (next_day day_7 day_8) (next_day day_8 day_9) (next_day day_9 day_10)
        (next_day day_10 day_11) (next_day day_11 day_12) ; Day 11 is the last activity day, leading to day_12 state

        ; Direct flight connections (symmetric)
        (direct_flight c_berlin c_frankfurt)
        (direct_flight c_frankfurt c_berlin)
        (direct_flight c_frankfurt c_bucharest)
        (direct_flight c_bucharest c_frankfurt)
        ; No direct flight between Berlin and Bucharest

        ; City identification predicates (to work with new action parameters)
        (is_berlin c_berlin)
        (is_frankfurt c_frankfurt)
        (is_bucharest c_bucharest)

        ; Initial day count for Berlin
        (spent_in_berlin b0)

        ; Berlin day count increments
        (next_berlin_count b0 b1) (next_berlin_count b1 b2)
        (next_berlin_count b2 b3) (next_berlin_count b3 b4)
        (next_berlin_count b4 b5) (next_berlin_count b5 b6)
        (next_berlin_count b6 b7)

        ; Berlin show active on specified days
        (berlin_show_date day_1)
        (berlin_show_date day_2)
        (berlin_show_date day_3)
        (berlin_show_date day_4)
        (berlin_show_date day_5)
        (berlin_show_date day_6)
        (berlin_show_date day_7)
    )

    (:goal (and
        (current_day day_12) ; Represents the end of 11 activity days (Day 1 to Day 11)
        (spent_in_berlin b7) ; Berlin must be visited for 7 days
        ; All Berlin show days must be attended
        (attended_berlin_show_on_day day_1)
        (attended_berlin_show_on_day day_2)
        (attended_berlin_show_on_day day_3)
        (attended_berlin_show_on_day day_4)
        (attended_berlin_show_on_day day_5)
        (attended_berlin_show_on_day day_6)
        (attended_berlin_show_on_day day_7)
        ; Ensure Frankfurt and Bucharest are visited at least once (maximizing adherence within 11 days)
        (visited c_frankfurt)
        (visited c_bucharest)
    ))
)