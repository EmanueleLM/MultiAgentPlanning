(define (domain logistics_orchestrated)
  :requirements :strips :typing :negative-preconditions
  :types
    entity vehicle truck airplane package location city tslot pslot gate
  ;; type hierarchy: vehicle is a subtype of entity; truck and airplane subtypes of vehicle; package subtype of entity
  ; Note: PDDL type declarations are flat here but objects will be declared with the types above.

  :predicates
    ;; location and topology predicates
    (at ?e - entity ?l - location)
    (location_in_city ?l - location ?c - city)
    (is_airport ?l - location)
    (different_city ?l1 - location ?l2 - location)

    ;; containment predicates
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (in_any_vehicle ?p - package)

    ;; truck state tokens
    (truck_stopped ?t - truck)
    (truck_busy ?t - truck)

    ;; airplane state tokens
    (airplane_grounded ?a - airplane)
    (airplane_busy ?a - airplane)

    ;; truck slot predicates (explicit capacity)
    (slot_free_truck ?t - truck ?s - tslot)
    (slot_occupied_truck ?t - truck ?s - tslot ?p - package)

    ;; airplane cargo slot predicates (explicit capacity)
    (slot_free_plane ?a - airplane ?s - pslot)
    (slot_occupied_plane ?a - airplane ?s - pslot ?p - package)

    ;; airport gate predicates (explicit gate slots)
    (gate_free ?loc - location ?g - gate)
    (gate_occupied ?loc - location ?g - gate ?a - airplane)
  )

  ;; ACTIONS
  ;; Driving is intra-city only: requires both locations be in the same city.
  (:action drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
      (truck_stopped ?t)
      (not (truck_busy ?t))
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      ;; packages remain in_truck implicitly (no change to in_truck predicates)
    )
  )

  ;; Load a package into a truck, consuming a free truck slot and making the package no longer at the location.
  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location ?s - tslot)
    :precondition (and
      (at ?t ?loc)
      (at ?p ?loc)
      (slot_free_truck ?t ?s)
      (truck_stopped ?t)
      (not (truck_busy ?t))
      (not (in_any_vehicle ?p))
    )
    :effect (and
      (in_truck ?p ?t)
      (in_any_vehicle ?p)
      (not (at ?p ?loc))
      (not (slot_free_truck ?t ?s))
      (slot_occupied_truck ?t ?s ?p)
    )
  )

  ;; Unload a package from a truck into the truck's current location; frees the truck slot.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location ?s - tslot)
    :precondition (and
      (in_truck ?p ?t)
      (at ?t ?loc)
      (slot_occupied_truck ?t ?s ?p)
      (truck_stopped ?t)
      (not (truck_busy ?t))
    )
    :effect (and
      (not (in_truck ?p ?t))
      (not (slot_occupied_truck ?t ?s ?p))
      (slot_free_truck ?t ?s)
      (at ?p ?loc)
      (not (in_any_vehicle ?p))
    )
  )

  ;; Assign an airport gate to an airplane (reserve a gate). Required before load/unload on airplane.
  (:action assign_gate
    :parameters (?a - airplane ?loc - location ?g - gate)
    :precondition (and
      (at ?a ?loc)
      (is_airport ?loc)
      (airplane_grounded ?a)
      (gate_free ?loc ?g)
      (not (airplane_busy ?a))
    )
    :effect (and
      (not (gate_free ?loc ?g))
      (gate_occupied ?loc ?g ?a)
    )
  )

  ;; Release an assigned gate for an airplane (free the gate).
  (:action release_gate
    :parameters (?a - airplane ?loc - location ?g - gate)
    :precondition (and
      (gate_occupied ?loc ?g ?a)
      (airplane_grounded ?a)
      (not (airplane_busy ?a))
    )
    :effect (and
      (gate_free ?loc ?g)
      (not (gate_occupied ?loc ?g ?a))
    )
  )

  ;; Load a package into an airplane while the airplane holds a gate reservation and a free cargo slot.
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?loc - location ?g - gate ?s - pslot)
    :precondition (and
      (at ?a ?loc)
      (is_airport ?loc)
      (at ?p ?loc)
      (gate_occupied ?loc ?g ?a)
      (slot_free_plane ?a ?s)
      (airplane_grounded ?a)
      (not (airplane_busy ?a))
      (not (in_any_vehicle ?p))
    )
    :effect (and
      (in_airplane ?p ?a)
      (in_any_vehicle ?p)
      (not (at ?p ?loc))
      (not (slot_free_plane ?a ?s))
      (slot_occupied_plane ?a ?s ?p)
    )
  )

  ;; Unload a package from an airplane to the airport location; frees the plane cargo slot.
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?loc - location ?g - gate ?s - pslot)
    :precondition (and
      (in_airplane ?p ?a)
      (at ?a ?loc)
      (is_airport ?loc)
      (gate_occupied ?loc ?g ?a)
      (slot_occupied_plane ?a ?s ?p)
      (airplane_grounded ?a)
      (not (airplane_busy ?a))
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (not (slot_occupied_plane ?a ?s ?p))
      (slot_free_plane ?a ?s)
      (at ?p ?loc)
      (not (in_any_vehicle ?p))
    )
  )

  ;; Fly an airplane between airports in different cities. Requires a free gate at the origin airport
  ;; (this enforces that if the airplane occupied a gate it must be released before flying).
  (:action fly
    :parameters (?a - airplane ?from - location ?to - location ?g - gate ?cf - city ?ct - city)
    :precondition (and
      (at ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
      (different_city ?from ?to)
      (gate_free ?from ?g)
      (airplane_grounded ?a)
      (not (airplane_busy ?a))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      ;; packages in_airplane remain in_airplane (no change)
    )
  )
)