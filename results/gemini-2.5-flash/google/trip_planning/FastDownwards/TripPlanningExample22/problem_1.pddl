(define (problem tripplanningexample22)
    (:domain trip-planning)
    (:objects
        me - traveler
        c_berlin c_frankfurt c_bucharest - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day_index
        b0 b1 b2 b3 b4 b5 b6 b7 - berlin_day_count
        f0 f1 f2 f3 f4 - frankfurt_day_count
        h0 h1 h2 - bucharest_day_count
    )

    (:init
        ; Traveler's initial location (assuming Berlin to prioritize show)
        (at me c_berlin)

        ; Current day
        (current_day day_1)

        ; Day sequencing
        (next_day day_1 day_2) (next_day day_2 day_3) (next_day day_3 day_4)
        (next_day day_4 day_5) (next_day day_5 day_6) (next_day day_6 day_7)
        (next_day day_7 day_8) (next_day day_8 day_9) (next_day day_9 day_10)
        (next_day day_10 day_11)

        ; Direct flight connections (symmetric)
        (direct_flight c_berlin c_frankfurt)
        (direct_flight c_frankfurt c_berlin)
        (direct_flight c_frankfurt c_bucharest)
        (direct_flight c_bucharest c_frankfurt)
        ; No direct flight between Berlin and Bucharest

        ; Initial day counts
        (spent_in_berlin b0)
        (spent_in_frankfurt f0)
        (spent_in_bucharest h0)

        ; Berlin day count increments
        (next_berlin_count b0 b1) (next_berlin_count b1 b2)
        (next_berlin_count b2 b3) (next_berlin_count b3 b4)
        (next_berlin_count b4 b5) (next_berlin_count b5 b6)
        (next_berlin_count b6 b7)

        ; Frankfurt day count increments
        (next_frankfurt_count f0 f1) (next_frankfurt_count f1 f2)
        (next_frankfurt_count f2 f3) (next_frankfurt_count f3 f4)

        ; Bucharest day count increments
        (next_bucharest_count h0 h1) (next_bucharest_count h1 h2)

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
        (current_day day_11) ; Total trip duration must be 11 days
        (spent_in_berlin b7) ; Berlin for 7 days
        (spent_in_frankfurt f4) ; Frankfurt for 4 days
        (spent_in_bucharest h2) ; Bucharest for 2 days
        (attended_berlin_show_on_day day_1) ; Berlin show requirements
        (attended_berlin_show_on_day day_2)
        (attended_berlin_show_on_day day_3)
        (attended_berlin_show_on_day day_4)
        (attended_berlin_show_on_day day_5)
        (attended_berlin_show_on_day day_6)
        (attended_berlin_show_on_day day_7)
    ))
)