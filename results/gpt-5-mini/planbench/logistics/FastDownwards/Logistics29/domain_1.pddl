(define (domain logistics_orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    vehicle - object
    truck airplane - vehicle
    package - object
    city
    location
  )

  (:predicates
    ;; generic location-of for both packages and vehicles (objects are of type object)
    (at ?o - object ?l - location)

    ;; package is inside a vehicle (truck or airplane)
    (in ?p - package ?v - vehicle)

    ;; location -> city membership
    (in_city ?l - location ?c - city)

    ;; location is an airport
    (airport ?l - location)

    ;; which truck is assigned to which city (exactly-one invariants encoded in the problem)
    (assigned_truck ?c - city ?t - truck)

    ;; package is not loaded in any vehicle (planner-friendly "free" flag)
    (free ?p - package)

    ;; two cities are distinct (used by airplane fly precondition)
    (different_city ?c1 - city ?c2 - city)
  )

  ;; Truck manager actions (namespaced tm-)
  (:action tm-load
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
      (in_city ?l ?c)
      (assigned_truck ?c ?t)
      (free ?p)
    )
    :effect (and
      (in ?p ?t)
      (not (at ?p ?l))
      (not (free ?p))
    )
  )

  (:action tm-unload
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l)
      (in_city ?l ?c)
      (assigned_truck ?c ?t)
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?t))
      (free ?p)
    )
  )

  (:action tm-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (assigned_truck ?c ?t)
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
      ;; packages inside the truck remain (no change to (in ?p ?t))
    )
  )

  ;; Air manager actions (namespaced am-)
  (:action am-load-into-airplane
    :parameters (?p - package ?a - airplane ?ap - location)
    :precondition (and
      (at ?p ?ap)
      (at ?a ?ap)
      (airport ?ap)
      (free ?p)
    )
    :effect (and
      (in ?p ?a)
      (not (at ?p ?ap))
      (not (free ?p))
    )
  )

  (:action am-unload-from-airplane
    :parameters (?p - package ?a - airplane ?ap - location)
    :precondition (and
      (in ?p ?a)
      (at ?a ?ap)
      (airport ?ap)
    )
    :effect (and
      (at ?p ?ap)
      (not (in ?p ?a))
      (free ?p)
    )
  )

  (:action am-fly-airplane
    :parameters (?a - airplane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
      (in_city ?from ?cfrom)
      (in_city ?to ?cto)
      (different_city ?cfrom ?cto)
    )
    :effect (and
      (at ?a ?to)
      (not (at ?a ?from))
      ;; packages inside the airplane remain In ?p ?a across the flight
    )
  )
)