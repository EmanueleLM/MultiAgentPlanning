(define (domain logistics_hoist_driving)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    pallet crate - surface
    truck
    hoist
    stage
  )

  (:predicates
    ;; object location predicates
    (at-truck ?tr - truck ?p - place)
    (at-hoist  ?h  - hoist  ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; stacking and occupancy
    (on ?c - crate ?s - surface)    ; crate on top of surface (crate or pallet)
    (clear ?s - surface)            ; surface is clear on top (no crate on it)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; truck load
    (in-truck ?c - crate ?t - truck)

    ;; connectivity (bidirectional roads are encoded in problem init)
    (connected ?p1 - place ?p2 - place)

    ;; discrete global stage progression to force contiguous, non-oscillating steps
    (current ?st - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Drive action (driver perspective)
  ;; - Moves a truck from one place to another.
  ;; - Requires the truck to be at the origin and a current stage token; consumes the
  ;;   current stage and produces the unique successor stage (strict forward time).
  ;; - Effects are exact: the truck is no longer at origin and is at destination.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place ?st - stage ?stn - stage)
    :precondition (and
                    (at-truck ?tr ?from)
                    (connected ?from ?to)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
              (not (current ?st))
              (current ?stn)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Hoist lift (hoist_operator perspective)
  ;; - Hoist at same place as the supporting surface and the crate on that surface.
  ;; - Hoist must be available and the crate must be clear (topmost).
  ;; - After lifting: hoist is no longer available, hoist is lifting that crate,
  ;;   the crate is removed from its supporting surface and not at that place's surface,
  ;;   the supporting surface becomes clear, and stage advances.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (available ?h)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              (lifting ?h ?c)
              (not (available ?h))
              (not (on ?c ?s))
              (not (at-surface ?c ?p))
              (clear ?s)
              (not (current ?st))
              (current ?stn)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Hoist drop (hoist_operator perspective)
  ;; - Hoist must be lifting the crate and the target surface must be at same place
  ;;   and clear. After drop the crate is placed on the surface, the surface becomes
  ;;   not clear, the crate becomes clear (top), the hoist becomes available and is
  ;;   no longer lifting the crate. Stage advances.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (clear ?s)
                    (lifting ?h ?c)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              (on ?c ?s)
              (at-surface ?c ?p)
              (clear ?c)
              (not (clear ?s))
              (not (lifting ?h ?c))
              (available ?h)
              (not (current ?st))
              (current ?stn)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Hoist load into truck (hoist_operator perspective)
  ;; - Hoist must be lifting the crate and co-located with the truck.
  ;; - After load the crate is in the truck, the hoist becomes available and the crate
  ;;   is no longer considered at any surface at that place. Stage advances.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?tr ?p)
                    (lifting ?h ?c)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              (in-truck ?c ?tr)
              (not (lifting ?h ?c))
              (available ?h)
              (not (at-surface ?c ?p))
              (not (current ?st))
              (current ?stn)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Hoist unload from truck (hoist_operator perspective)
  ;; - Hoist must be at same place as truck, hoist available, and the crate must be
  ;;   in the truck. After unload the crate is removed from the truck and the hoist
  ;;   is not available and is lifting the crate (crate not on any surface).
  ;; - Stage advances.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?tr ?p)
                    (available ?h)
                    (in-truck ?c ?tr)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              (lifting ?h ?c)
              (not (in-truck ?c ?tr))
              (not (available ?h))
              (not (at-surface ?c ?p))
              (not (current ?st))
              (current ?stn)
            )
  )
)