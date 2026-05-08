(define (domain logistics_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
     city location vehicle - object
     truck airplane - vehicle
     package - object)

  (:predicates 
    (at ?package - package ?location - location)
    (in-truck ?package - package ?truck - truck)
    (in-airplane ?package - package ?airplane - airplane)
    (at-truck ?truck - truck ?location - location)
    (at-airplane ?airplane - airplane ?location - location)
    (airport ?location - location)
    (in-city ?location - location ?city - city))

  (:action load-package-into-truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (at ?package ?location) (at-truck ?truck ?location))
    :effect (and (not (at ?package ?location)) (in-truck ?package ?truck)))

  (:action unload-package-from-truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (in-truck ?package ?truck) (at-truck ?truck ?location))
    :effect (and (not (in-truck ?package ?truck)) (at ?package ?location)))

  (:action load-package-into-airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (at ?package ?location) (at-airplane ?airplane ?location) (airport ?location))
    :effect (and (not (at ?package ?location)) (in-airplane ?package ?airplane)))

  (:action unload-package-from-airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (in-airplane ?package ?airplane) (at-airplane ?airplane ?location) (airport ?location))
    :effect (and (not (in-airplane ?package ?airplane)) (at ?package ?location)))

  (:action drive-truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and 
                   (at-truck ?truck ?from) 
                   (in-city ?from ?city) 
                   (in-city ?to ?city))
    :effect (and 
             (not (at-truck ?truck ?from)) 
             (at-truck ?truck ?to)))

  (:action fly-airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and 
                   (at-airplane ?airplane ?from) 
                   (airport ?from) 
                   (airport ?to))
    :effect (and 
             (not (at-airplane ?airplane ?from)) 
             (at-airplane ?airplane ?to)))