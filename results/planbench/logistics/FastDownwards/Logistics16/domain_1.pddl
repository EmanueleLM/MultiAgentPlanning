(define (domain logistics-domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        location
        package
        truck
        airplane
    )

    (:predicates
        (at ?obj - (either package truck airplane) ?loc - location)
        (in-city ?loc - location ?city - city)
        (is-airport ?loc - location)
        (in-truck ?p - package ?t - truck)
        (in-airplane ?p - package ?a - airplane)
    )
    
    (:functions
        (total-cost)
    )

    ;; Move truck within a city
    (:action drive-truck
        :parameters (?t - truck ?l-from - location ?l-to - location ?c - city)
        :precondition (and (at ?t ?l-from)
                           (in-city ?l-from ?c)
                           (in-city ?l-to ?c)
                           (not (= ?l-from ?l-to)))
        :effect (and (not (at ?t ?l-from))
                     (at ?t ?l-to)
                     (increase (total-cost) 1)))

    ;; Load package into truck
    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (at ?p ?l)
                           (at ?t ?l))
        :effect (and (not (at ?p ?l))
                     (in-truck ?p ?t)
                     (increase (total-cost) 1)))

    ;; Unload package from truck
    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (in-truck ?p ?t)
                           (at ?t ?l))
        :effect (and (not (in-truck ?p ?t))
                     (at ?p ?l)
                     (increase (total-cost) 1)))

    ;; Fly airplane between airports
    (:action fly-airplane
        :parameters (?a - airplane ?l-from - location ?l-to - location)
        :precondition (and (at ?a ?l-from)
                           (is-airport ?l-from)
                           (is-airport ?l-to)
                           (not (= ?l-from ?l-to)))
        :effect (and (not (at ?a ?l-from))
                     (at ?a ?l-to)
                     (increase (total-cost) 1)))

    ;; Load package into airplane (must be at an airport)
    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (at ?p ?l)
                           (at ?a ?l)
                           (is-airport ?l))
        :effect (and (not (at ?p ?l))
                     (in-airplane ?p ?a)
                     (increase (total-cost) 1)))

    ;; Unload package from airplane (must be at an airport)
    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (in-airplane ?p ?a)
                           (at ?a ?l)
                           (is-airport ?l))
        :effect (and (not (in-airplane ?p ?a))
                     (at ?p ?l)
                     (increase (total-cost) 1)))
)