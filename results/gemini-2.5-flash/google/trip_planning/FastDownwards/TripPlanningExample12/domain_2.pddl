(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:constants
        home valencia amsterdam tallinn - city
        day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
    )
    (:predicates
        (at ?c - city) ; Current location of the traveler
        (current_day ?d - day) ; Tracks the current day of the trip
        (next_day ?d1 ?d2 - day) ; Defines the sequential progression of days
        (has_flight ?from ?to - city) ; Direct flight connections between cities
        (visited ?c - city) ; Marks a city as visited at least once
        (tallinn_meeting_met) ; Flag indicating the friend meeting in Tallinn has occurred
        (day_is_between_9_and_15 ?d - day) ; Helper predicate for the Tallinn meeting time window
    )

    (:action depart_from_home
        :parameters (?to - city ?d_depart ?d_arrive - day)
        :precondition (and
            (at home) ; Must be at the home location to depart
            (current_day ?d_depart)
            (next_day ?d_depart ?d_arrive)
        )
        :effect (and
            (not (at home))
            (at ?to)
            (not (current_day ?d_depart))
            (current_day ?d_arrive)
            (visited ?to) ; Mark the initial destination city as visited
        )
    )

    (:action fly
        :parameters (?from ?to - city ?d_depart ?d_arrive - day)
        :precondition (and
            (at ?from)
            (current_day ?d_depart)
            (next_day ?d_depart ?d_arrive)
            (has_flight ?from ?to) ; Direct flight must exist
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (not (current_day ?d_depart))
            (current_day ?d_arrive)
            (visited ?to) ; Mark the destination city as visited
        )
    )

    (:action stay_in_city
        :parameters (?c - city ?d_current ?d_next - day)
        :precondition (and
            (at ?c) ; Must be in the city to stay there
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next) ; Advance the day without changing location
            ; (visited ?c) is not added here as it's assumed to be set upon arrival
        )
    )

    (:action meet_friend_in_tallinn
        :parameters (?d_current - day)
        :precondition (and
            (at tallinn) ; Must be in Tallinn
            (current_day ?d_current)
            (day_is_between_9_and_15 ?d_current) ; Must be within the meeting window
            (not (tallinn_meeting_met)) ; Meeting has not yet occurred
        )
        :effect (tallinn_meeting_met) ; Mark the meeting as done
    )

    (:action return_home
        :parameters (?from - city ?d_depart ?d_arrive - day)
        :precondition (and
            (at ?from) ; Must be at a city to return home
            (current_day ?d_depart)
            (next_day ?d_depart ?d_arrive)
            (visited valencia) ; All required cities must have been visited
            (visited amsterdam)
            (visited tallinn)
            (tallinn_meeting_met) ; The meeting must have occurred
        )
        :effect (and
            (not (at ?from))
            (at home) ; Return to home location
            (not (current_day ?d_depart))
            (current_day ?d_arrive)
        )
    )
)