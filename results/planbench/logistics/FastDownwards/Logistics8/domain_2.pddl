(define (domain logistics8)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        location
        physical-object 
        package - physical-object
        vehicle - physical-object
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?x - physical-object ?l - location)
        (in ?p - package ?v - vehicle)
        (in-city ?l - location ?c - city)
        (airport ?l - location)
    )

    (:functions
        (total-cost)
    )

    ;; 1. Truck movement (within city)
    (:action drive
        :parameters (?t - truck ?lfrom - location ?lto - location ?c - city)
        :precondition (and
            (at ?t ?lfrom)
            (in-city ?lfrom ?c)
            (in-city ?lto ?c)
            (not (= ?lfrom ?lto))
        )
        :effect (and
            (at ?t ?lto)
            (not (at ?t ?lfrom))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Airplane movement (between airport cities)
    (:action fly
        :parameters (?a - airplane ?lfrom - location ?lto - location ?cfrom - city ?cto - city)
        :precondition (and
            (at ?a ?lfrom)
            (airport ?lfrom)
            (airport ?lto)
            (in-city ?lfrom ?cfrom)
            (in-city ?lto ?cto)
            (not (= ?cfrom ?cto))
        )
        :effect (and
            (at ?a ?lto)
            (not (at ?a ?lfrom))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Load package into vehicle
    (:action load
        :parameters (?p - package ?v - vehicle ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?v ?l)
        )
        :effect (and
            (in ?p ?v)
            (not (at ?p ?l))
            (increase (total-cost) 1)
        )
    )

    ;; 4. Unload package from vehicle
    (:action unload
        :parameters (?p - package ?v - vehicle ?l - location)
        :precondition (and
            (in ?p ?v)
            (at ?v ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?v))
            (increase (total-cost) 1)
        )
    )