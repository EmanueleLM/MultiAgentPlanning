(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city - object
        location - object
        day - object
        city_count - object
    )
    (:constants
        start_node - location
    )
    (:predicates
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (at_location ?l - location)
        (visited_city ?c - city)
        (num_cities_visited ?count - city_count)
        (next_count ?c1 - city_count ?c2 - city_count)
        (direct_flight ?c1 - city ?c2 - city)
        (met_friend_in_florence)
        (is_meeting_window ?d - day)
    )
    (:functions
        (total-cost)
    )

    ;; Action to start the trip, implicitly spending day 1 in the chosen initial city.
    (:action start_trip
        :parameters (?c - city ?d1 - day ?d2 - day ?count_from - city_count ?count_to - city_count)
        :precondition (and
            (at_location start_node)
            (current_day ?d1)
            (next_day ?d1 ?d2)
            (num_cities_visited ?count_from)
            (next_count ?count_from ?count_to)
        )
        :effect (and
            (not (at_location start_node))
            (at_location ?c)
            (visited_city ?c)
            (not (num_cities_visited ?count_from))
            (num_cities_visited ?count_to)
            (not (current_day ?d1))
            (current_day ?d2)
            (increase (total-cost) 1)
        )
    )

    ;; Action to travel to a city that has not been visited before.
    ;; This action consumes one day and increments the count of unique cities visited.
    (:action travel_to_new_city
        :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?count_before - city_count ?count_after - city_count)
        :precondition (and
            (at_location ?from)
            (direct_flight ?from ?to)
            (current_day ?d1)
            (next_day ?d1 ?d2)
            (not (visited_city ?to))
            (num_cities_visited ?count_before)
            (next_count ?count_before ?count_after)
        )
        :effect (and
            (not (at_location ?from))
            (at_location ?to)
            (visited_city ?to)
            (not (current_day ?d1))
            (current_day ?d2)
            (not (num_cities_visited ?count_before))
            (num_cities_visited ?count_after)
            (increase (total-cost) 1)
        )
    )

    ;; Action to travel to a city that has already been visited.
    ;; This action consumes one day but does not increment the city count.
    (:action travel_to_visited_city
        :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
        :precondition (and
            (at_location ?from)
            (direct_flight ?from ?to)
            (current_day ?d1)
            (next_day ?d1 ?d2)
            (visited_city ?to)
        )
        :effect (and
            (not (at_location ?from))
            (at_location ?to)
            (not (current_day ?d1))
            (current_day ?d2)
            (increase (total-cost) 1)
        )
    )

    ;; Action to stay for one day in the current city.
    ;; This action consumes one day.
    (:action stay_in_city
        :parameters (?c - city ?d1 - day ?d2 - day)
        :precondition (and
            (at_location ?c)
            (current_day ?d1)
            (next_day ?d1 ?d2)
        )
        :effect (and
            (not (current_day ?d1))
            (current_day ?d2)
            (increase (total-cost) 1)
        )
    )

    ;; Action to meet a friend in Florence.
    ;; This action can only be taken once, in Florence, during the meeting window.
    ;; It does not consume a day itself, but occurs during a day's activity.
    (:action meet_friend
        :parameters (?d - day)
        :precondition (and
            (at_location florence)
            (current_day ?d)
            (is_meeting_window ?d)
            (not (met_friend_in_florence))
        )
        :effect (and
            (met_friend_in_florence)
            (increase (total-cost) 1)
        )
    )
)