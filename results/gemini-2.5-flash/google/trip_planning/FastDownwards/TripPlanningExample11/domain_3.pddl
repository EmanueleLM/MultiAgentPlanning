(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        day
        day_count
    )
    (:functions
        (total-cost)
    )
    (:predicates
        (at ?c - city)
        (direct_flight ?c1 ?c2 - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (conference_on_day_at ?d - day ?c - city)
        (conference_attended ?d - day ?c - city)
        ; Predicates to track days spent in each city using day_count objects
        (days_in_vienna ?dc - day_count)
        (days_in_vilnius ?dc - day_count)
        (days_in_valencia ?dc - day_count)
        (next_count ?dc1 ?dc2 - day_count)
    )

    ; Action to stay in Vienna on a non-conference day, increments Vienna's day count
    (:action stay_in_vienna
        :parameters (?d ?next_d - day ?curr_vc ?next_vc - day_count)
        :precondition (and
            (at vienna)
            (current_day ?d)
            (next_day ?d ?next_d)
            (not (conference_on_day_at ?d vienna)) ; No conference in Vienna on this day
            (days_in_vienna ?curr_vc)
            (next_count ?curr_vc ?next_vc)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_vienna ?curr_vc))
            (days_in_vienna ?next_vc)
            (increase (total-cost) 1)
        )
    )

    ; Action to stay in Vilnius on a non-conference day, increments Vilnius's day count
    (:action stay_in_vilnius
        :parameters (?d ?next_d - day ?curr_vc ?next_vc - day_count)
        :precondition (and
            (at vilnius)
            (current_day ?d)
            (next_day ?d ?next_d)
            (not (conference_on_day_at ?d vilnius)) ; No conference in Vilnius on this day
            (days_in_vilnius ?curr_vc)
            (next_count ?curr_vc ?next_vc)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_vilnius ?curr_vc))
            (days_in_vilnius ?next_vc)
            (increase (total-cost) 1)
        )
    )

    ; Action to stay in Valencia on a non-conference day, increments Valencia's day count
    (:action stay_in_valencia
        :parameters (?d ?next_d - day ?curr_vc ?next_vc - day_count)
        :precondition (and
            (at valencia)
            (current_day ?d)
            (next_day ?d ?next_d)
            (not (conference_on_day_at ?d valencia)) ; No conference in Valencia on this day
            (days_in_valencia ?curr_vc)
            (next_count ?curr_vc ?next_vc)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (days_in_valencia ?curr_vc))
            (days_in_valencia ?next_vc)
            (increase (total-cost) 1)
        )
    )

    ; Action to attend a conference in Valencia on a conference day, increments Valencia's day count
    (:action attend_conference_valencia
        :parameters (?d ?next_d - day ?curr_vc ?next_vc - day_count)
        :precondition (and
            (at valencia)
            (current_day ?d)
            (next_day ?d ?next_d)
            (conference_on_day_at ?d valencia) ; Must be a conference day in Valencia
            (not (conference_attended ?d valencia)) ; Ensure conference is attended only once
            (days_in_valencia ?curr_vc)
            (next_count ?curr_vc ?next_vc)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (conference_attended ?d valencia)
            (not (days_in_valencia ?curr_vc))
            (days_in_valencia ?next_vc)
            (increase (total-cost) 1)
        )
    )

    ; Action to travel between cities. Travel takes one day.
    ; The trip starts on day D and ends in city ?to on day Next_D.
    ; Day counts for cities are NOT incremented during travel day, as it's spent in transit.
    ; Cannot travel if there's a mandatory conference in the current city on day D.
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
            (increase (total-cost) 1)
        )
    )
)