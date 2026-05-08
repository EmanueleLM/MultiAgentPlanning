(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types place hoist truck crate pallet)

  (:predicates
    ;; location predicates
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-pallet ?pa - pallet ?p - place)
    (at-crate ?c - crate ?p - place)

    ;; stacking and containment (separate predicates for pallet-vs-crate supports)
    (on-pallet ?c - crate ?pa - pallet)
    (on-crate ?c - crate ?s - crate)

    ;; occupancy/clear predicates (modeled as booleans and updated by actions)
    (clear-pallet ?pa - pallet)
    (clear-crate ?c - crate)

    ;; hoist state and truck-container state
    (hoist-available ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)
    (in-truck ?c - crate ?t - truck)
  )

  ;; DRIVE action for trucks: moves a truck between places
  (:action truck-drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; HOIST LIFT from a pallet
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-pallet ?pa ?p)
      (on-pallet ?c ?pa)
      (clear-crate ?c)
      (hoist-available ?h)
      ;; crate must not be inside any truck (enumerated negative preconditions)
      (not (in-truck ?c truck0))
      (not (in-truck ?c truck1))
      (not (in-truck ?c truck2))
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (on-pallet ?c ?pa))
      (not (hoist-available ?h))
      ;; removing the crate from the pallet makes the pallet clear (model assumes capacity 1)
      (clear-pallet ?pa)
      ;; crate remains associated with the place while held (keeps at-crate fact or reinstates it)
      (at-crate ?c ?p)
    )
  )

  ;; HOIST LIFT from another crate (stack)
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-crate ?s ?p)
      (on-crate ?c ?s)
      (clear-crate ?c)
      (hoist-available ?h)
      (not (in-truck ?c truck0))
      (not (in-truck ?c truck1))
      (not (in-truck ?c truck2))
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (on-crate ?c ?s))
      (not (hoist-available ?h))
      ;; supporting crate becomes clear when top crate removed (capacity-1 stacking)
      (clear-crate ?s)
      ;; crate remains at-place while held
      (at-crate ?c ?p)
    )
  )

  ;; HOIST DROP onto a pallet
  (:action hoist-drop-to-pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-holding ?h ?c)
      (at-pallet ?pa ?p)
      (clear-pallet ?pa)
    )
    :effect (and
      (on-pallet ?c ?pa)
      (not (hoist-holding ?h ?c))
      (hoist-available ?h)
      ;; the pallet is no longer clear (capacity-1)
      (not (clear-pallet ?pa))
      ;; the placed crate is at the place of the pallet
      (at-crate ?c ?p)
      ;; the placed crate is clear (nothing on top immediately)
      (clear-crate ?c)
    )
  )

  ;; HOIST DROP onto another crate
  (:action hoist-drop-to-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-holding ?h ?c)
      (at-crate ?s ?p)
      (clear-crate ?s)
    )
    :effect (and
      (on-crate ?c ?s)
      (not (hoist-holding ?h ?c))
      (hoist-available ?h)
      ;; supporting crate is no longer clear
      (not (clear-crate ?s))
      ;; the placed crate occupies the place
      (at-crate ?c ?p)
      ;; the placed crate is clear
      (clear-crate ?c)
    )
  )

  ;; HOIST LOAD: place a held crate into a truck (crate becomes in-truck and not on any surface)
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (not (hoist-holding ?h ?c))
      (hoist-available ?h)
      ;; when loaded into truck we remove at-crate (crate location is now tracked via in-truck + truck location)
      (not (at-crate ?c ?p))
    )
  )

  ;; HOIST UNLOAD: take a crate out of a truck and hold it
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (in-truck ?c ?t)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (in-truck ?c ?t))
      (not (hoist-available ?h))
      ;; the crate becomes associated with the place while held
      (at-crate ?c ?p)
    )
  )
)