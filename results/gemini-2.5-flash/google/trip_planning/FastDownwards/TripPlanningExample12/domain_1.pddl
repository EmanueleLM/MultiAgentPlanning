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
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (has_flight ?from ?to - city)
        (visited ?c - city)
        (tallinn_meeting_met)
        (day_is_between_9_and_15 ?d - day)
    )

    (:action fly
        :parameters (?from ?to - city ?d_depart ?d_arrive - day)
        :precondition (and
            (at ?from)
            (current_day ?d_depart)
            (next_day ?d_depart ?d_arrive)
            (has_flight ?from ?to)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (not (current_day ?d_depart))
            (current_day ?d_arrive)
            (visited ?to)
        )
    )

    (:action stay_in_city
        :parameters (?c - city ?d_current ?d_next - day)
        :precondition (and
            (at ?c)
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (visited ?c)
        )
    )

    (:action meet_friend_in_tallinn
        :parameters (?d_current - day)
        :precondition (and
            (at tallinn)
            (current_day ?d_current)
            (day_is_between_9_and_15 ?d_current)
            (not (tallinn_meeting_met))
        )
        :effect (tallinn_meeting_met)
    )
)