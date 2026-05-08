(define (domain jack_of_all_trades)
  :requirements :typing :negative-preconditions :strips
  :types package truck airplane location city
  :predicates
    (at ?p - package ?l - location)
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (location_in_city ?l - location ?c - city)
    (airport ?l - location)
    (same_city ?c1 - city ?c2 - city)
  )

  ; load a package into a truck at the same location
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?p ?l) (at_truck ?t ?l))
    :effect (and (not (at ?p ?l)) (in_truck ?p ?t))
  )

  ; unload a package from a truck to the truck's current location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in_truck ?p ?t) (at_truck ?t ?l))
    :effect (and (not (in_truck ?p ?t)) (at ?p ?l))
  )

  ; load a package into an airplane at the same airport location
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?p ?l) (at_airplane ?a ?l))
    :effect (and (not (at ?p ?l)) (in_airplane ?p ?a))
  )

  ; unload a package from an airplane to the airplane's current location
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in_airplane ?p ?a) (at_airplane ?a ?l))
    :effect (and (not (in_airplane ?p ?a)) (at ?p ?l))
  )

  ; drive a truck between two locations in the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at_truck ?t ?from) (location_in_city ?from ?c) (location_in_city ?to ?c))
    :effect (and (not (at_truck ?t ?from)) (at_truck ?t ?to))
  )

  ; fly an airplane between airports in different cities
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city)
    :precondition (and
                   (at_airplane ?a ?from)
                   (airport ?from)
                   (airport ?to)
                   (location_in_city ?from ?c_from)
                   (location_in_city ?to ?c_to)
                   (not (same_city ?c_from ?c_to))
                  )
    :effect (and (not (at_airplane ?a ?from)) (at_airplane ?a ?to))
  )