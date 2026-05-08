(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    hoist truck surface - object
    crate pallet - surface
    place
    depot distributor - place
  )

  (:predicates
    ;; location: any object (hoist, truck, surface, crate) can be at a place
    (at ?obj - object ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)       ;; crate on a surface (pallet or crate if stacking allowed)
    (in-truck ?c - crate ?tr - truck) ;; crate inside a truck

    ;; hoist state
    (lifting ?h - hoist ?c - crate)   ;; hoist h is currently lifting crate c
    (available ?h - hoist)            ;; hoist free to start a lift

    ;; clearance flags
    (clear-surface ?s - surface)      ;; surface s has nothing on top (can receive a crate)
    (clear-crate ?c - crate)          ;; crate c has nothing on top (can be lifted)
  )

  ;; drive a truck from one place to another (requires truck at origin)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
                    (at ?tr ?from)
                    (not (at ?tr ?to))
                  )
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to)
            )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                     (at ?h ?p)
                     (at ?s ?p)
                     (on ?c ?s)
                     (clear-crate ?c)
                     (available ?h)
                   )
    :effect (and
              ;; crate is removed from surface and from being at the place
              (not (on ?c ?s))
              (not (at ?c ?p))

              ;; hoist now holds the crate and becomes unavailable
              (lifting ?h ?c)
              (not (available ?h))

              ;; surface becomes clear (nothing on it)
              (clear-surface ?s)

              ;; lifted crate is by definition clear (no crate on it)
              (clear-crate ?c)
            )
  )

  ;; hoist drops a lifted crate onto a surface at a place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (lifting ?h ?c)
                    (clear-surface ?s)
                  )
    :effect (and
              ;; hoist releases crate and becomes available
              (not (lifting ?h ?c))
              (available ?h)

              ;; crate is placed on surface and becomes located at the place
              (on ?c ?s)
              (at ?c ?p)

              ;; surface is now occupied; crate is clear (nothing on top)
              (not (clear-surface ?s))
              (clear-crate ?c)
            )
  )

  ;; hoist loads a lifted crate into a truck at a place
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              ;; crate is placed into the truck (no longer on a place)
              (in-truck ?c ?tr)
              (not (at ?c ?p))

              ;; hoist becomes available and no longer lifts the crate
              (available ?h)
              (not (lifting ?h ?c))

              ;; crate remains clear (nothing on it when inside truck)
              (clear-crate ?c)
            )
  )

  ;; hoist unloads a crate from a truck (hoist must be available and co-located)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (available ?h)
                    (in-truck ?c ?tr)
                  )
    :effect (and
              ;; crate is removed from the truck
              (not (in-truck ?c ?tr))

              ;; hoist becomes unavailable and starts lifting the crate
              (not (available ?h))
              (lifting ?h ?c)

              ;; crate is not yet placed at the place (will be placed by hoist-drop)
              (not (at ?c ?p))

              ;; crate remains clear while being lifted
              (clear-crate ?c)
            )
  )
)