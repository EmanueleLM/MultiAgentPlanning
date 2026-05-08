(define (domain logistics25)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city - object
        location - object
        vehicle - object
        truck - vehicle
        airplane - vehicle
        package - object
    )

    (:predicates
        (at ?obj - (either package vehicle) ?loc - location)
        (in ?p - package ?v - vehicle)
        (in-city ?loc - location ?c - city)
        (airport ?loc - location)
    )

    ;; 1. Load package into truck
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

    ;; 2. Unload package from truck
    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location ?c - city)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
            (in-city ?l ?c)
        )
        :effect (and
            (not (in ?p ?t))
            (at ?p ?l)
        )
    )

    ;; 3. Load package into airplane
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

    ;; 4. Unload package from airplane
    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
        )
    )

    ;; 5. Drive a truck within a city
    (:action drive-truck
        :parameters (?t - truck ?lfrom - location ?lto - location ?c - city)
        :precondition (and
            (at ?t ?lfrom)
            (not (= ?lfrom ?lto))
            (in-city ?lfrom ?c)
            (in-city ?lto ?c)
        )
        :effect (and
            (not (at ?t ?lfrom))
            (at ?t ?lto)
        )
    )

    ;; 6. Fly an airplane between cities (must be between airports)
    (:action fly-airplane
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
            (not (at ?a ?lfrom))
            (at ?a ?lto)
        )
    )