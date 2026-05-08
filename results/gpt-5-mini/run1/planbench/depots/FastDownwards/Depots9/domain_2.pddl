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
    ;; location for any object (hoist, truck, surface, crate inherit object)
    (at ?obj - object ?p - place)

    ;; crate placement modes (kept mutually exclusive through action effects)
    (on ?c - crate ?s - surface)        ;; crate is on a surface (pallet or another surface)
    (in-truck ?c - crate ?tr - truck)  ;; crate is inside/onboard a truck
    (lifting ?h - hoist ?c - crate)     ;; hoist h is lifting crate c

    ;; hoist resource/fluent
    (available ?h - hoist)              ;; hoist is available for a new operation

    ;; surface / crate top-clearness
    (clear-surface ?s - surface)        ;; surface has no crate on it
    (clear-crate ?c - crate)            ;; nothing is on top of this crate
  )

  ;; Drive a truck from one place to another (atomic)
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

  ;; Hoist lifts a crate from a surface at a place.
  ;; Preconditions: hoist and surface at same place, crate on that surface, crate top clear, hoist available.
  ;; Effects: crate removed from surface and from being reported at the place; hoist becomes busy and lifts crate;
  ;;          hoist becomes unavailable; the surface becomes clear.
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
              ;; remove placement on surface and any place-location for the crate
              (not (on ?c ?s))
              (not (at ?c ?p))

              ;; hoist now holds the crate and becomes unavailable
              (lifting ?h ?c)
              (not (available ?h))

              ;; surface becomes clear
              (clear-surface ?s)
    )
  )

  ;; Hoist drops a held crate onto a surface at a place.
  ;; Preconditions: hoist and surface at same place, hoist is lifting that crate, surface is clear.
  ;; Effects: hoist releases crate and becomes available; crate is on the surface and at the place; surface becomes not clear; crate top is clear.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (lifting ?h ?c)
                    (clear-surface ?s)
                  )
    :effect (and
              ;; hoist releases and becomes available
              (not (lifting ?h ?c))
              (available ?h)

              ;; crate placed on surface and reported at place
              (on ?c ?s)
              (at ?c ?p)

              ;; surface now occupied, crate top is clear
              (not (clear-surface ?s))
              (clear-crate ?c)
    )
  )

  ;; Hoist loads a held crate into a co-located truck.
  ;; Preconditions: hoist and truck at same place, hoist is lifting the crate.
  ;; Effects: crate becomes in-truck; hoist releases crate and becomes available; crate not at place (inside truck).
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              ;; hoist releases crate; crate goes into truck
              (not (lifting ?h ?c))
              (in-truck ?c ?tr)

              ;; crate is no longer reported at the place (now inside truck)
              (not (at ?c ?p))
              ;; ensure it is not marked on any surface
              (forall (?s - surface) (not (on ?c ?s)))

              ;; hoist becomes available
              (available ?h)
    )
  )

  ;; Hoist unloads a crate from a co-located truck and begins lifting it.
  ;; Preconditions: hoist and truck at same place, hoist available, crate in the truck.
  ;; Effects: crate removed from truck, hoist becomes unavailable and is lifting the crate.
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?tr ?p)
                    (available ?h)
                    (in-truck ?c ?tr)
                  )
    :effect (and
              ;; crate removed from truck; hoist becomes busy lifting it
              (not (in-truck ?c ?tr))
              (not (available ?h))
              (lifting ?h ?c)
    )
  )
)