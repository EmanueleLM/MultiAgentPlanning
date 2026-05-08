(define (domain tripplanningexample43)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day_index
        day_count
    )
    (:predicates
        (current_day ?d - day_index)
        (next_day_index ?d1 - day_index ?d2 - day_index)
        (at ?c - city)
        (direct_flight ?c1 - city ?c2 - city)
        (days_in_venice ?n - day_count)
        (days_in_porto ?n - day_count)
        (days_in_dublin ?n - day_count)
        (next_count ?n1 - day_count ?n2 - day_count)
        (friends_met_in_venice)
        (is_friend_window_day ?d - day_index)
    )

    ;; Fly between two cities, consuming one day. No day counts are incremented for the destination city on travel day.
    (:action fly_day
        :parameters (?from_c - city ?to_c - city ?d - day_index ?next_d - day_index)
        :precondition (and
            (current_day ?d)
            (at ?from_c)
            (direct_flight ?from_c ?to_c)
            (next_day_index ?d ?next_d)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (at ?from_c))
            (at ?to_c)
        )
    )

    ;; Stay in Porto for a day, incrementing the days spent there.
    (:action stay_day_porto
        :parameters (?d - day_index ?next_d - day_index ?curr_c - day_count ?next_c - day_count)
        :precondition (and
            (current_day ?d)
            (at porto)
            (next_day_index ?d ?next_d)
            (days_in_porto ?curr_c)
            (next_count ?curr_c ?next_c)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_porto ?curr_c))
            (days_in_porto ?next_c)
        )
    )

    ;; Stay in Dublin for a day, incrementing the days spent there.
    (:action stay_day_dublin
        :parameters (?d - day_index ?next_d - day_index ?curr_c - day_count ?next_c - day_count)
        :precondition (and
            (current_day ?d)
            (at dublin)
            (next_day_index ?d ?next_d)
            (days_in_dublin ?curr_c)
            (next_count ?curr_c ?next_c)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_dublin ?curr_c))
            (days_in_dublin ?next_c)
        )
    )

    ;; Stay in Venice during the friend meeting window, and meet friends if not already met.
    (:action stay_day_venice_meet_friends
        :parameters (?d - day_index ?next_d - day_index ?curr_c - day_count ?next_c - day_count)
        :precondition (and
            (current_day ?d)
            (at venice)
            (next_day_index ?d ?next_d)
            (days_in_venice ?curr_c)
            (next_count ?curr_c ?next_c)
            (is_friend_window_day ?d)
            (not (friends_met_in_venice))
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_venice ?curr_c))
            (days_in_venice ?next_c)
            (friends_met_in_venice)
        )
    )

    ;; Stay in Venice during the friend meeting window, but friends have already been met.
    (:action stay_day_venice_friends_already_met_during_window
        :parameters (?d - day_index ?next_d - day_index ?curr_c - day_count ?next_c - day_count)
        :precondition (and
            (current_day ?d)
            (at venice)
            (next_day_index ?d ?next_d)
            (days_in_venice ?curr_c)
            (next_count ?curr_c ?next_c)
            (is_friend_window_day ?d)
            (friends_met_in_venice)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_venice ?curr_c))
            (days_in_venice ?next_c)
        )
    )

    ;; Stay in Venice outside the friend meeting window.
    (:action stay_day_venice_outside_window
        :parameters (?d - day_index ?next_d - day_index ?curr_c - day_count ?next_c - day_count)
        :precondition (and
            (current_day ?d)
            (at venice)
            (next_day_index ?d ?next_d)
            (days_in_venice ?curr_c)
            (next_count ?curr_c ?next_c)
            (not (is_friend_window_day ?d))
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_venice ?curr_c))
            (days_in_venice ?next_c)
        )
    )

    ;; Final actions for the last day (d9)
    ;; These actions complete the trip by advancing to d_end instead of a next_d.
    (:action fly_day_final
        :parameters (?from_c - city ?to_c - city)
        :precondition (and
            (current_day d9)
            (at ?from_c)
            (direct_flight ?from_c ?to_c)
        )
        :effect (and
            (not (current_day d9))
            (current_day d_end)
            (not (at ?from_c))
            (at ?to_c)
        )
    )

    (:action stay_day_porto_final
        :parameters (?curr_c - day_count ?next_c - day_count)
        :precondition (and
            (current_day d9)
            (at porto)
            (days_in_porto ?curr_c)
            (next_count ?curr_c ?next_c)
        )
        :effect (and
            (not (current_day d9))
            (current_day d_end)
            (not (days_in_porto ?curr_c))
            (days_in_porto ?next_c)
        )
    )

    (:action stay_day_dublin_final
        :parameters (?curr_c - day_count ?next_c - day_count)
        :precondition (and
            (current_day d9)
            (at dublin)
            (days_in_dublin ?curr_c)
            (next_count ?curr_c ?next_c)
        )
        :effect (and
            (not (current_day d9))
            (current_day d_end)
            (not (days_in_dublin ?curr_c))
            (days_in_dublin ?next_c)
        )
    )

    (:action stay_day_venice_meet_friends_final
        :parameters (?curr_c - day_count ?next_c - day_count)
        :precondition (and
            (current_day d9)
            (at venice)
            (days_in_venice ?curr_c)
            (next_count ?curr_c ?next_c)
            (is_friend_window_day d9) ; d9 is the day itself
            (not (friends_met_in_venice))
        )
        :effect (and
            (not (current_day d9))
            (current_day d_end)
            (not (days_in_venice ?curr_c))
            (days_in_venice ?next_c)
            (friends_met_in_venice)
        )
    )

    (:action stay_day_venice_friends_already_met_during_window_final
        :parameters (?curr_c - day_count ?next_c - day_count)
        :precondition (and
            (current_day d9)
            (at venice)
            (days_in_venice ?curr_c)
            (next_count ?curr_c ?next_c)
            (is_friend_window_day d9) ; d9 is the day itself
            (friends_met_in_venice)
        )
        :effect (and
            (not (current_day d9))
            (current_day d_end)
            (not (days_in_venice ?curr_c))
            (days_in_venice ?next_c)
        )
    )

    (:action stay_day_venice_outside_window_final
        :parameters (?curr_c - day_count ?next_c - day_count)
        :precondition (and
            (current_day d9)
            (at venice)
            (days_in_venice ?curr_c)
            (next_count ?curr_c ?next_c)
            (not (is_friend_window_day d9)) ; d9 is the day itself
        )
        :effect (and
            (not (current_day d9))
            (current_day d_end)
            (not (days_in_venice ?curr_c))
            (days_in_venice ?next_c)
        )
    )
)