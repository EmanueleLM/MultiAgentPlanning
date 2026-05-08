(define (domain logistics)
  (:requirements :strips :typing)
  (:types
    city location vehicle truck airplane package
  )
  (:predicates
    (at ?obj - (either vehicle package) ?loc - location)
    (in_city ?loc - location ?city - city)
    (airport ?loc - location)
    (in_truck ?pkg - package ?tr - truck)
    (in_airplane ?pkg - package ?ap - airplane)
    (empty ?tr - truck)
    (at_truck ?tr - truck ?loc - location)
    (at_airplane ?ap - airplane ?loc - location)
  )
  
  (:action load_truck
    :parameters (?pkg - package ?tr - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at_truck ?tr ?loc) (empty ?tr))
    :effect (and (not (at ?pkg ?loc)) (in_truck ?pkg ?tr) (not (empty ?tr)))
  )
  
  (:action unload_truck
    :parameters (?pkg - package ?tr - truck ?loc - location)
    :precondition (and (in_truck ?pkg ?tr) (at_truck ?tr ?loc))
    :effect (and (not (in_truck ?pkg ?tr)) (at ?pkg ?loc) (empty ?tr))
  )
  
  (:action drive_truck
    :parameters (?tr - truck ?from - location ?to - location ?city - city)
    :precondition (and (at_truck ?tr ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at_truck ?tr ?from)) (at_truck ?tr ?to))
  )
  
  (:action load_airplane
    :parameters (?pkg - package ?ap - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (at_airplane ?ap ?loc))
    :effect (and (not (at ?pkg ?loc)) (in_airplane ?pkg ?ap))
  )
  
  (:action unload_airplane
    :parameters (?pkg - package ?ap - airplane ?loc - location)
    :precondition (and (in_airplane ?pkg ?ap) (at_airplane ?ap ?loc))
    :effect (and (not (in_airplane ?pkg ?ap)) (at ?pkg ?loc))
  )
  
  (:action fly_airplane
    :parameters (?ap - airplane ?from - location ?to - location)
    :precondition (and (at_airplane ?ap ?from) (airport ?from) (airport ?to))
    :effect (and (not (at_airplane ?ap ?from)) (at_airplane ?ap ?to))
  )
)