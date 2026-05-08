(define (domain depot-operations)
  (:requirements :strips :typing)
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

  ;; Hoist lifts a crate from a pallet at the same place.
  (:action hoist-lift-from-pallet
    :parameters (?hoist - hoist ?place - place ?crate - crate ?src - pallet)
    :precondition (and
      (hoist-at ?hoist ?place)
      (on ?crate ?src)
      (crate-at ?crate ?place)
      (pallet-at ?src ?place)
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

  ;; Hoist lifts a crate from another crate at the same place.
  (:action hoist-lift-from-crate
    :parameters (?hoist - hoist ?place - place ?crate - crate ?src - crate)
    :precondition (and
      (hoist-at ?hoist ?place)
      (on ?crate ?src)
      (crate-at ?crate ?place)
      (crate-at ?src ?place)
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

  ;; Hoist drops a held crate onto a pallet at the same place.
  (:action hoist-drop-to-pallet
    :parameters (?hoist - hoist ?place - place ?crate - crate ?target - pallet)
    :precondition (and
      (hoist-at ?hoist ?place)
      (holding ?hoist ?crate)
      (pallet-at ?target ?place)
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

  ;; Hoist drops a held crate onto another crate at the same place.
  (:action hoist-drop-to-crate
    :parameters (?hoist - hoist ?place - place ?crate - crate ?target - crate)
    :precondition (and
      (hoist-at ?hoist ?place)
      (holding ?hoist ?crate)
      (crate-at ?target ?place)
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
    )
  )

  ;; Hoist unloads a crate from a truck into its grasp at the same place.
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