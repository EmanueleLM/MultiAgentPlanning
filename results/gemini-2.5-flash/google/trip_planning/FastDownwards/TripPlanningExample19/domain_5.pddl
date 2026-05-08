(define (domain trip_planning_example_19)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        nice_stay_day_tracker
    )
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
        (is_nice ?c - city) ; Predicate to identify the 'nice' city
    )

    ;; Action to travel from any city (not Nice) to Nice
    (:action travel_from_x_to_nice
        :parameters (?from - city ?to_city - city ?curr_d - day ?next_d - day)
        :precondition (and
            (current_city ?from)
            (not (is_nice ?from)) ; Must not be in Nice currently
            (is_nice ?to_city) ; Destination must be Nice
            (direct_flight ?from ?to_city)
            (current_day ?curr_d)
            (next_day ?curr_d ?next_d)
            (nice_day_count_is no-nice-stay) ; Must not be counting Nice days (i.e., not in Nice)
        )
        :effect (and
            (not (current_city ?from))
            (current_city ?to_city)
            (not (current_day ?curr_d))
            (current_day ?next_d)
            (visited ?to_city) ; Mark Nice as visited
            (not (nice_day_count_is no-nice-stay)) ; Reset nice day count from none
            (nice_day_count_is nsd1) ; Start Nice stay day count at 1
        )
    )

    ;; Action to travel from Nice to any other city
    (:action travel_from_nice_to_x
        :parameters (?from_city - city ?to - city ?curr_d - day ?next_d - day ?curr_nice_count - nice_stay_day_tracker)
        :precondition (and
            (current_city ?from_city)
            (is_nice ?from_city) ; Must be in Nice currently
            (not (is_nice ?to)) ; Destination must not be Nice
            (direct_flight ?from_city ?to)
            (current_day ?curr_d)
            (next_day ?curr_d ?next_d)
            (nice_day_count_is ?curr_nice_count) ; Current nice day count (could be nsd1-nsd_overflow)
            (not (= ?from_city ?to)) ; Ensure we are not travelling to the same city
        )
        :effect (and
            (not (current_city ?from_city))
            (current_city ?to)
            (not (current_day ?curr_d))
            (current_day ?next_d)
            (visited ?to) ; Mark destination as visited
            (not (nice_day_count_is ?curr_nice_count)) ; Remove current nice day count
            (nice_day_count_is no-nice-stay) ; Not in Nice, so count is none
        )
    )

    ;; Action to travel between two cities, neither of which is Nice
    (:action travel_between_non_nice
        :parameters (?from - city ?to - city ?curr_d - day ?next_d - day)
        :precondition (and
            (current_city ?from)
            (not (is_nice ?from))
            (not (is_nice ?to))
            (direct_flight ?from ?to)
            (current_day ?curr_d)
            (next_day ?curr_d ?next_d)
            (nice_day_count_is no-nice-stay) ; Must not be in a Nice stay sequence
            (not (= ?from ?to)) ; Cannot travel to the same city
        )
        :effect (and
            (not (current_city ?from))
            (current_city ?to)
            (not (current_day ?curr_d))
            (current_day ?next_d)
            (visited ?to) ; Mark destination as visited
            ; nice_day_count_is remains no-nice-stay as neither city is Nice
        )
    )

    ;; Action to spend an additional day in Nice
    (:action stay_day_in_nice
        :parameters (?nice_loc - city ?curr_d - day ?next_d - day ?curr_nice_count - nice_stay_day_tracker ?next_nice_count - nice_stay_day_tracker)
        :precondition (and
            (current_city ?nice_loc)
            (is_nice ?nice_loc) ; Must be in Nice
            (current_day ?curr_d)
            (next_day ?curr_d ?next_d)
            (nice_day_count_is ?curr_nice_count)
            (next_nice_day_count ?curr_nice_count ?next_nice_count)
            (not (= ?curr_nice_count no-nice-stay)) ; Must be actively counting Nice days (i.e., nsd1 or higher)
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
            (not (is_nice ?c)) ; Must not be Nice
            (current_day ?curr_d)
            (next_day ?curr_d ?next_d)
            (nice_day_count_is no-nice-stay) ; Must not be in a Nice stay sequence
        )
        :effect (and
            ;; Current city remains ?c, only day advances
            (not (current_day ?curr_d))
            (current_day ?next_d)
            ; nice_day_count_is remains no-nice-stay
        )
    )

    ;; Action to meet friends in Nice
    (:action meet_friends
        :parameters (?nice_loc - city ?curr_d - day ?curr_nice_count - nice_stay_day_tracker)
        :precondition (and
            (current_city ?nice_loc)
            (is_nice ?nice_loc) ; Must be in Nice
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