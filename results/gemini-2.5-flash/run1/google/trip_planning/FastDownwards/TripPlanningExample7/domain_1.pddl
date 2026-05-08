(define (domain trip_planning_example_7)
    (:requirements :strips :typing :numeric-fluents :action-costs)
    (:types city)
    (:predicates
        (at ?c - city)
        (has_visited ?c - city)
        (direct_flight ?from ?to - city)
    )

    (:functions
        (total_days_spent)
        (days_in_venice)
        (days_in_dubrovnik)
        (days_in_istanbul)
        (total_stay_days_achieved) ; For maximizing total stay days
    )

    ;; Action to fly between cities
    (;:action fly
    ;  :parameters (?from ?to - city)
    ;  :precondition (and (at ?from)
    ;                     (direct_flight ?from ?to)
    ;                     (not (at ?to))) ; Ensure we are moving to a new city, implies single traveler
    ;  :effect (and (not (at ?from))
    ;               (at ?to)
    ;               (increase (total_days_spent) 1)
    ;               (has_visited ?to)))

    ;; Redefining fly, `(not (at ?to))` is redundant with `(not (at ?from))` for a single agent.
    (action fly
        :parameters (?from ?to - city)
        :precondition (and (at ?from)
                           (direct_flight ?from ?to))
        :effect (and (not (at ?from))
                     (at ?to)
                     (increase (total_days_spent) 1)
                     (has_visited ?to)))

    ;; Action to stay in Venice
    (action stay_in_venice
        :parameters ()
        :precondition (at venice)
        :effect (and (increase (total_days_spent) 1)
                     (increase (days_in_venice) 1)
                     (increase (total_stay_days_achieved) 1)))

    ;; Action to stay in Dubrovnik
    (action stay_in_dubrovnik
        :parameters ()
        :precondition (at dubrovnik)
        :effect (and (increase (total_days_spent) 1)
                     (increase (days_in_dubrovnik) 1)
                     (increase (total_stay_days_achieved) 1)))

    ;; Action to stay in Istanbul
    (action stay_in_istanbul
        :parameters ()
        :precondition (at istanbul)
        :effect (and (increase (total_days_spent) 1)
                     (increase (days_in_istanbul) 1)
                     (increase (total_stay_days_achieved) 1)))
)