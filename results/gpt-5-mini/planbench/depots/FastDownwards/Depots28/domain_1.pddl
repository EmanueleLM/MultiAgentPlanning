(define (domain crate_hoist_drive)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist surface)

  (:predicates
    (at ?tr - truck ?p - place)                ;; truck at place
    (at-hoist ?h - hoist ?p - place)           ;; hoist at place

    (available ?h - hoist)                     ;; hoist is free
    (lifting ?h - hoist ?c - surface)          ;; hoist h is lifting crate c

    (in-truck ?c - surface ?tr - truck)        ;; crate c is in truck tr

    (on ?top - surface ?bottom - surface)      ;; top surface is on bottom surface
    (surface-at ?s - surface ?p - place)       ;; surface s is located at place p

    (clear ?s - surface)                       ;; top of surface/stack is clear
  )

  ;; Drive a truck from one place to another (trucks can drive between any places).
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from))
    :effect (and (not (at ?tr ?from)) (at ?tr ?to))
  )

  ;; Hoist lifts a crate from a surface at the hoist's place.
  ;; Preconditions: hoist co-located, available, crate is on surface s, surface s at same place, crate clear.
  ;; Effects: crate removed from surface, surface becomes clear, hoist lifts crate, hoist becomes unavailable.
  (:action hoist-lift
    :parameters (?h - hoist ?c - surface ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (available ?h)
                    (on ?c ?s)
                    (surface-at ?s ?p)
                    (clear ?c)
                  )
    :effect (and
              (not (on ?c ?s))
              (clear ?s)
              (lifting ?h ?c)
              (not (available ?h))
              (clear ?c)
            )
  )

  ;; Hoist drops a crate it is lifting onto a surface at same place.
  ;; Preconditions: hoist co-located, surface at place and clear, hoist lifting crate.
  ;; Effects: crate placed on surface, surface not clear, crate clear, hoist free, hoist no longer lifting.
  (:action hoist-drop
    :parameters (?h - hoist ?c - surface ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (surface-at ?s ?p)
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
  (:action hoist-load
    :parameters (?h - hoist ?c - surface ?tr - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at ?tr ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              (in-truck ?c ?tr)
              (not (lifting ?h ?c))
              (available ?h)
              (clear ?tr) ;; auxiliary: truck tops are considered clear (no effect on surfaces)
            )
  )

  ;; Hoist unloads a crate from a co-located truck into the hoist (hoist becomes lifting and unavailable).
  ;; Preconditions: hoist and truck co-located, hoist available, crate in truck.
  ;; Effects: crate removed from truck, hoist lifting crate, hoist becomes unavailable.
  (:action hoist-unload
    :parameters (?h - hoist ?c - surface ?tr - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at ?tr ?p)
                    (available ?h)
                    (in-truck ?c ?tr)
                  )
    :effect (and
              (not (in-truck ?c ?tr))
              (lifting ?h ?c)
              (not (available ?h))
            )
  )
)