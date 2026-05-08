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
    (clear ?s - surface)            ; surface (pallet or crate) has nothing on top

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate) ; hoist is currently lifting a specific crate

    ;; truck load
    (in-truck ?c - crate ?t - truck)

    ;; connectivity (problem encodes explicit bidirectional edges)
    (connected ?p1 - place ?p2 - place)

    ;; discrete global stage progression to force strict forward progression
    (current ?st - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Driver: drive a truck from one place to another.
  ;; Preconditions:
  ;;   - truck must be at the origin place.
  ;;   - there must be a current stage and a successor stage available.
  ;; Effects:
  ;;   - truck is removed from origin and placed at destination.
  ;;   - time advances to the successor stage (consumes current stage token).
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
  ;; Hoist lift: hoist lifts a crate from a supporting surface at a place.
  ;; Preconditions:
  ;;   - hoist and supporting surface are at the same place.
  ;;   - the crate is on that supporting surface and is clear (no crate on top).
  ;;   - the hoist is available.
  ;;   - current stage token and its successor exist.
  ;; Effects:
  ;;   - hoist is no longer available and becomes lifting that crate.
  ;;   - the crate is removed from the supporting surface and is no longer at-surface.
  ;;   - the supporting surface becomes clear (top freed).
  ;;   - time advances to the successor stage.
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
  ;; Hoist drop: hoist places a lifted crate onto a target surface at the same place.
  ;; Preconditions:
  ;;   - hoist at place and target surface at same place.
  ;;   - surface must be clear (no crate on it).
  ;;   - hoist must be lifting the crate.
  ;;   - current stage token and successor exist.
  ;; Effects:
  ;;   - crate is placed on the surface and is at-surface at that place.
  ;;   - target surface becomes not clear; crate becomes clear (topmost).
  ;;   - hoist stops lifting the crate and becomes available.
  ;;   - time advances.
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
  ;; Hoist load: hoist loads a lifted crate into a co-located truck.
  ;; Preconditions:
  ;;   - hoist and truck are at the same place.
  ;;   - hoist is lifting the crate.
  ;;   - current stage token and successor exist.
  ;; Effects:
  ;;   - crate becomes in-truck (is not on any surface or at-surface).
  ;;   - hoist stops lifting and becomes available.
  ;;   - time advances.
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
  ;; Hoist unload: hoist removes a crate from a truck and lifts it.
  ;; Preconditions:
  ;;   - hoist and truck at same place.
  ;;   - hoist is available.
  ;;   - crate is in the truck.
  ;;   - current stage token and successor exist.
  ;; Effects:
  ;;   - crate is no longer in-truck.
  ;;   - hoist becomes not available and is lifting the crate.
  ;;   - crate is not at any surface at the place (lifting state).
  ;;   - time advances.
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