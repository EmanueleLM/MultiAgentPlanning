(define (domain depots10)
  (:requirements :strips :typing :negative-preconditions)
  (:types place depot distributor
          surface pallet crate
          truck hoist)

  (:predicates
    ;; locations
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - surface)        ;; crate c on surface s
    (in ?c - crate ?tr - truck)         ;; crate c in truck tr

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
  ;; Preconditions require the hoist at the place, hoist available, crate clear,
  ;; crate and supporting surface located at same place, and crate on that surface.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (available ?h)
                    (clear ?c)
                    (on ?c ?s)
                    (surface-at ?s ?p)
                    (surface-at ?c ?p)
                  )
    :effect (and
              ;; crate removed from the place / surface
              (not (surface-at ?c ?p))
              (not (on ?c ?s))

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
              ;; crate placed back at place on surface
              (surface-at ?c ?p)
              (on ?c ?s)

              ;; hoist becomes available and is no longer lifting
              (available ?h)
              (not (lifting ?h ?c))

              ;; surface occupied, crate becomes clear (nothing on top)
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
              ;; crate now in the truck; no longer held by hoist
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