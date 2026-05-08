(define (domain multiagent_hoist_truck)
  (:requirements :strips :negative-preconditions)

  ;; Types intentionally omitted (untyped) for solver compatibility and instance-specific modeling.

  (:predicates
    (at-truck ?tr ?p)
    (at-hoist ?h ?p)

    (pallet-at ?pl ?p)
    (crate-at ?c ?p)

    ;; on ?c ?s where ?s is a surface (pallet or crate)
    (on ?c ?s)
    (clear ?s)

    (hoist-available ?h)
    (holding ?h ?c)

    (in ?c ?tr)

    (road ?from ?to)

    ;; place-level token indicating no hoist at that place is currently busy (allows/excludes certain concurrent ops)
    (no-hoist-busy ?p)
  )

  ;; Truck-driver action: drive a truck along a road (directed)
  (:action truck_driver_drive
    :parameters (?tr ?from ?to)
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
    :parameters (?h ?c ?s ?p)
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
    :parameters (?h ?c ?s ?p)
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
    :parameters (?h ?c ?s ?p)
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
    :parameters (?h ?c ?s ?p)
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
    :parameters (?h ?c ?tr ?p)
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
    :parameters (?h ?c ?tr ?p)
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