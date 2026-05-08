(define (domain depots_hoist_drive)
  (:requirements :strips :typing)
  (:types place truck hoist surface pallet crate)

  (:predicates
    ;; locations
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; truck contents
    (in_truck ?c - crate ?tr - truck)

    ;; stacking and placement: both pallets and crates are surfaces
    (on ?top - surface ?bottom - surface)
    (surface_at ?s - surface ?p - place)

    ;; clearance for lifting/dropping (true if nothing is on top of this surface)
    (clear ?s - surface)
  )

  ;; Drive a truck from one place to another.
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at_truck ?tr ?from))
    :effect (and
              (not (at_truck ?tr ?from))
              (at_truck ?tr ?to)
            )
  )

  ;; Hoist lifts a crate from a surface at the hoist's place.
  ;; Preconditions: hoist is at same place, hoist available, crate is the top object on a surface at that place, crate is clear.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (available ?h)
                    (on ?c ?s)
                    (surface_at ?s ?p)
                    (clear ?c)
                  )
    :effect (and
              ;; crate removed from surface
              (not (on ?c ?s))
              ;; the surface becomes clear (crate removed from it)
              (clear ?s)
              ;; hoist starts lifting the crate and becomes unavailable
              (lifting ?h ?c)
              (not (available ?h))
            )
  )

  ;; Hoist drops a crate it is lifting onto a surface at the same place.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (surface_at ?s ?p)
                    (clear ?s)
                    (lifting ?h ?c)
                  )
    :effect (and
              ;; crate placed on surface
              (on ?c ?s)
              ;; hoist releases the crate and becomes available
              (not (lifting ?h ?c))
              (available ?h)
              ;; the surface is no longer clear; the crate top is clear
              (not (clear ?s))
              (clear ?c)
            )
  )

  ;; Hoist loads a crate it is currently lifting into a co-located truck.
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_truck ?tr ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              ;; crate placed into truck
              (in_truck ?c ?tr)
              ;; hoist no longer lifting and becomes available
              (not (lifting ?h ?c))
              (available ?h)
            )
  )

  ;; Hoist unloads a crate from a co-located truck into the hoist (hoist becomes lifting and unavailable).
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_truck ?tr ?p)
                    (available ?h)
                    (in_truck ?c ?tr)
                  )
    :effect (and
              ;; crate removed from truck and hoist starts lifting it
              (not (in_truck ?c ?tr))
              (lifting ?h ?c)
              (not (available ?h))
            )
  )
)