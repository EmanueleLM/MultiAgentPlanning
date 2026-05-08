(define (domain depots_hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck hoist - object
  )

  (:predicates
    (truck_at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (hoist_holding ?h - hoist ?c - crate)
    (hoist_free ?h - hoist)
    (clear ?s - surface)
  )

  ;; DRIVER actions: drive trucks between any two places (roads connect all places)
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck_at ?tr ?from)
    :effect (and
              (not (truck_at ?tr ?from))
              (truck_at ?tr ?to)
            )
  )

  ;; HOIST actions

  ;; move hoist between places; preserves whether it is holding a crate
  (:action hoist_move
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (hoist_at ?h ?from)
    :effect (and
              (not (hoist_at ?h ?from))
              (hoist_at ?h ?to)
            )
  )

  ;; hoist lifts a crate from a surface at the same place
  ;; requires: hoist co-located with surface, crate on that surface, hoist free, crate clear
  ;; effects: crate no longer on that surface and no longer recorded at the place,
  ;; hoist holds crate and becomes not free, the underlying surface becomes clear.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist_at ?h ?p)
                    (surface_at ?s ?p)
                    (on ?c ?s)
                    (hoist_free ?h)
                    (clear ?c)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (surface_at ?c ?p))
              (hoist_holding ?h ?c)
              (not (hoist_free ?h))
              (clear ?s)
            )
  )

  ;; hoist lowers a held crate onto a surface at the same place
  ;; requires: hoist holds crate, target surface at same place and is clear
  ;; effects: crate placed on surface and recorded at place, hoist becomes free and no longer holds crate,
  ;; target surface becomes not clear, crate is clear.
  (:action hoist_lower
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist_at ?h ?p)
                    (surface_at ?s ?p)
                    (hoist_holding ?h ?c)
                    (clear ?s)
                  )
    :effect (and
              (on ?c ?s)
              (surface_at ?c ?p)
              (hoist_free ?h)
              (not (hoist_holding ?h ?c))
              (not (clear ?s))
              (clear ?c)
            )
  )

  ;; hoist loads a held crate into a co-located truck
  ;; requires: hoist holds crate and both hoist and truck at same place
  ;; effects: crate is placed in the truck, crate is no longer recorded at the place,
  ;; hoist becomes free and no longer holds the crate.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist_at ?h ?p)
                    (truck_at ?t ?p)
                    (hoist_holding ?h ?c)
                  )
    :effect (and
              (in_truck ?c ?t)
              (not (surface_at ?c ?p))
              (hoist_free ?h)
              (not (hoist_holding ?h ?c))
            )
  )

  ;; hoist unloads a crate from a co-located truck (hoist takes the crate out of the truck)
  ;; requires: hoist free, hoist and truck co-located, and crate is in the truck
  ;; effects: crate removed from truck and hoist begins holding crate (becomes not free);
  ;; crate is not recorded at the place while being held.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist_at ?h ?p)
                    (truck_at ?t ?p)
                    (hoist_free ?h)
                    (in_truck ?c ?t)
                  )
    :effect (and
              (not (in_truck ?c ?t))
              (not (surface_at ?c ?p))
              (hoist_holding ?h ?c)
              (not (hoist_free ?h))
            )
  )

)