(define (domain logistics)
  (:requirements :strips :typing)
  (:types
    city
    location
    package
    truck
    airplane
  )
  (:predicates
    (at ?obj - (either package truck airplane) ?loc - location)
    (in-truck ?pkg - package ?t - truck)
    (in-airplane ?pkg - package ?a - airplane)
    (loc-in-city ?loc - location ?c - city)
    (is-airport ?loc - location)
  )

  ;; Action: Load a package into a truck
  (:action load_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in-truck ?p ?t)
    )
  )

  ;; Action: Unload a package from a truck
  (:action unload_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in-truck ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at ?p ?l)
    )
  )

  ;; Action: Load a package into an airplane
  (:action load_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in-airplane ?p ?a)
    )
  )

  ;; Action: Unload a package from an airplane
  (:action unload_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in-airplane ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at ?p ?l)
    )
  )

  ;; Action: Drive a truck from one location to another within the same city
  (:action drive_truck
    :parameters (?t - truck ?l_from - location ?l_to - location ?c - city)
    :precondition (and
      (at ?t ?l_from)
      (loc-in-city ?l_from ?c)
      (loc-in-city ?l_to ?c)
      (not (= ?l_from ?l_to)) ; Ensure actual movement
    )
    :effect (and
      (not (at ?t ?l_from))
      (at ?t ?l_to)
    )
  )

  ;; Action: Fly an airplane from one airport to another airport
  (:action fly_airplane
    :parameters (?a - airplane ?l_from - location ?l_to - location)
    :precondition (and
      (at ?a ?l_from)
      (is-airport ?l_from)
      (is-airport ?l_to)
      (not (= ?l_from ?l_to)) ; Ensure actual flight
    )
    :effect (and
      (not (at ?a ?l_from))
      (at ?a ?l_to)
    )
  )