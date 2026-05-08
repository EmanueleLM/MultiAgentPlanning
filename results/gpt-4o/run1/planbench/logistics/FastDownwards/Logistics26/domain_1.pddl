(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    plane truck package location city
  )

  (:predicates
    (at_plane ?plane - plane ?location - location)
    (at_truck ?truck - truck ?location - location)
    (at_package ?package - package ?location - location)
    (in_truck ?package - package ?truck - truck)
    (in_plane ?package - package ?plane - plane)
    (is_airport ?location - location)
    (in_city ?location - location ?city - city)
  )

  (:action load_package_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (at_package ?pkg ?loc) (at_truck ?truck ?loc))
    :effect (and (not (at_package ?pkg ?loc)) (in_truck ?pkg ?truck))
  )

  (:action unload_package_truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (in_truck ?pkg ?truck) (at_truck ?truck ?loc))
    :effect (and (not (in_truck ?pkg ?truck)) (at_package ?pkg ?loc))
  )

  (:action load_package_plane
    :parameters (?pkg - package ?plane - plane ?loc - location)
    :precondition (and (at_package ?pkg ?loc) (at_plane ?plane ?loc))
    :effect (and (not (at_package ?pkg ?loc)) (in_plane ?pkg ?plane))
  )

  (:action unload_package_plane
    :parameters (?pkg - package ?plane - plane ?loc - location)
    :precondition (and (in_plane ?pkg ?plane) (at_plane ?plane ?loc))
    :effect (and (not (in_plane ?pkg ?plane)) (at_package ?pkg ?loc))
  )

  (:action drive_truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at_truck ?truck ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at_truck ?truck ?from)) (at_truck ?truck ?to))
  )

  (:action fly_plane
    :parameters (?plane - plane ?from - location ?to - location)
    :precondition (and (at_plane ?plane ?from) (is_airport ?from) (is_airport ?to))
    :effect (and (not (at_plane ?plane ?from)) (at_plane ?plane ?to))
  )
)