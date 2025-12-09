(define (domain depots10)
  (:requirements :strips :typing :negative-preconditions)
  (:types place surface depot distributor pallet crate truck hoist
          depot distributor - place
          pallet crate - surface)

  (:predicates
    ;; locations
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - surface)        ;; crate c is on surface s
    (in ?c - crate ?tr - truck)         ;; crate c is in truck tr

    ;; hoist status and surface availability
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  ;; Drive a truck from one place to another.
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (truck-at ?tr ?from))
    :effect (and
              (not (truck-at ?tr ?from))
              (truck-at ?tr ?to)
            )
  )

  ;; Hoist lifts a crate from a surface at a place.
  ;; Preconditions: hoist at same place, hoist available, crate clear,
  ;; crate is on supporting surface that is at that place.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (available ?h)
                    (clear ?c)
                    (on ?c ?s)
                    (surface-at ?s ?p)
                  )
    :effect (and
              ;; crate removed from surface and from place
              (not (on ?c ?s))
              (not (surface-at ?c ?p))

              ;; hoist now lifting and becomes unavailable
              (lifting ?h ?c)
              (not (available ?h))

              ;; supporting surface becomes clear
              (clear ?s)
            )
  )

  ;; Hoist drops a crate to a surface at a place.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (surface-at ?s ?p)
                    (clear ?s)
                    (lifting ?h ?c)
                  )
    :effect (and
              ;; crate placed at place on surface
              (surface-at ?c ?p)
              (on ?c ?s)

              ;; hoist becomes available and is no longer lifting
              (available ?h)
              (not (lifting ?h ?c))

              ;; surface now occupied, crate becomes clear (nothing on top)
              (not (clear ?s))
              (clear ?c)
            )
  )

  ;; Hoist loads a currently-lifted crate into a truck at the same place.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              ;; crate now in the truck; hoist no longer lifting and becomes available
              (in ?c ?tr)
              (not (lifting ?h ?c))
              (available ?h)
            )
  )

  ;; Hoist unloads a crate from a truck at the place of the truck (hoist must be at same place).
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (available ?h)
                    (in ?c ?tr)
                  )
    :effect (and
              ;; crate removed from truck and hoist becomes unavailable and starts lifting it
              (not (in ?c ?tr))
              (not (available ?h))
              (lifting ?h ?c)
            )
  )
)