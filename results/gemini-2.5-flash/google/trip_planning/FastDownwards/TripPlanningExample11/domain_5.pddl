(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        day
    )
    (:predicates
        (at ?c - city)
        (direct_flight ?c1 ?c2 - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (conference_on_day_at ?d - day ?c - city)
        (conference_attended ?d - day ?c - city)
    )
    (:functions (total-cost)) ; Declare the fluent for tracking total cost

    ; Action to stay in Vienna on a non-conference day.
    ; Consumes one day and increments cost.
    (:action stay_in_vienna
        :parameters (?d ?next_d - day)
        :precondition (and
            (at vienna)
            (current_day ?d)
            (next_day ?d ?next_d)
            (not (conference_on_day_at ?d vienna)) ; No conference in Vienna on this day
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (increase (total-cost) 1) ; Each action costs 1
        )
    )

    ; Action to stay in Vilnius on a non-conference day.
    ; Consumes one day and increments cost.
    (:action stay_in_vilnius
        :parameters (?d ?next_d - day)
        :precondition (and
            (at vilnius)
            (current_day ?d)
            (next_day ?d ?next_d)
            (not (conference_on_day_at ?d vilnius)) ; No conference in Vilnius on this day
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (increase (total-cost) 1) ; Each action costs 1
        )
    )

    ; Action to stay in Valencia on a non-conference day.
    ; Consumes one day and increments cost.
    (:action stay_in_valencia
        :parameters (?d ?next_d - day)
        :precondition (and
            (at valencia)
            (current_day ?d)
            (next_day ?d ?next_d)
            (not (conference_on_day_at ?d valencia)) ; No conference in Valencia on this day
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (increase (total-cost) 1) ; Each action costs 1
        )
    )

    ; Action to attend a conference in Valencia on a conference day.
    ; Consumes one day, marks the conference as attended, and increments cost.
    (:action attend_conference_valencia
        :parameters (?d ?next_d - day)
        :precondition (and
            (at valencia)
            (current_day ?d)
            (next_day ?d ?next_d)
            (conference_on_day_at ?d valencia) ; Must be a conference day in Valencia
            (not (conference_attended ?d valencia)) ; Ensure conference is attended only once
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (conference_attended ?d valencia)
            (increase (total-cost) 1) ; Each action costs 1
        )
    )

    ; Action to travel between cities.
    ; Travel takes one day and increments cost. Cannot travel if there's a mandatory conference
    ; in the current city on the current day.
    (:action travel_to
        :parameters (?from ?to - city ?d - day ?next_d - day)
        :precondition (and
            (at ?from)
            (current_day ?d)
            (next_day ?d ?next_d)
            (direct_flight ?from ?to)
            (not (= ?from ?to))
            (not (conference_on_day_at ?d ?from)) ; Cannot travel away if a conference is scheduled in ?from on ?d
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (not (current_day ?d))
            (current_day ?next_d)
            (increase (total-cost) 1) ; Each action costs 1
        )
    )
)