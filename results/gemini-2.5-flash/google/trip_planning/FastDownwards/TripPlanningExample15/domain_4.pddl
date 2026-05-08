(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        count_num
    )
    (:predicates
        (current_day ?d - day)
        (at ?c - city)
        (next_day ?d1 - day ?d2 - day)
        (flight_available ?c1 - city ?c2 - city)

        (berlin_stays ?n - count_num)
        (porto_stays ?n - count_num)
        (krakow_stays ?n - count_num)
        (total_trip_days ?n - count_num)
        (next_count ?n1 - count_num ?n2 - count_num)

        (was_at_city_on_day ?c - city ?d - day) ; Records which city was visited on a specific day

        ;; New predicates to identify specific cities
        (is-berlin ?c - city)
        (is-porto ?c - city)
        (is-krakow ?c - city)
    )

    ;; Action to travel between cities.
    ;; This action is considered 'instantaneous' or happening between the end of one day's stay and the start of the next.
    ;; It does not consume a 'day' from the total trip duration or city stay counts.
    (:action travel_to_city
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (flight_available ?from ?to)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
        )
    )

    ;; Actions to plan a stay for a day in a specific city.
    ;; Each stay advances the current day, increments the city-specific stay count,
    ;; and increments the total trip days count. It also records the city for that day.
    ;; This action represents spending the 'current_d' in the specified city.
    (:action plan_stay_in_berlin
        :parameters (
            ?d - day ?next_d - day
            ?city - city ; Parameter for the city
            ?c_bs - count_num ?n_bs - count_num
            ?c_td - count_num ?n_td - count_num
        )
        :precondition (and
            (current_day ?d)
            (at ?city) ; Use parameter
            (is-berlin ?city) ; Check if it's Berlin
            (next_day ?d ?next_d)
            (berlin_stays ?c_bs)
            (next_count ?c_bs ?n_bs)
            (total_trip_days ?c_td)
            (next_count ?c_td ?n_td)
            (not (current_day d11)) ; Cannot plan a stay for d11, as d10 is the last possible actual stay day
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (berlin_stays ?c_bs))
            (berlin_stays ?n_bs)
            (not (total_trip_days ?c_td))
            (total_trip_days ?n_td)
            (was_at_city_on_day ?city ?d) ; Use parameter
        )
    )

    (:action plan_stay_in_porto
        :parameters (
            ?d - day ?next_d - day
            ?city - city ; Parameter for the city
            ?c_ps - count_num ?n_ps - count_num
            ?c_td - count_num ?n_td - count_num
        )
        :precondition (and
            (current_day ?d)
            (at ?city)
            (is-porto ?city)
            (next_day ?d ?next_d)
            (porto_stays ?c_ps)
            (next_count ?c_ps ?n_ps)
            (total_trip_days ?c_td)
            (next_count ?c_td ?n_td)
            (not (current_day d11))
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (porto_stays ?c_ps))
            (porto_stays ?n_ps)
            (not (total_trip_days ?c_td))
            (total_trip_days ?n_td)
            (was_at_city_on_day ?city ?d)
        )
    )

    (:action plan_stay_in_krakow
        :parameters (
            ?d - day ?next_d - day
            ?city - city ; Parameter for the city
            ?c_ks - count_num ?n_ks - count_num
            ?c_td - count_num ?n_td - count_num
        )
        :precondition (and
            (current_day ?d)
            (at ?city)
            (is-krakow ?city)
            (next_day ?d ?next_d)
            (krakow_stays ?c_ks)
            (next_count ?c_ks ?n_ks)
            (total_trip_days ?c_td)
            (next_count ?c_td ?n_td)
            (not (current_day d11))
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (krakow_stays ?c_ks))
            (krakow_stays ?n_ks)
            (not (total_trip_days ?c_td))
            (total_trip_days ?n_td)
            (was_at_city_on_day ?city ?d)
        )
    )
)