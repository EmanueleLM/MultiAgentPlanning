(define (domain crate_hoist_drive)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist surface)

  (:predicates
    ;; Locations / resources
    (at ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)

    ;; Hoist states and cargo
    (available ?h - hoist)
    (lifting ?h - hoist ?c - surface)     ;; hoist h is lifting crate c

    ;; Truck contents
    (in-truck ?c - surface ?tr - truck)

    ;; Stack relations and surface placement
    (on ?top - surface ?bottom - surface) ;; top is on bottom
    (surface-at ?s - surface ?p - place)  ;; surface s is located at place p

    ;; Top-of-surface/stack clear
    (clear ?s - surface)
  )

  ;; DRIVER actions (prefixed with agent id "driver-")
  ;; Generic drive while carrying a specified surface (crate)
  (:action driver-drive-with
    :parameters (?tr - truck ?from - place ?to - place ?c - surface)
    :precondition (and (at ?tr ?from) (in-truck ?c ?tr))
    :effect (and (not (at ?tr ?from)) (at ?tr ?to))
  )

  ;; Specific driver action that returns truck2 from depot1 to depot0
  ;; only allowed after crate2 has been placed on pallet0 at depot1.
  ;; This enforces that the unload at depot1 (crate2->pallet0) occurs before the return drive.
  (:action driver-drive-truck2-depot1-depot0-return
    :parameters ()
    :precondition (and (at truck2 depot1) (on crate2 pallet0) (surface-at pallet0 depot1))
    :effect (and (not (at truck2 depot1)) (at truck2 depot0))
  )

  ;; HOIST actions (prefixed with agent id "hoist_operator-")
  ;; Lift a crate from a surface into hoist (removes crate from that surface)
  (:action hoist_operator-hoist_lift
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
              (not (clear ?s))
              (lifting ?h ?c)
              (not (available ?h))
            )
  )

  ;; Load a crate from hoist into truck (hoist must be lifting the crate; truck and hoist co-located)
  (:action hoist_operator-hoist_load
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
            )
  )

  ;; Unload a crate from truck into the hoist (hoist becomes lifting the crate)
  (:action hoist_operator-hoist_unload
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

  ;; Drop a crate the hoist is holding onto a surface at the same place
  (:action hoist_operator-hoist_drop
    :parameters (?h - hoist ?c - surface ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (surface-at ?s ?p)
                    (clear ?s)
                    (lifting ?h ?c)
                  )
    :effect (and
              (on ?c ?s)
              (clear ?c)
              (not (lifting ?h ?c))
              (available ?h)
              (not (clear ?s))
            )
  )
)