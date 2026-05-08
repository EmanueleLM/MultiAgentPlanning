(define (domain logistics31)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    package
    truck
    airplane
  )
  (:predicates
    (at ?obj - (package truck airplane) ?l - location)
    (in ?p - package ?v - (truck airplane))
    (loc-in-city ?l - location ?c - city)
    (is-airport ?l - location)
  )

  ;; Action: Load a package into a truck
  (:action load-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )

  ;; Action: Load a package into an airplane
  (:action load-package-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )

  ;; Action: Unload a package from a truck
  (:action unload-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
    )
  )

  ;; Action: Unload a package from an airplane
  (:action unload-package-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )

  ;; Action: Drive a truck from one location to another within the same city
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (loc-in-city ?from ?c)
      (loc-in-city ?to ?c)
      (not (= ?from ?to)) ; Truck must move to a different location
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Action: Fly an airplane from one city to another city via airports
  (:action fly-airplane
    :parameters (?a - airplane ?from_loc - location ?to_loc - location ?from_city - city ?to_city - city)
    :precondition (and
      (at ?a ?from_loc)
      (is-airport ?from_loc)
      (is-airport ?to_loc)
      (loc-in-city ?from_loc ?from_city)
      (loc-in-city ?to_loc ?to_city)
      (not (= ?from_city ?to_city)) ; Must fly between different cities
    )
    :effect (and
      (not (at ?a ?from_loc))
      (at ?a ?to_loc)
    )
  )
)