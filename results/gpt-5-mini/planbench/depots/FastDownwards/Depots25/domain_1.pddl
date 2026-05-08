(define (domain depots25)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface truck hoist
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    ;; Location predicates
    (truck-at ?t - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; Stacking / containment
    (on ?c - crate ?s - surface)        ;; crate directly on surface (pallet or crate)
    (clear ?s - surface)               ;; nothing directly on top of this surface

    ;; Hoist state
    (hoist-available ?h - hoist)
    (holding ?h - hoist ?c - crate)    ;; hoist holds crate

    ;; Truck contents
    (crate-in-truck ?c - crate ?t - truck)
  )

  ;; Drive a truck between places (places are fully connected in this instance;
  ;; drive requires the truck to be at the origin and moves it to the destination)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck-at ?tr ?from)
    :effect (and
              (not (truck-at ?tr ?from))
              (truck-at ?tr ?to)
            )
  )

  ;; Hoist lifts a crate from a surface at a place.
  ;; Pre: hoist at place, surface at place, crate on that surface, crate clear, hoist available.
  ;; Effect: crate removed from surface and from surface-at (held), hoist holds crate, hoist becomes unavailable,
  ;;         support surface becomes clear, held crate remains clear.
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (surface-at ?s ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (hoist-available ?h)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (surface-at ?c ?p))
              (holding ?h ?c)
              (not (hoist-available ?h))
              (clear ?s)
              (clear ?c)
            )
  )

  ;; Hoist drops a held crate to a surface at the same place.
  ;; Pre: hoist at place, surface at place, hoist holding crate, surface clear.
  ;; Effect: hoist releases crate and becomes available, crate on surface and located at place,
  ;;         destination surface becomes not clear, crate becomes clear (top).
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (surface-at ?s ?p)
                    (holding ?h ?c)
                    (clear ?s)
                  )
    :effect (and
              (not (holding ?h ?c))
              (hoist-available ?h)
              (on ?c ?s)
              (surface-at ?c ?p)
              (not (clear ?s))
              (clear ?c)
            )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  ;; Pre: hoist at place, truck at place, hoist holding crate.
  ;; Effect: crate moved into truck, hoist becomes available, crate no longer has a surface-at fact.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?t ?p)
                    (holding ?h ?c)
                  )
    :effect (and
              (not (holding ?h ?c))
              (hoist-available ?h)
              (crate-in-truck ?c ?t)
              (not (surface-at ?c ?p))
              (clear ?c)
            )
  )

  ;; Hoist unloads a crate from a truck: hoist must be at same place and available.
  ;; Pre: hoist at place, truck at place, hoist available, crate in truck.
  ;; Effect: crate removed from truck and hoist begins holding it and becomes unavailable.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?t ?p)
                    (hoist-available ?h)
                    (crate-in-truck ?c ?t)
                  )
    :effect (and
              (not (crate-in-truck ?c ?t))
              (holding ?h ?c)
              (not (hoist-available ?h))
              (not (surface-at ?c ?p))
              (clear ?c)
            )
  )
)