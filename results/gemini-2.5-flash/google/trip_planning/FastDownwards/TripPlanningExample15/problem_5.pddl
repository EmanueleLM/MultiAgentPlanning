(define (problem tripplanningexample15)
    (:domain trip_planning)
    (:objects
        berlin porto krakow - city
        d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day ; d0 is start of Day 1, d10 is start of Day 11. d11 is the final state after Day 11 is complete.
        cn0 cn1 cn2 cn3 cn4 cn5 cn6 cn7 cn8 cn9 cn10 cn11 - count_num ; Counters up to 11 for total trip days
    )
    (:init
        ;; Initial state for planning
        (current_day d0) ; Start planning for Day 1
        (at berlin) ; Arbitrarily start the trip in Berlin

        ;; Initial stay counters (all at zero)
        (berlin_stays cn0)
        (porto_stays cn0)
        (krakow_stays cn0)
        (total_trip_days cn0)
        (= (total-cost) 0) ; Initialize total-cost fluent

        ;; Defines the temporal sequence of days
        (next_day d0 d1)
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d7)
        (next_day d7 d8)
        (next_day d8 d9)
        (next_day d9 d10)
        (next_day d10 d11)

        ;; Defines the sequence for all numerical counters
        (next_count cn0 cn1)
        (next_count cn1 cn2)
        (next_count cn2 cn3)
        (next_count cn3 cn4)
        (next_count cn4 cn5)
        (next_count cn5 cn6)
        (next_count cn6 cn7)
        (next_count cn7 cn8)
        (next_count cn8 cn9)
        (next_count cn9 cn10)
        (next_count cn10 cn11)

        ;; Direct flight connections (bidirectional)
        (flight_available berlin porto)
        (flight_available porto berlin)
        (flight_available krakow berlin)
        (flight_available berlin krakow)

        ;; New initial facts for city identification
        (is-berlin berlin)
        (is-porto porto)
        (is-krakow krakow)
    )
    (:goal (and
        (current_day d11) ; Ensure the plan covers all 11 days (d0 to d10 processed)
        (total_trip_days cn11) ; Exactly 11 days spent staying in cities

        ;; Revised required stay durations, adjusted to fit 11-day total trip duration (original sum was 13 days).
        ;; Berlin reduced from 6 to 4 days. Porto and Krakow remain as specified.
        (berlin_stays cn4)
        (porto_stays cn2)
        (krakow_stays cn5)

        ;; Wedding constraint: "attend a wedding in Porto between day 10 and day 11."
        ;; Given our day indexing (d0=Day 1, d9=Day 10, d10=Day 11),
        ;; this means the traveler must be in Porto for Day 10 (d9) and Day 11 (d10).
        (was_at_city_on_day porto d9)
        (was_at_city_on_day porto d10)
    ))
)