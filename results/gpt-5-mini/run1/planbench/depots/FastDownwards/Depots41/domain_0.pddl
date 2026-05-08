(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    truck
    hoist
    surface pallet crate
  )
  ;; subtypes
  ;; depot and distributor are kinds of place
  ;; pallet and crate are kinds of surface
  (:predicates
    ;; location: trucks, hoists, pallets and crates can be at places
    (at ?o - (either truck hoist pallet crate) ?p - place)

    ;; crate support relation: crate c is on surface s
    (on ?c - crate ?s - surface)

    ;; surface (including pallets and crates) has nothing on top
    (clear ?s - surface)

    ;; hoist availability and usage
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; crate is inside a truck
    (in_truck ?c - crate ?t - truck)
  )

  ;; drive a truck between places
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
                    (at ?tr ?from)
                    (not (= ?from ?to))
                  )
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to)
            )
  )

  ;; use hoist to lift a crate from a surface at a place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (on ?c ?s)
                    (hoist_available ?h)
                    (clear ?c)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (at ?c ?p))
              (hoist_lifting ?h ?c)
              (not (hoist_available ?h))
              (clear ?s)
            )
  )

  ;; use hoist to drop a crate to a surface at a place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (clear ?s)
                    (hoist_lifting ?h ?c)
                  )
    :effect (and
              (hoist_available ?h)
              (not (hoist_lifting ?h ?c))
              (at ?c ?p)
              (not (clear ?s))
              (clear ?c)
              (on ?c ?s)
            )
  )

  ;; use hoist to load a lifted crate into a truck at a place
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (hoist_lifting ?h ?c)
                  )
    :effect (and
              (in_truck ?c ?t)
              (hoist_available ?h)
              (not (hoist_lifting ?h ?c))
              (not (at ?c ?p))
            )
  )

  ;; use hoist to unload a crate from a truck (hoist then lifts the crate)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (hoist_available ?h)
                    (in_truck ?c ?t)
                  )
    :effect (and
              (not (in_truck ?c ?t))
              (not (hoist_available ?h))
              (hoist_lifting ?h ?c)
              (not (at ?c ?p))
            )
  )
)