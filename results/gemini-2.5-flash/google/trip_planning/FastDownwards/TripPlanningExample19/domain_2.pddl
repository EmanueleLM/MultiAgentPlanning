(define (domain trip_planning_example_19)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        nice_stay_day_tracker
    )
    (:constants nice - city)
    (:predicates
        (current_city ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (direct_flight ?c1 - city ?c2 - city)
        (visited ?c - city)
        (nice_day_count_is ?n - nice_stay_day_tracker)
        (next_nice_day_count ?n1 - nice_stay_day_tracker ?n2 - nice_stay_day_tracker)
        (can_meet_on_this_nice_day ?n - nice_stay_day_tracker)
        (friends_met)
    )

    ;; Action to travel from any city (not Nice) to Nice
    (:action travel_from_x_to_nice
        :parameters (?from - city ?curr_d - day ?next_d - day ?curr_nice_count - nice_stay_day_tracker)
        :precondition (and
            (current_city ?from)
            (direct_flight ?from nice)
            (current_day ?curr_d)
            (next_day ?curr_d ?next_d)
            (nice_day_count_is ?curr_nice_count)
            (not (= ?from nice)) ; Ensure we are not travelling from Nice to Nice
        )
        :effect (and
            (not (current_city ?from))
            (current_city nice)
            (not (current_day ?curr_d))
            (current_day ?next_d)
            (visited nice) ; Mark Nice as visited
            (not (nice_day_count_is ?curr_nice_count)) ; Reset nice day count
            (nice_day_count_is nsd1) ; Start Nice stay day count at 1
        )
    )

    ;; Action to travel from Nice to any other city
    (:action travel_from_nice_to_x
        :parameters (?to - city ?curr_d - day ?next_d - day ?curr_nice_count - nice_stay_day_tracker)
        :precondition (and
            (current_city nice)
            (direct_flight nice ?to)
            (current_day ?curr_d)
            (next_day ?curr_d ?next_d)
            (nice_day_count_is ?curr_nice_count) ; Current nice day count (could be nsd1-nsd_overflow)
            (not (= ?to nice)) ; Ensure we are not travelling from Nice to Nice
        )
        :effect (and
            (not (current_city nice))
            (current_city ?to)
            (not (current_day ?curr_d))
            (current_day ?next_d)
            (visited ?to) ; Mark destination as visited
            (not (nice_day_count_is ?curr_nice_count)) ; Reset nice day count
            (nice_day_count_is nsd_none) ; Not in Nice, so count is none
        )
    )

    ;; Action to travel between two cities, neither of which is Nice
    (:action travel_between_non_nice
        :parameters (?from - city ?to - city ?curr_d - day ?next_d - day)
        :precondition (and
            (current_city ?from)
            (direct_flight ?from ?to)
            (current_day ?curr_d)
            (next_day ?curr_d ?next_d)
            (nice_day_count_is nsd_none) ; Must not be in a Nice stay sequence
            (not (= ?from nice))
            (not (= ?to nice))
            (not (= ?from ?to)) ; Cannot travel to the same city
        )
        :effect (and
            (not (current_city ?from))
            (current_city ?to)
            (not (current_day ?curr_d))
            (current_day ?next_d)
            (visited ?to) ; Mark destination as visited
            ; nice_day_count_is remains nsd_none as neither city is Nice
        )
    )

    ;; Action to spend an additional day in Nice
    (:action stay_day_in_nice
        :parameters (?curr_d - day ?next_d - day ?curr_nice_count - nice_stay_day_tracker ?next_nice_count - nice_stay_day_tracker)
        :precondition (and
            (current_city nice)
            (current_day ?curr_d)
            (next_day ?curr_d ?next_d)
            (nice_day_count_is ?curr_nice_count)
            (next_nice_day_count ?curr_nice_count ?next_nice_count)
            (not (= ?curr_nice_count nsd_none)) ; Must be actively counting Nice days (i.e., nsd1 or higher)
        )
        :effect (and
            (not (current_day ?curr_d))
            (current_day ?next_d)
            (not (nice_day_count_is ?curr_nice_count))
            (nice_day_count_is ?next_nice_count) ; Advance Nice day counter
        )
    )

    ;; Action to spend an additional day in a city other than Nice
    (:action stay_day_in_other_city
        :parameters (?c - city ?curr_d - day ?next_d - day)
        :precondition (and
            (current_city ?c)
            (current_day ?curr_d)
            (next_day ?curr_d ?next_d)
            (nice_day_count_is nsd_none) ; Must not be in a Nice stay sequence
            (not (= ?c nice))
        )
        :effect (and
            (not (current_city ?c))
            (current_city ?c)
            (not (current_day ?curr_d))
            (current_day ?next_d)
            ; nice_day_count_is remains nsd_none
        )
    )

    ;; Action to meet friends in Nice
    (:action meet_friends
        :parameters (?curr_d - day ?curr_nice_count - nice_stay_day_tracker)
        :precondition (and
            (current_city nice)
            (current_day ?curr_d)
            (nice_day_count_is ?curr_nice_count)
            (can_meet_on_this_nice_day ?curr_nice_count) ; Check if it's within day 1-6 of Nice stay
            (not (friends_met)) ; Can only meet once
        )
        :effect (and
            (friends_met)
        )
    )
)