(define (domain logistics)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        city - object
        location - object
        package - object
        vehicle - object
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?o - (or package vehicle) ?l - location)
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)
        (in ?p - package ?v - vehicle)
    )

    (:functions
        (total-cost)
    )

    ;; Truck Actions (Intra-City Movement)

    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location ?c - city)
        :precondition (and (at ?t ?l) (at ?p ?l) (in-city ?l ?c))
        :effect (and (in ?p ?t) (not (at ?p ?l)) (increase (total-cost) 1))
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location ?c - city)
        :precondition (and (in ?p ?t) (at ?t ?l) (in-city ?l ?c))
        :effect (and (at ?p ?l) (not (in ?p ?t)) (increase (total-cost) 1))
    )

    (:action drive-truck
        :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
        :precondition (and 
            (at ?t ?l1) 
            (in-city ?l1 ?c) 
            (in-city ?l2 ?c)
            (not (= ?l1 ?l2)) 
        )
        :effect (and 
            (at ?t ?l2) 
            (not (at ?t ?l1))
            (increase (total-cost) 1)
        )
    )

    ;; Airplane Actions (Inter-City Movement)

    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (at ?a ?l) (at ?p ?l) (is-airport ?l))
        :effect (and (in ?p ?a) (not (at ?p ?l)) (increase (total-cost) 1))
    )

    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (in ?p ?a) (at ?a ?l) (is-airport ?l))
        :effect (and (at ?p ?l) (not (in ?p ?a)) (increase (total-cost) 1))
    )

    (:action fly-airplane
        :parameters (?a - airplane ?l1 - location ?l2 - location ?c1 - city ?c2 - city)
        :precondition (and 
            (at ?a ?l1) 
            (is-airport ?l1) 
            (is-airport ?l2)
            (in-city ?l1 ?c1)
            (in-city ?l2 ?c2)
            (not (= ?c1 ?c2))
        )
        :effect (and 
            (at ?a ?l2) 
            (not (at ?a ?l1))
            (increase (total-cost) 1)
        )
    )
)