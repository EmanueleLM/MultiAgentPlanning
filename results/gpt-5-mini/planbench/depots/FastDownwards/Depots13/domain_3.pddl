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
    (truck-at ?t - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (clear ?s - surface)
    (hoist-free ?h - hoist)
    (holding ?h - hoist ?c - crate)
  )

  ;; Drive a truck from one place to another.
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
  ;; Preconditions: hoist and source surface at same place, crate is on the source,
  ;; crate's top is clear, and hoist is free.
  (:action hoist-lift
    :parameters (?hoist - hoist ?place - place ?crate - crate ?src - surface)
    :precondition (and
      (hoist-at ?hoist ?place)
      (surface-at ?src ?place)
      (on ?crate ?src)
      (clear ?crate)
      (hoist-free ?hoist)
    )
    :effect (and
      (not (on ?crate ?src))
      (holding ?hoist ?crate)
      (not (hoist-free ?hoist))
      (clear ?src)
      (not (surface-at ?crate ?place))
    )
  )

  ;; Hoist drops a held crate onto a surface at the same place.
  ;; Preconditions: hoist and target surface at same place, target surface clear,
  ;; and hoist is holding the crate.
  (:action hoist-drop
    :parameters (?hoist - hoist ?place - place ?crate - crate ?target - surface)
    :precondition (and
      (hoist-at ?hoist ?place)
      (surface-at ?target ?place)
      (holding ?hoist ?crate)
      (clear ?target)
    )
    :effect (and
      (not (holding ?hoist ?crate))
      (hoist-free ?hoist)
      (on ?crate ?target)
      (not (clear ?target))
      (clear ?crate)
      (surface-at ?crate ?place)
    )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  ;; Preconditions: hoist and truck at same place and hoist is holding the crate.
  ;; Effect: crate becomes inside the truck; hoist becomes free; crate is no longer recorded at the place.
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
      (not (surface-at ?crate ?place))
    )
  )

  ;; Hoist unloads a crate from a truck (hoist must be available).
  ;; Preconditions: hoist and truck at same place, hoist free, and crate in the truck.
  ;; Effect: crate removed from truck and hoist holds the crate (hoist becomes not free).
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