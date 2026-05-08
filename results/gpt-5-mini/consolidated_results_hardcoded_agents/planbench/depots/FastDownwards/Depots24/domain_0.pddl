(define (domain logistics_hoist_driving)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    pallet crate - surface
    truck
    hoist
  )

  ;; Predicates:
  ;; - at-truck ?t - truck ?p - place       : truck at place (unique per truck)
  ;; - at-hoist  ?h - hoist  ?p - place      : hoist at place (hoists are stationary in this domain)
  ;; - at-surface ?s - surface ?p - place    : a surface (pallet or crate resting at a place)
  ;; - on ?c - crate ?s - surface            : crate is immediately on surface s
  ;; - clear ?s - surface                    : top of surface s is clear (no crate directly on it)
  ;; - available ?h - hoist                  : hoist is idle (not lifting)
  ;; - lifting ?h - hoist ?c - crate         : hoist is lifting crate c (crate not at any place)
  ;; - in-truck ?c - crate ?t - truck        : crate is inside truck (not at any place)
  ;; - connected ?p1 ?p2 - place             : road connectivity (direct movement allowed)
  (:predicates
    (at-truck ?tr - truck ?p - place)
    (at-hoist  ?h  - hoist  ?p - place)
    (at-surface ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in-truck ?c - crate ?t - truck)
    (connected ?p1 - place ?p2 - place)
  )

  ;; Driver actions (driver perspective). Drive moves the truck only.
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
                    (at-truck ?tr ?from)
                    (connected ?from ?to)
                    (not (= ?from ?to))
                  )
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
            )
  )

  ;; Hoist actions (hoist_operator perspective).
  ;; All effects that change crate location/state are explicitly enumerated.
  ;; Preconditions enforce locality and required state; effects maintain exclusivity between
  ;; on / in-truck / lifting representations of crate location.

  ;; hoist_lift: hoist lifts crate from a supporting surface at the hoist's place.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (available ?h)
                  )
    :effect (and
              ;; hoist becomes busy lifting this crate
              (lifting ?h ?c)
              (not (available ?h))
              ;; crate is removed from its supporting surface and no longer considered at the place
              (not (on ?c ?s))
              (not (at-surface ?c ?p))
              ;; the supporting surface becomes clear (top removed)
              (clear ?s)
            )
  )

  ;; hoist_drop: hoist drops the crate it is lifting onto surface S at the hoist's place.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (clear ?s)
                    (lifting ?h ?c)
                  )
    :effect (and
              ;; crate placed on surface S at place P
              (on ?c ?s)
              (at-surface ?c ?p)
              ;; crate is clear immediately after drop (nothing on it)
              (clear ?c)
              ;; surface S now occupied (no longer clear)
              (not (clear ?s))
              ;; hoist releases crate and becomes available
              (not (lifting ?h ?c))
              (available ?h)
            )
  )

  ;; hoist_load: hoist transfers currently-lifted crate into a co-located truck.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?tr ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              ;; crate is now inside truck
              (in-truck ?c ?tr)
              ;; hoist no longer lifts crate and becomes available
              (not (lifting ?h ?c))
              (available ?h)
              ;; crate is not at any surface/place while in truck (ensure at-surface fact is absent)
              (not (at-surface ?c ?p))
              (not (on ?c ?tr)) ;; defensive: crate cannot be on truck as a surface
            )
  )

  ;; hoist_unload: hoist picks crate from truck into its gripper (crate becomes lifted).
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?tr ?p)
                    (available ?h)
                    (in-truck ?c ?tr)
                  )
    :effect (and
              ;; crate removed from truck and hoist takes it (crate suspended)
              (lifting ?h ?c)
              (not (in-truck ?c ?tr))
              ;; hoist is now busy
              (not (available ?h))
              ;; ensure crate not considered at any place or on any surface
              (not (at-surface ?c ?p))
              (not (on ?c ?tr))
            )
  )

)