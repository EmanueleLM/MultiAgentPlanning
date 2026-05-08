(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    truck plane vehicle cargo location slot phase
  )

  (:predicates
    ;; locations
    (at-veh ?v - vehicle ?loc - location)
    (at-cargo ?c - cargo ?loc - location)
    ;; occupancy via slots
    (slot-of ?s - slot ?v - vehicle)
    (slot-free ?s - slot)
    (slot-occupied ?s - slot ?c - cargo)
    ;; convenience predicate indicating cargo is in vehicle (mirrors slot occupancy)
    (in ?c - cargo ?v - vehicle)
    ;; connectivity
    (road ?from - location ?to - location)
    (air-route ?from - location ?to - location)
    ;; location types
    (airport ?loc - location)
    ;; phase sequencing
    (current-phase ?p - phase)
    (next ?p - phase ?q - phase)
  )

  ;; -----------------------
  ;; Truck actions - Phase 1 (t1: depot -> ap0)
  ;; -----------------------
  (:action truck_load_p1
    :parameters (?t - truck ?c - cargo ?loc - location ?s - slot)
    :precondition (and
      (current-phase ph1)
      (at-veh ?t ?loc)
      (at-cargo ?c ?loc)
      (slot-of ?s ?t)
      (slot-free ?s)
    )
    :effect (and
      (in ?c ?t)
      (not (at-cargo ?c ?loc))
      (not (slot-free ?s))
      (slot-occupied ?s ?c)
    )
  )

  (:action truck_drive_p1
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (current-phase ph1)
      (at-veh ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (at-veh ?t ?to)
      (not (at-veh ?t ?from))
    )
  )

  (:action truck_unload_p1
    :parameters (?t - truck ?c - cargo ?loc - location ?s - slot)
    :precondition (and
      (current-phase ph1)
      (at-veh ?t ?loc)
      (in ?c ?t)
      (slot-of ?s ?t)
      (slot-occupied ?s ?c)
      (airport ?loc)  ;; transfers for airplanes must occur at airports
    )
    :effect (and
      (at-cargo ?c ?loc)
      (not (in ?c ?t))
      (slot-free ?s)
      (not (slot-occupied ?s ?c))
    )
  )

  ;; -----------------------
  ;; Plane actions - Phase 2 (p1: ap0 -> ap1)
  ;; -----------------------
  (:action plane_load_p2
    :parameters (?p - plane ?c - cargo ?loc - location ?s - slot)
    :precondition (and
      (current-phase ph2)
      (at-veh ?p ?loc)
      (at-cargo ?c ?loc)
      (slot-of ?s ?p)
      (slot-free ?s)
      (airport ?loc)  ;; plane loads only at airports
    )
    :effect (and
      (in ?c ?p)
      (not (at-cargo ?c ?loc))
      (not (slot-free ?s))
      (slot-occupied ?s ?c)
    )
  )

  (:action plane_fly_p2
    :parameters (?p - plane ?from - location ?to - location)
    :precondition (and
      (current-phase ph2)
      (at-veh ?p ?from)
      (air-route ?from ?to)
    )
    :effect (and
      (at-veh ?p ?to)
      (not (at-veh ?p ?from))
    )
  )

  (:action plane_unload_p2
    :parameters (?p - plane ?c - cargo ?loc - location ?s - slot)
    :precondition (and
      (current-phase ph2)
      (at-veh ?p ?loc)
      (in ?c ?p)
      (slot-of ?s ?p)
      (slot-occupied ?s ?c)
      (airport ?loc)
    )
    :effect (and
      (at-cargo ?c ?loc)
      (not (in ?c ?p))
      (slot-free ?s)
      (not (slot-occupied ?s ?c))
    )
  )

  ;; -----------------------
  ;; Truck actions - Phase 3 (t2: ap1 -> store)
  ;; -----------------------
  (:action truck_load_p3
    :parameters (?t - truck ?c - cargo ?loc - location ?s - slot)
    :precondition (and
      (current-phase ph3)
      (at-veh ?t ?loc)
      (at-cargo ?c ?loc)
      (slot-of ?s ?t)
      (slot-free ?s)
      (airport ?loc)  ;; loading from airport for final leg
    )
    :effect (and
      (in ?c ?t)
      (not (at-cargo ?c ?loc))
      (not (slot-free ?s))
      (slot-occupied ?s ?c)
    )
  )

  (:action truck_drive_p3
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (current-phase ph3)
      (at-veh ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (at-veh ?t ?to)
      (not (at-veh ?t ?from))
    )
  )

  (:action truck_unload_p3
    :parameters (?t - truck ?c - cargo ?loc - location ?s - slot)
    :precondition (and
      (current-phase ph3)
      (at-veh ?t ?loc)
      (in ?c ?t)
      (slot-of ?s ?t)
      (slot-occupied ?s ?c)
    )
    :effect (and
      (at-cargo ?c ?loc)
      (not (in ?c ?t))
      (slot-free ?s)
      (not (slot-occupied ?s ?c))
    )
  )

  ;; -----------------------
  ;; Controller actions to advance phases
  ;; These are strict: they require both cargos to be at the origin airport
  ;; (for ph1->ph2) or at the destination airport and plane present (for ph2->ph3).
  ;; -----------------------
  (:action controller_advance_to_ph2
    :parameters ()
    :precondition (and
      (current-phase ph1)
      (at-cargo c1 ap0)
      (at-cargo c2 ap0)
    )
    :effect (and
      (current-phase ph2)
      (not (current-phase ph1))
    )
  )

  (:action controller_advance_to_ph3
    :parameters (?p - plane)
    :precondition (and
      (current-phase ph2)
      (at-cargo c1 ap1)
      (at-cargo c2 ap1)
      (at-veh ?p ap1)
    )
    :effect (and
      (current-phase ph3)
      (not (current-phase ph2))
    )
  )

)