(define (domain multiagent-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist surface crate pallet)

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)

    ;; places of pallets and crates
    (pallet-at ?pl - pallet ?p - place)
    (crate-at ?c - crate ?p - place)

    ;; stacking: a crate is on a surface (pallet or crate)
    (on ?c - crate ?s - surface)
    (clear ?s - surface) ;; nothing on top of this surface

    ;; hoist state
    (hoist-available ?h - hoist)
    (holding ?h - hoist ?c - crate)

    ;; truck cargo
    (in ?c - crate ?tr - truck)

    ;; roads (fully connected encoded in problem)
    (road ?from - place ?to - place)

    ;; simple place-level synchronization token for hoist-busy
    (no-hoist-busy ?p - place)
  )

  ;; -----------------------
  ;; Truck-driver action(s)
  ;; -----------------------
  (:action truck-driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (road ?from ?to)
      (no-hoist-busy ?from)
      (not (at-truck ?tr ?to))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; -----------------------
  ;; Hoist operator: lift from a pallet
  ;; -----------------------
  (:action hoist-operator-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (pallet-at ?s ?p)
      (on ?c ?s)
      (crate-at ?c ?p)
      (hoist-available ?h)
      (clear ?c)
      (no-hoist-busy ?p)
    )
    :effect (and
      (holding ?h ?c)
      (not (hoist-available ?h))
      (not (on ?c ?s))
      (clear ?s)
      (not (crate-at ?c ?p))
      (not (no-hoist-busy ?p))
    )
  )

  ;; -----------------------
  ;; Hoist operator: lift from a crate
  ;; -----------------------
  (:action hoist-operator-lift-from-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (crate-at ?s ?p)
      (on ?c ?s)
      (crate-at ?c ?p)
      (hoist-available ?h)
      (clear ?c)
      (no-hoist-busy ?p)
    )
    :effect (and
      (holding ?h ?c)
      (not (hoist-available ?h))
      (not (on ?c ?s))
      (clear ?s)
      (not (crate-at ?c ?p))
      (not (no-hoist-busy ?p))
    )
  )

  ;; -----------------------
  ;; Hoist operator: drop onto a pallet
  ;; -----------------------
  (:action hoist-operator-drop-to-pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (pallet-at ?s ?p)
      (clear ?s)
      (holding ?h ?c)
    )
    :effect (and
      (hoist-available ?h)
      (not (holding ?h ?c))
      (crate-at ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
      (no-hoist-busy ?p)
    )
  )

  ;; -----------------------
  ;; Hoist operator: drop onto a crate
  ;; -----------------------
  (:action hoist-operator-drop-to-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (crate-at ?s ?p)
      (clear ?s)
      (holding ?h ?c)
    )
    :effect (and
      (hoist-available ?h)
      (not (holding ?h ?c))
      (crate-at ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
      (no-hoist-busy ?p)
    )
  )

  ;; -----------------------
  ;; Hoist operator: load held crate into truck
  ;; -----------------------
  (:action hoist-operator-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (holding ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (not (holding ?h ?c))
      (hoist-available ?h)
      (not (crate-at ?c ?p))
      (no-hoist-busy ?p)
    )
  )

  ;; -----------------------
  ;; Hoist operator: unload crate from truck (hoist becomes holding and busy)
  ;; -----------------------
  (:action hoist-operator-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (hoist-available ?h)
      (in ?c ?tr)
      (no-hoist-busy ?p)
    )
    :effect (and
      (not (in ?c ?tr))
      (holding ?h ?c)
      (not (hoist-available ?h))
      (not (no-hoist-busy ?p))
    )
  )
)