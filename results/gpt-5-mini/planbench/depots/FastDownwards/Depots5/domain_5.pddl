(define (domain multiagent_hoist_truck)
  (:requirements :typing :negative-preconditions :strips)

  (:types pallet crate - surface place truck hoist)

  (:predicates
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)

    (pallet-at ?pl - pallet ?p - place)
    (crate-at ?c - crate ?p - place)

    ;; on ?c ?s where ?s is a surface (pallet or crate)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)

    (hoist-available ?h - hoist)
    (holding ?h - hoist ?c - crate)

    (in ?c - crate ?tr - truck)

    (road ?from - place ?to - place)

    ;; place-level token indicating no hoist at that place is currently busy
    (no-hoist-busy ?p - place)
  )

  ;; Truck-driver action: drive a truck along a road (directed)
  (:action truck_driver_drive
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

  ;; Hoist operator: lift a crate from a pallet surface
  (:action hoist_operator_lift_from_pallet
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

  ;; Hoist operator: lift a crate from another crate surface
  (:action hoist_operator_lift_from_crate
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

  ;; Hoist operator: drop a held crate onto a pallet
  (:action hoist_operator_drop_to_pallet
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

  ;; Hoist operator: drop a held crate onto another crate
  (:action hoist_operator_drop_to_crate
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

  ;; Hoist operator: load a held crate into a truck
  (:action hoist_operator_load
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

  ;; Hoist operator: unload a crate from a truck (hoist becomes holding and busy)
  (:action hoist_operator_unload
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