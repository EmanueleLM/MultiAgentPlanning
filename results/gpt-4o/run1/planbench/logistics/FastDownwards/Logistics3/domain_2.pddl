(define (domain logistics_domain)
    (:requirements :strips :typing :negative-preconditions)
    (:types 
        city 
        location
        vehicle 
        truck - vehicle
        airplane - vehicle
        package)
    (:predicates 
        (at ?entity - (either package vehicle) ?location - location)
        (in-city ?location - location ?city - city)
        (is-airport ?location - location)
        (in ?package - package ?vehicle - vehicle))
    (:action load-package-into-truck
        :parameters (?package - package ?truck - truck ?location - location)
        :precondition (and 
            (at ?package ?location) 
            (at ?truck ?location) 
            (not (in ?package ?truck)))
        :effect (and 
            (not (at ?package ?location)) 
            (in ?package ?truck)))
    (:action unload-package-from-truck
        :parameters (?package - package ?truck - truck ?location - location)
        :precondition (and 
            (in ?package ?truck) 
            (at ?truck ?location))
        :effect (and 
            (at ?package ?location) 
            (not (in ?package ?truck))))
    (:action load-package-into-airplane
        :parameters (?package - package ?airplane - airplane ?location - location)
        :precondition (and 
            (at ?package ?location) 
            (at ?airplane ?location) 
            (not (in ?package ?airplane)))
        :effect (and 
            (not (at ?package ?location)) 
            (in ?package ?airplane)))
    (:action unload-package-from-airplane
        :parameters (?package - package ?airplane - airplane ?location - location)
        :precondition (and 
            (in ?package ?airplane) 
            (at ?airplane ?location))
        :effect (and 
            (at ?package ?location) 
            (not (in ?package ?airplane))))
    (:action drive-truck
        :parameters (?truck - truck ?from - location ?to - location ?city - city)
        :precondition (and 
            (at ?truck ?from) 
            (in-city ?from ?city) 
            (in-city ?to ?city))
        :effect (and 
            (not (at ?truck ?from)) 
            (at ?truck ?to)))
    (:action fly-airplane
        :parameters (?airplane - airplane ?from - location ?to - location)
        :precondition (and 
            (at ?airplane ?from) 
            (is-airport ?from) 
            (is-airport ?to))
        :effect (and 
            (not (at ?airplane ?from)) 
            (at ?airplane ?to))))