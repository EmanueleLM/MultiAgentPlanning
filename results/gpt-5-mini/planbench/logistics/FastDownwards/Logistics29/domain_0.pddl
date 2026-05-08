(define (domain logistics_orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  ;; Type hierarchy:
  ;; truck and airplane are subtypes of vehicle.
  ;; vehicle and package are subtypes of obj so At can accept both kinds.
  (:types
    truck airplane - vehicle
    vehicle package - obj
    city location obj
  )

  (:predicates
    ;; A unified At predicate for packages and vehicles (packages and vehicles are subtypes of obj)
    (At ?o - obj ?l - location)

    ;; Package is inside a vehicle (truck or airplane)
    (In ?p - package ?v - vehicle)

    ;; Location to city membership
    (InCity ?l - location ?c - city)

    ;; Location is an airport
    (Airport ?l - location)

    ;; A truck assigned to a city (exactly one truck fact per city is enforced in the problem)
    (AssignedTruck ?c - city ?t - truck)

    ;; Type convenience predicates (kept explicit as required by the audit)
    (IsTruck ?t - truck)
    (IsAirplane ?a - airplane)

    ;; Package is free (not loaded into any vehicle).
    ;; This predicate enforces "not-in-any-vehicle" invariant in a planner-friendly way.
    (Free ?p - package)

    ;; DifferentCity expresses that two cities are distinct (used by airplane fly precondition).
    (DifferentCity ?c1 - city ?c2 - city)
  )

  ;; Truck manager actions (namespaced with tm-)
  (:action tm-load
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (At ?p ?l)
      (At ?t ?l)
      (InCity ?l ?c)
      (AssignedTruck ?c ?t)
      (IsTruck ?t)
      (Free ?p)
    )
    :effect (and
      (In ?p ?t)
      (not (At ?p ?l))
      (not (Free ?p))
    )
  )

  (:action tm-unload
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (In ?p ?t)
      (At ?t ?l)
      (InCity ?l ?c)
      (AssignedTruck ?c ?t)
      (IsTruck ?t)
    )
    :effect (and
      (At ?p ?l)
      (not (In ?p ?t))
      (Free ?p)
    )
  )

  (:action tm-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (At ?t ?from)
      (InCity ?from ?c)
      (InCity ?to ?c)
      (AssignedTruck ?c ?t)
      (IsTruck ?t)
    )
    :effect (and
      (At ?t ?to)
      (not (At ?t ?from))
      ;; packages inside the truck remain In ?p ?t implicitly (no change)
    )
  )

  ;; Air manager actions (namespaced with am-)
  (:action am-load-into-airplane
    :parameters (?p - package ?a - airplane ?ap - location)
    :precondition (and
      (At ?p ?ap)
      (At ?a ?ap)
      (Airport ?ap)
      (IsAirplane ?a)
      (Free ?p)
    )
    :effect (and
      (In ?p ?a)
      (not (At ?p ?ap))
      (not (Free ?p))
    )
  )

  (:action am-unload-from-airplane
    :parameters (?p - package ?a - airplane ?ap - location)
    :precondition (and
      (In ?p ?a)
      (At ?a ?ap)
      (Airport ?ap)
      (IsAirplane ?a)
    )
    :effect (and
      (At ?p ?ap)
      (not (In ?p ?a))
      (Free ?p)
    )
  )

  (:action am-fly-airplane
    :parameters (?a - airplane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (At ?a ?from)
      (Airport ?from)
      (Airport ?to)
      (InCity ?from ?cfrom)
      (InCity ?to ?cto)
      (DifferentCity ?cfrom ?cto)
      (IsAirplane ?a)
    )
    :effect (and
      (At ?a ?to)
      (not (At ?a ?from))
      ;; packages In ?p ?a remain In ?p ?a across the flight
    )
  )
)