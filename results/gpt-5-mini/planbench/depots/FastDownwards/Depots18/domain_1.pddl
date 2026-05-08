(define (domain depots_hoist)
  ;; FastDownward-compatible classical STRIPS-style domain (no duratives, no numeric fluents).
  ;; Objects are left untyped to keep the encoding concrete and simple for this instance.
  (:requirements :strips :negative-preconditions)

  (:predicates
    ;; locations
    (at-truck ?truck ?place)
    (at-hoist ?hoist ?place)
    (at ?obj ?place)            ;; pallets and crates when resting at a place (not lifted / not in truck)

    ;; hoist state
    (available ?hoist)
    (lifting ?hoist ?crate)     ;; hoist is currently lifting a given crate

    ;; crate in truck
    (in ?crate ?truck)

    ;; stacking / support relation: crate on a support (support can be a pallet or another crate)
    (on ?crate ?support)

    ;; top-of relation: object (crate or pallet) has nothing on it
    (clear ?obj)
  )

  ;; Drive a truck between any two places (connectivity assumed between all depots and distributors).
  (:action drive-truck
    :parameters (?truck ?from ?to)
    :precondition (and (at-truck ?truck ?from))
    :effect (and
      (not (at-truck ?truck ?from))
      (at-truck ?truck ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at a place.
  (:action hoist-lift-from-surface
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and
      (at-hoist ?hoist ?place)
      (at ?surface ?place)      ;; the support surface (pallet or crate) is at the place
      (on ?crate ?surface)
      (available ?hoist)
      (clear ?crate)
    )
    :effect (and
      (not (on ?crate ?surface))
      (not (at ?crate ?place))
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (clear ?surface)
    )
  )

  ;; Hoist drops a lifted crate onto a surface at a place.
  (:action hoist-drop-to-surface
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and
      (at-hoist ?hoist ?place)
      (at ?surface ?place)
      (clear ?surface)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (available ?hoist)
      (on ?crate ?surface)
      (at ?crate ?place)
      (not (clear ?surface))
      (clear ?crate)
    )
  )

  ;; Hoist loads a lifted crate into a truck at a place.
  ;; After loading the crate is in the truck and the hoist becomes available (no longer lifting).
  (:action hoist-load-into-truck
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and
      (at-hoist ?hoist ?place)
      (at-truck ?truck ?place)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (in ?crate ?truck)
      (available ?hoist)
    )
  )

  ;; Hoist unloads a crate from a truck at a place: hoist must be available to start unloading,
  ;; and after the action the hoist is lifting the crate (not available).
  (:action hoist-unload-from-truck
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and
      (at-hoist ?hoist ?place)
      (at-truck ?truck ?place)
      (available ?hoist)
      (in ?crate ?truck)
    )
    :effect (and
      (not (in ?crate ?truck))
      (not (available ?hoist))
      (lifting ?hoist ?crate)
    )
  )
)