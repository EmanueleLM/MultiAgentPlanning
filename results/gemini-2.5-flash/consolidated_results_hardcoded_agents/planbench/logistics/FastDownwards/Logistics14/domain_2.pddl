(define (domain logistics-transport)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package - object
        city - object
        loc - object
        vehicle - object
        truck airplane - vehicle
    )

    (:predicates
        (at ?o - (either package vehicle) ?l - loc)
        (in ?p - package ?v - vehicle)
        (in-city ?l - loc ?c - city)
        (airport ?l - loc)
    )

    ;; Load a package into a truck
    (:action load-package-truck
        :parameters (?p - package ?t - truck ?l - loc)
        :precondition (and (at ?p ?l) (at ?t ?l))
        :effect (and (not (at ?p ?l)) (in ?p ?t))
    )

    ;; Load a package into an airplane
    (:action load-package-airplane
        :parameters (?p - package ?a - airplane ?l - loc)
        :precondition (and (at ?p ?l) (at ?a ?l))
        :effect (and (not (at ?p ?l)) (in ?p ?a))
    )

    ;; Unload a package from a truck
    (:action unload-package-truck
        :parameters (?p - package ?t - truck ?l - loc)
        :precondition (and (in ?p ?t) (at ?t ?l))
        :effect (and (not (in ?p ?t)) (at ?p ?l))
    )

    ;; Unload a package from an airplane
    (:action unload-package-airplane
        :parameters (?p - package ?a - airplane ?l - loc)
        :precondition (and (in ?p ?a) (at ?a ?l))
        :effect (and (not (in ?p ?a)) (at ?p ?l))
    )

    ;; Drive a truck within a city
    (:action drive-truck
        :parameters (?t - truck ?lfrom - loc ?lto - loc ?c - city)
        :precondition (and 
            (at ?t ?lfrom) 
            (in-city ?lfrom ?c) 
            (in-city ?lto ?c)
            (not (= ?lfrom ?lto))
        )
        :effect (and 
            (not (at ?t ?lfrom)) 
            (at ?t ?lto)
        )
    )

    ;; Fly an airplane between cities (via airports)
    (:action fly-airplane
        :parameters (?a - airplane ?lfrom - loc ?lto - loc ?cfrom - city ?cto - city)
        :precondition (and
            (at ?a ?lfrom)
            (airport ?lfrom)
            (airport ?lto)
            (in-city ?lfrom ?cfrom)
            (in-city ?lto ?cto)
            (not (= ?lfrom ?lto))
        )
        :effect (and
            (not (at ?a ?lfrom))
            (at ?a ?lto)
        )
    )
)