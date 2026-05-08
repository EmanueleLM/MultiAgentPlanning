(define (domain depots18)
  :requirements :strips :typing :negative-preconditions
  :types place truck hoist surface crate pallet - surface

  :predicates
    ;; location predicates
    (truck_at ?tr - truck ?pl - place)
    (hoist_at ?h - hoist ?pl - place)
    (surface_at ?s - surface ?pl - place) ;; applies to pallets and crates when they rest at a place

    ;; stacking / contents
    (on ?c - crate ?s - surface)       ;; crate directly on a surface (crate or pallet)
    (clear ?s - surface)              ;; nothing on top of this surface (crate or pallet)
    (in_truck ?c - crate ?tr - truck) ;; crate inside a truck

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)

  ;; Drive a truck between places (trucks can drive between any two places).
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck_at ?tr ?from)
    :effect (and
              (not (truck_at ?tr ?from))
              (truck_at ?tr ?to)
            )
  )

  ;; Hoist lifts a crate from a surface at the same place.
  ;; Preconditions: hoist at place, crate and support surface at same place, hoist available, crate clear.
  ;; Effects: crate no longer at the place (held), hoist holding crate, hoist becomes unavailable,
  ;;          support becomes clear, crate no longer on that surface.
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
                    (hoist_at ?h ?pl)
                    (surface_at ?c ?pl)
                    (surface_at ?s ?pl)
                    (on ?c ?s)
                    (hoist_available ?h)
                    (clear ?c)
                  )
    :effect (and
              (not (surface_at ?c ?pl))
              (hoist_holding ?h ?c)
              (not (hoist_available ?h))
              (clear ?s)
              (not (on ?c ?s))
            )
  )

  ;; Hoist drops a held crate onto a surface at the same place.
  ;; Preconditions: hoist at place, destination surface at place, hoist holding crate, destination clear.
  ;; Effects: hoist becomes available, hoist no longer holding, crate at place on surface, dest no longer clear, crate becomes clear (top).
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
                    (hoist_at ?h ?pl)
                    (surface_at ?s ?pl)
                    (hoist_holding ?h ?c)
                    (clear ?s)
                  )
    :effect (and
              (hoist_available ?h)
              (not (hoist_holding ?h ?c))
              (surface_at ?c ?pl)
              (not (clear ?s))
              (clear ?c)
              (on ?c ?s)
            )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  ;; Preconditions: hoist at place, truck at place, hoist holding crate.
  ;; Effects: crate becomes in the truck, crate not at the place, hoist stops holding and becomes available.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
                    (hoist_at ?h ?pl)
                    (truck_at ?tr ?pl)
                    (hoist_holding ?h ?c)
                  )
    :effect (and
              (in_truck ?c ?tr)
              (not (surface_at ?c ?pl))
              (not (hoist_holding ?h ?c))
              (hoist_available ?h)
            )
  )

  ;; Hoist unloads a crate from a truck (hoist must be at same place and available).
  ;; Preconditions: hoist at place, truck at place, hoist available, crate in truck.
  ;; Effects: crate removed from truck, hoist becomes not available and holds the crate.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
                    (hoist_at ?h ?pl)
                    (truck_at ?tr ?pl)
                    (hoist_available ?h)
                    (in_truck ?c ?tr)
                  )
    :effect (and
              (not (in_truck ?c ?tr))
              (hoist_holding ?h ?c)
              (not (hoist_available ?h))
            )
  )
)