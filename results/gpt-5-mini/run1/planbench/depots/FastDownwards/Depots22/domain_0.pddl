(define (domain truck-hoist-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck crate hoist place slot)

  (:predicates
    ;; Locations
    (truck-at ?tr - truck ?p - place)       ;; truck ?tr is at place ?p
    (at ?c - crate ?p - place)              ;; crate ?c is at place ?p (on ground/pallet)
    (in-truck ?c - crate ?tr - truck)      ;; crate ?c is stowed in truck ?tr

    ;; Hoist state and location
    (hoist-at ?h - hoist ?p - place)        ;; hoist ?h is at place ?p
    (hoist-free ?h - hoist)                ;; hoist ?h is free (not holding)

    ;; Slot-based truck capacity (discrete slots)
    (slot-on-truck ?s - slot ?t - truck)   ;; slot ?s is a slot that belongs to truck ?t
    (slot-free ?s - slot)                  ;; slot ?s is currently free (no crate assigned)
    (in-slot ?c - crate ?s - slot)         ;; crate ?c occupies slot ?s (and is thus in-truck)
  )

  ;; Action: drive the truck from one place to another.
  ;; Semantic choices:
  ;; - Crates that are in-truck remain represented by (in-truck ...) and do NOT have (at ...) facts.
  ;; - Driving a truck does not modify (in-truck ...) facts. The crate location is derived from the truck presence.
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck-at ?tr ?from)
      (not (truck-at ?tr ?to))             ;; prevents no-op drive when from == to
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; Action: move hoist between places.
  ;; Hoist movement is disallowed while hoist is holding a crate (we model hoist as free-only mover).
  (:action hoist-move
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (and
      (hoist-at ?h ?from)
      (not (hoist-at ?h ?to))              ;; prevent no-op move when from == to
      (hoist-free ?h)                      ;; hoist may only move when free (no crate held)
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
    )
  )

  ;; Atomic action: hoist loads a crate from ground (place) into a truck slot.
  ;; This atomic action implements the lift+move+lower sequence as one indivisible transfer:
  ;;   Preconditions ensure hoist, truck, crate and slot are co-located and available.
  ;;   Effects remove the ground location and establish in-truck / in-slot occupancy.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?s - slot)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-free ?h)
      (at ?c ?p)                           ;; crate is on ground at the place
      (truck-at ?t ?p)                     ;; truck is at same place
      (slot-on-truck ?s ?t)                ;; slot belongs to that truck
      (slot-free ?s)                       ;; slot is free to accept crate
      (not (in-truck ?c ?t))               ;; crate not already in this truck
    )
    :effect (and
      (not (at ?c ?p))
      (in-truck ?c ?t)
      (in-slot ?c ?s)
      (not (slot-free ?s))
      ;; hoist remains free at the end of this atomic transfer (operation performed)
      (hoist-free ?h)
    )
  )

  ;; Atomic action: hoist unloads a crate from a truck slot to the ground at the truck's place.
  ;; This action is the inverse of hoist-load-into-truck and frees the slot.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?s - slot)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (in-slot ?c ?s)
      (slot-on-truck ?s ?t)
      (hoist-free ?h)
    )
    :effect (and
      (not (in-slot ?c ?s))
      (not (in-truck ?c ?t))
      (at ?c ?p)
      (slot-free ?s)
      ;; hoist remains free after atomic unload
      (hoist-free ?h)
    )
  )
)