(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types location city - object vehicle - object truck airplane - vehicle package - object)

  (:predicates 
    (at ?vehicle - vehicle ?loc - location)
    (package_at ?package - package ?loc - location)
    (package_in_truck ?package - package ?truck - truck)
    (package_in_airplane ?package - package ?airplane - airplane)
    (airport ?loc - location)
    (in_city ?loc - location ?city - city))

  (:action load_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (at ?truck ?loc) (package_at ?pkg ?loc))
    :effect (and (not (package_at ?pkg ?loc)) (package_in_truck ?pkg ?truck)))

  (:action unload_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (at ?truck ?loc) (package_in_truck ?pkg ?truck))
    :effect (and (not (package_in_truck ?pkg ?truck)) (package_at ?pkg ?loc)))

  (:action load_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (at ?airplane ?loc) (airport ?loc) (package_at ?pkg ?loc))
    :effect (and (not (package_at ?pkg ?loc)) (package_in_airplane ?pkg ?airplane)))

  (:action unload_airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (at ?airplane ?loc) (airport ?loc) (package_in_airplane ?pkg ?airplane))
    :effect (and (not (package_in_airplane ?pkg ?airplane)) (package_at ?pkg ?loc)))

  (:action drive_truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?truck ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to)))

  (:action fly_airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and (at ?airplane ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?airplane ?from)) (at ?airplane ?to)))
)