(define (domain crate_hoist_drive)
  (:requirements :strips :typing)
  (:types place truck hoist surface)

  (:predicates
    ;; locations
    (at_truck ?tr - truck ?p - place)        ;; truck at place
    (at_hoist ?h - hoist ?p - place)         ;; hoist at place

    ;; hoist state
    (available ?h - hoist)                   ;; hoist is available
    (lifting ?h - hoist ?c - surface)        ;; hoist is lifting crate c

    ;; truck contents
    (in_truck ?c - surface ?tr - truck)      ;; crate c is in truck tr

    ;; stacking and placement
    (on ?top - surface ?bottom - surface)    ;; top surface is on bottom surface
    (surface_at ?s - surface ?p - place)     ;; surface s is located at place p

    ;; clearance for lifting/dropping
    (clear ?s - surface)                     ;; top of surface/stack is clear
  )

  ;; Drive a truck from one place to another (trucks can drive between any places).
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at_truck ?tr ?from))
    :effect (and
              (not (at_truck ?tr ?from))
              (at_truck ?tr ?to)
            )
  )

  ;; Hoist lifts a crate from a surface at the hoist's place.
  ;; Preconditions: hoist at place, available, crate is on surface s, surface s at same place, crate clear.
  ;; Effects: crate removed from surface, surface becomes clear, hoist lifts crate, hoist becomes unavailable.
  (:action hoist_lift
    :parameters (?h - hoist ?c - surface ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (available ?h)
                    (on ?c ?s)
                    (surface_at ?s ?p)
                    (clear ?c)
                  )
    :effect (and
              (not (on ?c ?s))
              (clear ?s)                   ;; underlying surface becomes clear after removing top
              (lifting ?h ?c)
              (not (available ?h))
            )
  )

  ;; Hoist drops a crate it is lifting onto a surface at same place.
  ;; Preconditions: hoist co-located, surface at place and clear, hoist lifting crate.
  ;; Effects: crate placed on surface, surface not clear, crate clear, hoist free, hoist no longer lifting.
  (:action hoist_drop
    :parameters (?h - hoist ?c - surface ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (surface_at ?s ?p)
                    (clear ?s)
                    (lifting ?h ?c)
                  )
    :effect (and
              (on ?c ?s)
              (not (lifting ?h ?c))
              (available ?h)
              (not (clear ?s))
              (clear ?c)
            )
  )

  ;; Hoist loads a crate it is lifting into a co-located truck.
  ;; Preconditions: hoist and truck at same place, hoist lifting crate.
  ;; Effects: crate is in-truck, hoist becomes free and no longer lifting.
  (:action hoist_load
    :parameters (?h - hoist ?c - surface ?tr - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_truck ?tr ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              (in_truck ?c ?tr)
              (not (lifting ?h ?c))
              (available ?h)
            )
  )

  ;; Hoist unloads a crate from a co-located truck into the hoist (hoist becomes lifting and unavailable).
  ;; Preconditions: hoist and truck co-located, hoist available, crate in truck.
  ;; Effects: crate removed from truck, hoist lifting crate, hoist becomes unavailable.
  (:action hoist_unload
    :parameters (?h - hoist ?c - surface ?tr - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_truck ?tr ?p)
                    (available ?h)
                    (in_truck ?c ?tr)
                  )
    :effect (and
              (not (in_truck ?c ?tr))
              (lifting ?h ?c)
              (not (available ?h))
            )
  )
)