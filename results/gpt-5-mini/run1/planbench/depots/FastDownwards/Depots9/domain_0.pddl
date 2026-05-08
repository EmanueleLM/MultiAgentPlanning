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
    ;; location: any hoist/truck/surface/crate is at a place
    (at ?obj - object ?p - place)

    ;; crate placement modes (mutually exclusive by explicit action effects)
    (on ?c - crate ?s - surface)         ;; crate is on a surface (pallet or crate-surface)
    (in-truck ?c - crate ?t - truck)    ;; crate is inside/onboard a truck
    (lifting ?h - hoist ?c - crate)     ;; hoist h is lifting crate c

    ;; hoist resource/fluent
    (available ?h - hoist)              ;; hoist is free for a new operation

    ;; surface / crate top-clearness
    (clear-surface ?s - surface)        ;; true iff surface has no crate on it
    (clear-crate ?c - crate)            ;; true iff crate has nothing on top of it
  )

  ;; Truck driving: atomic move between places
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from) (not (at ?tr ?to)))
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to))
  )

  ;; Hoist lifts crate from a surface at a place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                     (at ?h ?p)
                     (at ?s ?p)
                     (on ?c ?s)
                     (clear-crate ?c)
                     (available ?h))
    :effect (and
              ;; crate removed from surface and place
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
                    (clear-surface ?s))
    :effect (and
              ;; hoist releases the crate and becomes available
              (not (lifting ?h ?c))
              (available ?h)

              ;; crate placed onto surface and at the place
              (on ?c ?s)
              (at ?c ?p)

              ;; surface is now occupied, crate top is clear
              (not (clear-surface ?s))
              (clear-crate ?c)
    )
  )

  ;; Hoist loads a held crate into a co-located truck
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (lifting ?h ?c))
    :effect (and
              ;; hoist releases crate, crate becomes in the truck
              (not (lifting ?h ?c))
              (in-truck ?c ?tr)

              ;; crate no longer reported at the place
              (not (at ?c ?p))

              ;; hoist becomes available
              (available ?h)
    )
  )

  ;; Hoist unloads a crate from a co-located truck and begins lifting it
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (available ?h)
                    (in-truck ?c ?tr))
    :effect (and
              ;; crate removed from truck, hoist becomes busy lifting it
              (not (in-truck ?c ?tr))
              (not (available ?h))
              (lifting ?h ?c)
    )
  )
)