(define (domain depot-operations)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; Locations
    (truck-at ?t - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (pallet-at ?p - pallet ?pl - place)
    (crate-at ?c - crate ?pl - place)

    ;; Support relation: crate on a surface (surface may be pallet or crate)
    (on ?c - crate ?s - surface)

    ;; Top-of-surface clear (no crate on top)
    (clear ?s - surface)

    ;; Hoist state
    (hoist-free ?h - hoist)
    (holding ?h - hoist ?c - crate)

    ;; Crate in truck
    (in ?c - crate ?t - truck)
  )

  ;; Drive a truck from one place to another (roads exist between any two places).
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (truck-at ?truck ?from)
    )
    :effect (and
      (not (truck-at ?truck ?from))
      (truck-at ?truck ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at the same place.
  ;; Preconditions: hoist and source surface at the same place, crate is on the source,
  ;; crate is clear (nothing on top), and hoist is free.
  (:action hoist-lift
    :parameters (?hoist - hoist ?place - place ?crate - crate ?src - surface)
    :precondition (and
      (hoist-at ?hoist ?place)
      (on ?crate ?src)
      ;; the crate must be located at the place (consistency with surface)
      (crate-at ?crate ?place)
      ;; the source surface must be at the place (only pallets are declared with pallet-at;
      ;; crates as surfaces are located via crate-at, so require either pallet-at or crate-at)
      ;; We enforce surface presence by requiring that the surface itself is at the same place:
      (or (and (instance ?src pallet) (pallet-at ?src ?place))
          (and (instance ?src crate) (crate-at ?src ?place)))
      (clear ?crate)
      (hoist-free ?hoist)
    )
    :effect (and
      (not (on ?crate ?src))
      (not (crate-at ?crate ?place))
      (holding ?hoist ?crate)
      (not (hoist-free ?hoist))
      (clear ?src)
    )
  )

  ;; Hoist drops a held crate onto a surface at the same place.
  (:action hoist-drop
    :parameters (?hoist - hoist ?place - place ?crate - crate ?target - surface)
    :precondition (and
      (hoist-at ?hoist ?place)
      (holding ?hoist ?crate)
      ;; target surface must be at the place (it may be a pallet or a crate)
      (or (and (instance ?target pallet) (pallet-at ?target ?place))
          (and (instance ?target crate) (crate-at ?target ?place)))
      (clear ?target)
    )
    :effect (and
      (not (holding ?hoist ?crate))
      (hoist-free ?hoist)
      (on ?crate ?target)
      (crate-at ?crate ?place)
      (not (clear ?target))
      (clear ?crate)
    )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  (:action hoist-load-into-truck
    :parameters (?hoist - hoist ?place - place ?crate - crate ?truck - truck)
    :precondition (and
      (hoist-at ?hoist ?place)
      (truck-at ?truck ?place)
      (holding ?hoist ?crate)
    )
    :effect (and
      (not (holding ?hoist ?crate))
      (hoist-free ?hoist)
      (in ?crate ?truck)
      (not (crate-at ?crate ?place))
      (not (on ?crate ?_) ) ;; ensure crate is not recorded on any surface (schematic negative)
    )
  )

  ;; Hoist unloads a crate from a truck (hoist must be free) into hoist's grasp.
  (:action hoist-unload-from-truck
    :parameters (?hoist - hoist ?place - place ?truck - truck ?crate - crate)
    :precondition (and
      (hoist-at ?hoist ?place)
      (truck-at ?truck ?place)
      (hoist-free ?hoist)
      (in ?crate ?truck)
    )
    :effect (and
      (not (in ?crate ?truck))
      (not (hoist-free ?hoist))
      (holding ?hoist ?crate)
    )
  )
)