(define (domain logistics_domain)
    (:requirements :strips :typing :negative-preconditions)
    (:types location city vehicle truck airplane package)
    
    (:predicates
        (airport ?loc - location)
        (in_city ?loc - location ?city - city)
        (at ?entity - (either truck airplane package) ?loc - location)
        (in ?package - package ?vehicle - (either truck airplane))
    )
    
    (:action load_into_truck
        :parameters (?p - package ?t - truck ?loc - location)
        :precondition (and (at ?p ?loc) (at ?t ?loc))
        :effect (and (not (at ?p ?loc)) (in ?p ?t))
    )
    
    (:action unload_from_truck
        :parameters (?p - package ?t - truck ?loc - location)
        :precondition (and (in ?p ?t) (at ?t ?loc))
        :effect (and (at ?p ?loc) (not (in ?p ?t)))
    )
    
    (:action load_into_airplane
        :parameters (?p - package ?a - airplane ?loc - location)
        :precondition (and (at ?p ?loc) (at ?a ?loc))
        :effect (and (not (at ?p ?loc)) (in ?p ?a))
    )
    
    (:action unload_from_airplane
        :parameters (?p - package ?a - airplane ?loc - location)
        :precondition (and (in ?p ?a) (at ?a ?loc))
        :effect (and (at ?p ?loc) (not (in ?p ?a)))
    )
    
    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?city - city)
        :precondition (and (in_city ?from ?city) (in_city ?to ?city) (at ?t ?from))
        :effect (and (not (at ?t ?from)) (at ?t ?to))
    )
    
    (:action fly_airplane
        :parameters (?a - airplane ?from - location ?to - location)
        :precondition (and (airport ?from) (airport ?to) (at ?a ?from))
        :effect (and (not (at ?a ?from)) (at ?a ?to))
    )
)