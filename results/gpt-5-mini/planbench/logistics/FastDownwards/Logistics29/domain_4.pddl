(define (domain logistics_orchestrated)
  (:requirements :strips :typing)
  (:types
    package
    vehicle
    truck airplane - vehicle
    city
    location
  )

  (:predicates
    ;; package at a location
    (at_package ?p - package ?l - location)

    ;; truck at a location
    (at_truck ?t - truck ?l - location)

    ;; airplane at a location
    (at_airplane ?a - airplane ?l - location)

    ;; package is inside a vehicle (truck or airplane)
    (in_vehicle ?p - package ?v - vehicle)

    ;; location -> city membership
    (in_city ?l - location ?c - city)

    ;; location is an airport
    (airport ?l - location)

    ;; which truck is assigned to which city (one truck per city)
    (truck_in_city ?t - truck ?c - city)

    ;; two cities are distinct (used by airplane fly precondition)
    (different_city ?c1 - city ?c2 - city)
  )

  ;; Truck manager actions (prefix tm-)
  (:action tm-load
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (at_package ?p ?l)
      (at_truck ?t ?l)
      (in_city ?l ?c)
      (truck_in_city ?t ?c)
    )
    :effect (and
      (in_vehicle ?p ?t)
      (not (at_package ?p ?l))
    )
  )

  (:action tm-unload
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (in_vehicle ?p ?t)
      (at_truck ?t ?l)
      (in_city ?l ?c)
      (truck_in_city ?t ?c)
    )
    :effect (and
      (at_package ?p ?l)
      (not (in_vehicle ?p ?t))
    )
  )

  (:action tm-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (truck_in_city ?t ?c)
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  ;; Air manager actions (prefix am-)
  (:action am-load-into-airplane
    :parameters (?p - package ?a - airplane ?ap - location ?c - city)
    :precondition (and
      (at_package ?p ?ap)
      (at_airplane ?a ?ap)
      (airport ?ap)
      (in_city ?ap ?c)
    )
    :effect (and
      (in_vehicle ?p ?a)
      (not (at_package ?p ?ap))
    )
  )

  (:action am-unload-from-airplane
    :parameters (?p - package ?a - airplane ?ap - location ?c - city)
    :precondition (and
      (in_vehicle ?p ?a)
      (at_airplane ?a ?ap)
      (airport ?ap)
      (in_city ?ap ?c)
    )
    :effect (and
      (at_package ?p ?ap)
      (not (in_vehicle ?p ?a))
    )
  )

  (:action am-fly-airplane
    :parameters (?a - airplane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (in_city ?from ?cfrom)
      (in_city ?to ?cto)
      (different_city ?cfrom ?cto)
    )
    :effect (and
      (at_airplane ?a ?to)
      (not (at_airplane ?a ?from))
    )
  )
)