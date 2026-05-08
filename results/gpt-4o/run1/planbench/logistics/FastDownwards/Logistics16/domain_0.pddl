(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location city truck airplane package)
  
  (:predicates
    (at_truck ?truck - truck ?location - location)
    (at_airplane ?airplane - airplane ?location - location)
    (at_package ?package - package ?location - location)
    (in_truck ?package - package ?truck - truck)
    (in_airplane ?package - package ?airplane - airplane)
    (airport ?location - location)
    (in_city ?location - location ?city - city))

  (:action load_package_truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (at_package ?package ?location)
                       (at_truck ?truck ?location))
    :effect (and (not (at_package ?package ?location))
                 (in_truck ?package ?truck)))

  (:action unload_package_truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and (in_truck ?package ?truck)
                       (at_truck ?truck ?location))
    :effect (and (not (in_truck ?package ?truck))
                 (at_package ?package ?location)))

  (:action load_package_airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (at_package ?package ?location)
                       (at_airplane ?airplane ?location))
    :effect (and (not (at_package ?package ?location))
                 (in_airplane ?package ?airplane)))

  (:action unload_package_airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and (in_airplane ?package ?airplane)
                       (at_airplane ?airplane ?location))
    :effect (and (not (in_airplane ?package ?airplane))
                 (at_package ?package ?location)))

  (:action drive_truck
    :parameters (?truck - truck ?from_location - location ?to_location - location ?city - city)
    :precondition (and (at_truck ?truck ?from_location)
                       (in_city ?from_location ?city)
                       (in_city ?to_location ?city))
    :effect (and (not (at_truck ?truck ?from_location))
                 (at_truck ?truck ?to_location)))

  (:action fly_airplane
    :parameters (?airplane - airplane ?from_location - location ?to_location - location)
    :precondition (and (at_airplane ?airplane ?from_location)
                       (airport ?from_location)
                       (airport ?to_location))
    :effect (and (not (at_airplane ?airplane ?from_location))
                 (at_airplane ?airplane ?to_location))))