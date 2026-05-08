(define (domain city-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    vehicle
    truck - vehicle
    airplane - vehicle
    package
  )

  ;; Static predicates / typing-like predicates
  (:predicates
    (in-city ?loc - location ?c - city)
    (airport ?loc - location)
    (truck-type ?t - truck)        ;; optional explicit typing predicates (informative)
    (airplane-type ?a - airplane)  ;; optional explicit typing predicates (informative)

    ;; Typed position predicates to avoid ambiguity across entity kinds
    (at-truck ?t - truck ?loc - location)
    (at-airplane ?a - airplane ?loc - location)
    (at-package ?p - package ?loc - location)

    ;; Package in vehicle (vehicle may be truck or airplane)
    (in-vehicle ?p - package ?v - vehicle)

    ;; Connectivity
    (truck-connected ?l1 - location ?l2 - location)
    (air-route ?a1 - location ?a2 - location)
  )

  ;; Action: DriveTruck - trucks move within a city along truck-connected edges.
  ;; Note: An explicit inequality prevents no-op self-moves.
  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (and
      (at-truck ?tr ?from)
      (in-city ?from ?c - city)         ;; ensures both locations are in same city below
      (in-city ?to ?c - city)
      (truck-connected ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Action: FlyAirplane - airplanes fly between airports in different cities.
  ;; Enforces airport typing, air-route connectivity, and city inequality.
  (:action fly-airplane
    :parameters (?ap - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?ap ?from)
      (airport ?from)
      (airport ?to)
      (in-city ?from ?cityA - city)
      (in-city ?to ?cityB - city)
      (not (= ?cityA ?cityB))   ;; enforce different cities
      (air-route ?from ?to)
      (not (= ?from ?to))       ;; prevent reflexive flight
    )
    :effect (and
      (not (at-airplane ?ap ?from))
      (at-airplane ?ap ?to)
      ;; Packages loaded in the airplane remain InVehicle and are carried implicitly;
      ;; no InVehicle facts are added/deleted here so InVehicle persists.
    )
  )

  ;; Action: Load a package into a truck (only when co-located).
  (:action truck-load
    :parameters (?tr - truck ?pkg - package ?loc - location)
    :precondition (and
      (at-truck ?tr ?loc)
      (at-package ?pkg ?loc)
      ;; Prevent loading the same package into the same truck twice.
      (not (in-vehicle ?pkg ?tr))
    )
    :effect (and
      (in-vehicle ?pkg ?tr)
      (not (at-package ?pkg ?loc))
    )
  )

  ;; Action: Unload a package from a truck (places package at the truck's location).
  (:action truck-unload
    :parameters (?tr - truck ?pkg - package ?loc - location)
    :precondition (and
      (at-truck ?tr ?loc)
      (in-vehicle ?pkg ?tr)
    )
    :effect (and
      (not (in-vehicle ?pkg ?tr))
      (at-package ?pkg ?loc)
    )
  )

  ;; Action: Load a package into an airplane (only at airports).
  (:action airplane-load
    :parameters (?ap - airplane ?pkg - package ?loc - location)
    :precondition (and
      (at-airplane ?ap ?loc)
      (airport ?loc)
      (at-package ?pkg ?loc)
      ;; Prevent loading the same package into the same airplane twice.
      (not (in-vehicle ?pkg ?ap))
    )
    :effect (and
      (in-vehicle ?pkg ?ap)
      (not (at-package ?pkg ?loc))
    )
  )

  ;; Action: Unload a package from an airplane (places package at the airport where plane is).
  (:action airplane-unload
    :parameters (?ap - airplane ?pkg - package ?loc - location)
    :precondition (and
      (at-airplane ?ap ?loc)
      (airport ?loc)
      (in-vehicle ?pkg ?ap)
    )
    :effect (and
      (not (in-vehicle ?pkg ?ap))
      (at-package ?pkg ?loc)
    )
  )

)