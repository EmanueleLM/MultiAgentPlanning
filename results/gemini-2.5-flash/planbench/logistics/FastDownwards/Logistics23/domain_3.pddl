(define (domain Logistics23_Domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        location
        movable ; New supertype for objects that can be "at" a location
        vehicle - movable
        truck - vehicle
        airplane - vehicle
        package - movable ; package is now a subtype of movable
    )
    (:predicates
        (at ?obj - movable ?loc - location) ; Corrected type to refer to the common supertype
        (in-city ?loc - location ?city - city)
        (is-airport ?loc - location)
        (on ?pkg - package ?veh - vehicle)
        (road-connected ?loc1 - location ?loc2 - location)
    )
    (:functions
        (total-cost)
    )

    ;; Truck Actions
    (:action drive-truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?t ?from)
            (in-city ?from ?c)
            (in-city ?to ?c)
            (road-connected ?from ?to)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            (increase (total-cost) 1)
        )
    )

    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (on ?p ?t)
            (increase (total-cost) 1)
        )
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (on ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (not (on ?p ?t))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; Airplane Actions
    (:action fly-airplane
        :parameters (?a - airplane ?from - location ?to - location ?c1 - city ?c2 - city)
        :precondition (and
            (at ?a ?from)
            (is-airport ?from)
            (is-airport ?to)
            (in-city ?from ?c1)
            (in-city ?to ?c2)
            (not (= ?c1 ?c2))
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
            (increase (total-cost) 10) ; Higher cost for air travel
        )
    )

    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (on ?p ?a)
            (increase (total-cost) 1)
        )
    )

    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (on ?p ?a)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (not (on ?p ?a))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )