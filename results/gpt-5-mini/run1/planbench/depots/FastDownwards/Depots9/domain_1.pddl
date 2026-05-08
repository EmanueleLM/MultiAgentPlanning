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
    ;; generic location: any hoist/truck/surface/crate (through types) can be at a place
    (at ?obj - object ?p - place)

    ;; crate placement modes (intended mutually exclusive in the model)
    (on ?c - crate ?s - surface)         ;; crate is on a surface (pallet or another surface)
    (in-truck ?c - crate ?t - truck)    ;; crate is inside/onboard a truck
    (lifting ?h - hoist ?c - crate)     ;; hoist h is lifting crate c

    ;; hoist resource/fluent
    (available ?h - hoist)              ;; hoist is free for a new operation

    ;; surface / crate top-clearness
    (clear-surface ?s - surface)        ;; surface has no crate on it
    (clear-crate ?c - crate)            ;; nothing on top of this crate
  )

  ;; Truck driving: atomic move between places
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

  ;; Hoist lifts crate from a surface at a place
  ;; Precondition requires lift co-located with both crate (via surface) and hoist available and crate top clear.
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
              ;; crate removed from surface and from being reported at the place
              (not (on ?c ?s))
              (not (at ?c ?p))

              ;; hoist now lifting and becomes unavailable
              (lifting ?h ?c)
              (not (available ?h))

              ;; surface becomes clear after crate removed
              (clear-surface ?s)
    )
  )

  ;; Hoist drops a held crate onto a surface at a place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (lifting ?h ?c)
                    (clear-surface ?s)
                  )
    :effect (and
              ;; hoist releases the crate and becomes available
              (not (lifting ?h ?c))
              (available ?h)

              ;; crate placed onto surface and reported at the place
              (on ?c ?s)
              (at ?c ?p)

              ;; surface is now occupied, crate top is clear
              (not (clear-surface ?s))
              (clear-crate ?c)
    )
  )

  ;; Hoist loads a held crate into a co-located truck
  ;; After loading: crate becomes in the truck; hoist becomes available and stops lifting.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              ;; hoist releases crate, crate becomes in the truck
              (not (lifting ?h ?c))
              (in-truck ?c ?tr)

              ;; crate is no longer reported at the place
              (not (at ?c ?p))

              ;; hoist becomes available
              (available ?h)
    )
  )

  ;; Hoist unloads a crate from a co-located truck and begins lifting it
  ;; After unloading: crate removed from truck, hoist becomes busy and lifts the crate.
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (available ?h)
                    (in-truck ?c ?tr)
                  )
    :effect (and
              ;; crate removed from truck, hoist becomes busy lifting it
              (not (in-truck ?c ?tr))
              (not (available ?h))
              (lifting ?h ?c)
    )
  )
)