(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        package
        city
        location
        vehicle
        truck - vehicle
        airplane - vehicle
    )
    (:predicates
        (at ?obj - (either package vehicle) ?loc - location)
        (in ?p - package ?v - vehicle)
        (in_city ?loc - location ?cit - city)
        (is_airport ?loc - location)
    )
    (:functions (total-cost))

    ;; Load a package into a truck
    (:action load_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?t)
            (increase (total-cost) 1)
        )
    )

    ;; Unload a package from a truck
    (:action unload_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (not (in ?p ?t))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; Drive a truck from one location to another within the same city
    (:action drive_truck
        :parameters (?t - truck ?lfrom - location ?lto - location ?c - city)
        :precondition (and
            (at ?t ?lfrom)
            (in_city ?lfrom ?c)
            (in_city ?lto ?c)
            (not (= ?lfrom ?lto))
        )
        :effect (and
            (not (at ?t ?lfrom))
            (at ?t ?lto)
            (increase (total-cost) 1)
        )
    )

    ;; Load a package into an airplane
    (:action load_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
            (is_airport ?l) ; Airplanes load/unload only at airports
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
            (increase (total-cost) 1)
        )
    )

    ;; Unload a package from an airplane
    (:action unload_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
            (is_airport ?l) ; Airplanes load/unload only at airports
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
            (increase (total-cost) 1)
        )
    )

    ;; Fly an airplane from one airport to another airport in different cities
    (:action fly_airplane
        :parameters (?a - airplane ?lfrom - location ?lto - location ?cfrom - city ?cto - city)
        :precondition (and
            (at ?a ?lfrom)
            (is_airport ?lfrom)
            (is_airport ?lto)
            (in_city ?lfrom ?cfrom)
            (in_city ?lto ?cto)
            (not (= ?cfrom ?cto)) ; Must fly between different cities
            (not (= ?lfrom ?lto)) ; From and To locations must be distinct
        )
        :effect (and
            (not (at ?a ?lfrom))
            (at ?a ?lto)
            (increase (total-cost) 1)
        )
    )
)