(define (domain crate-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist crate pallet surface)
  ;; surface is supertype; crates and pallets are surfaces
  (:predicates
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (obj-at ?s - surface ?p - place)            ; surface object (pallet or crate) located at place
    (in-truck ?c - crate ?tr - truck)           ; crate is in truck
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)       ; hoist is currently lifting crate
    (on ?top - surface ?bottom - surface)       ; top is directly on bottom
    (clear ?s - surface)                        ; nothing on top of this surface
    (done-drive-t0)                             ; ordering flag: driver completed specified drive 1
    (done-drive-t1)                             ; ordering flag: driver completed specified drive 2
    (placed ?c - crate)                         ; ordering flags: crate has been placed in required position
  )

  ;; Generic driver drive action (can move any truck between any two places)
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck-at ?tr ?from)
    :effect (and (truck-at ?tr ?to) (not (truck-at ?tr ?from)))
  )

  ;; Driver-committed specific ordered drives (these achieve the driver's asserted sequence).
  ;; These actions set ordering flags so the required order cannot be bypassed by the generic drive.
  (:action driver-drive-truck0-depot1-depot0
    :parameters ()
    :precondition (truck-at truck0 depot1)
    :effect (and (truck-at truck0 depot0) (not (truck-at truck0 depot1)) (done-drive-t0))
  )

  (:action driver-drive-truck1-depot1-depot0
    :parameters ()
    :precondition (and (done-drive-t0) (truck-at truck1 depot1))
    :effect (and (truck-at truck1 depot0) (not (truck-at truck1 depot1)) (done-drive-t1))
  )

  ;; Hoist operator: lift a crate from a surface at a place
  (:action hoist_operator-lift
    :parameters (?h - hoist ?p - place ?c - crate ?s - surface)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-available ?h)
      (obj-at ?c ?p)
      (on ?c ?s)
      (obj-at ?s ?p)
      (clear ?c)
    )
    :effect (and
      (not (obj-at ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; Hoist operator: load a lifted crate into a truck at same place
  (:action hoist_operator-load
    :parameters (?h - hoist ?p - place ?c - crate ?tr - truck)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
    )
  )

  ;; Hoist operator: unload a crate from a truck (hoist begins lifting it)
  (:action hoist_operator-unload
    :parameters (?h - hoist ?p - place ?c - crate ?tr - truck)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-available ?h)
      (in-truck ?c ?tr)
      (truck-at ?tr ?p)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
    )
  )

  ;; Hoist operator: generic drop of a lifted crate onto a target surface (any surface at same place)
  ;; This generic drop does not set ordering flags; specialized drop actions below enforce required order.
  (:action hoist_operator-drop
    :parameters (?h - hoist ?p - place ?c - crate ?target - surface)
    :precondition (and
      (hoist-at ?h ?p)
      (obj-at ?target ?p)
      (clear ?target)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (obj-at ?c ?p)
      (not (clear ?target))
      (clear ?c)
      (on ?c ?target)
    )
  )

  ;; Specialized drop actions to enforce explicit stacking order required by the specification.
  ;; 1) Place crate2 onto pallet0 at depot0; mark crate2 as placed.
  (:action hoist_operator-drop-crate2-onto-pallet0
    :parameters (?h - hoist)
    :precondition (and
      (hoist-at ?h depot0)
      (obj-at pallet0 depot0)
      (clear pallet0)
      (hoist-lifting ?h crate2)
    )
    :effect (and
      (hoist-available ?h)
      (not (hoist-lifting ?h crate2))
      (obj-at crate2 depot0)
      (not (clear pallet0))
      (clear crate2)
      (on crate2 pallet0)
      (placed crate2)
    )
  )

  ;; 2) Place crate0 onto crate2 at depot0; requires crate2 already placed (ordering).
  (:action hoist_operator-drop-crate0-onto-crate2
    :parameters (?h - hoist)
    :precondition (and
      (hoist-at ?h depot0)
      (obj-at crate2 depot0)
      (on crate2 pallet0)
      (clear crate2)
      (hoist-lifting ?h crate0)
      (placed crate2)
    )
    :effect (and
      (hoist-available ?h)
      (not (hoist-lifting ?h crate0))
      (obj-at crate0 depot0)
      (not (clear crate2))
      (clear crate0)
      (on crate0 crate2)
      (placed crate0)
    )
  )

  ;; 3) Place crate1 onto crate0 at depot0; requires crate0 already placed (ordering).
  (:action hoist_operator-drop-crate1-onto-crate0
    :parameters (?h - hoist)
    :precondition (and
      (hoist-at ?h depot0)
      (obj-at crate0 depot0)
      (on crate0 crate2)
      (clear crate0)
      (hoist-lifting ?h crate1)
      (placed crate0)
    )
    :effect (and
      (hoist-available ?h)
      (not (hoist-lifting ?h crate1))
      (obj-at crate1 depot0)
      (not (clear crate0))
      (clear crate1)
      (on crate1 crate0)
    )
  )
)