(define (domain unified-logistics)
    (:requirements :strips :typing :negative-preconditions :equality)
    (:types
        city
        location
        movable
        package - movable
        vehicle - movable
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?o - movable ?l - location)     ; Object O is at Location L
        (in ?p - package ?v - vehicle)      ; Package P is loaded onto Vehicle V
        (in-city ?l - location ?c - city)   ; Location L belongs to city C
        (road-connection ?l1 - location ?l2 - location ?c - city) ; L1 and L2 are connected roads within City C
    )

    ;; 1. Load package onto TRUCK (Intra-city handling)
    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location ?c - city)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
            (in-city ?l ?c)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?t)
        )
    )

    ;; 2. Unload package from TRUCK (Intra-city handling)
    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location ?c - city)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
            (in-city ?l ?c)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?t))
        )
    )

    ;; 3. Drive TRUCK within a city (Intra-city movement)
    (:action drive
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and
            (at ?t ?l1)
            (road-connection ?l1 ?l2 ?c)
            (in-city ?l1 ?c)
            (in-city ?l2 ?c)
        )
        :effect (and
            (not (at ?t ?l1))
            (at ?t ?l2)
        )
    )

    ;; 4. Load package onto AIRPLANE (Inter-city handling prep)
    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
        )
    )

    ;; 5. Unload package from AIRPLANE (Inter-city handling delivery)
    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?a))
        )
    )

    ;; 6. Fly AIRPLANE between cities (Inter-city movement)
    (:action fly
        :parameters (?a - airplane ?l_from - location ?l_to - location ?c_from - city ?c_to - city)
        :precondition (and
            (at ?a ?l_from)
            (in-city ?l_from ?c_from)
            (in-city ?l_to ?c_to)
            (not (= ?c_from ?c_to)) ; Must be inter-city travel
        )
        :effect (and
            (not (at ?a ?l_from))
            (at ?a ?l_to)
        )
    )
)