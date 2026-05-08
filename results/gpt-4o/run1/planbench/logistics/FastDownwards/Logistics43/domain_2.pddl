(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    city 
    location 
    vehicle 
    truck - vehicle
    airplane - vehicle
    package)
  (:predicates
    (at ?entity - (either vehicle package) ?location - location)
    (in ?package - package ?vehicle - vehicle)
    (airport ?location - location)
    (in_city ?location - location ?city - city))
  (:action load-into-truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (at ?package ?location) (at ?truck ?location))
    :effect (and (not (at ?package ?location)) (in ?package ?truck)))
  (:action unload-from-truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (in ?package ?truck) (at ?truck ?location))
    :effect (and (at ?package ?location) (not (in ?package ?truck))))
  (:action load-into-airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (at ?package ?location) (at ?airplane ?location) (airport ?location))
    :effect (and (not (at ?package ?location)) (in ?package ?airplane)))
  (:action unload-from-airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (in ?package ?airplane) (at ?airplane ?location))
    :effect (and (at ?package ?location) (not (in ?package ?airplane))))
  (:action drive-truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?truck ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to)))
  (:action fly-airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at ?airplane ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?airplane ?from)) (at ?airplane ?to)))
)