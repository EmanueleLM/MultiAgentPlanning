(define (domain multi-agent-warehouse)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :timed-initial-literals :constraints :action-costs)
  (:types
      truck hoist pallet crate place - obj
      obj
  )

  (:predicates
    (on ?c - crate ?s - obj)                      ; crate c is on surface s (crate or pallet)
    (clear ?o - obj)                              ; object (crate or pallet) has nothing on top
    (hoist-available ?h - hoist)                  ; hoist is available
    (hoist-holding ?h - hoist ?c - crate)         ; hoist is holding crate
    (at-truck ?t - truck ?p - place)              ; truck is at place
    (at-hoist ?h - hoist ?p - place)              ; hoist is at place (hoists stationary)
    (at-obj ?o - obj ?p - place)                  ; object (pallet or crate) is at place (ground location)
    (in-truck ?c - crate ?t - truck)              ; crate is inside/loaded in truck
  )

  ;; Truck driving action (applies to any truck). While driving, the truck is not at any place:
  (:durative-action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration 10)
    :condition (and
      (at start (at-truck ?tr ?from))
      ;; during driving the truck has no place location (we model that by removing at-truck at start)
    )
    :effect (and
      (at start (not (at-truck ?tr ?from)))
      (at end (at-truck ?tr ?to))
    )
  )

  ;; Hoist lifts a crate from a surface (crate or pallet).
  ;; Duration 1. Start effects happen at start: crate is removed from surface and hoist immediately holds it.
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (hoist-available ?h))
      (at start (at-hoist ?h ?p))
      (at start (at-obj ?s ?p))            ; surface is at the same place
      (at start (on ?c ?s))                ; crate is on the surface at the start
      (at start (clear ?c))                ; crate top is clear (nothing on it)
      (over all (at-hoist ?h ?p))          ; hoist stays at its place during the action
    )
    :effect (and
      ;; start effects
      (at start (not (on ?c ?s)))
      (at start (not (at-obj ?c ?p)))      ; crate is no longer at the place while held
      (at start (hoist-holding ?h ?c))
      (at start (not (hoist-available ?h)))
      (at start (clear ?s))                ; surface becomes clear immediately when crate is lifted
    )
  )

  ;; Hoist puts down a hoist-held crate onto a surface at the hoist's place.
  ;; Duration 1. Effects occur at end.
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (hoist-holding ?h ?c))
      (at start (at-hoist ?h ?p))
      (at start (at-obj ?s ?p))
      (at start (clear ?s))                ; target surface must be clear at start
      (over all (at-hoist ?h ?p))
    )
    :effect (and
      (at end (not (hoist-holding ?h ?c)))
      (at end (on ?c ?s))
      (at end (at-obj ?c ?p))
      (at end (hoist-available ?h))
      (at end (not (clear ?s)))
      (at end (clear ?c))
    )
  )

  ;; Hoist loads a hoist-held crate into a truck at the same place as the hoist.
  ;; Duration 3. Putting into truck effects happen at end.
  (:durative-action hoist-load-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration 3)
    :condition (and
      (at start (hoist-holding ?h ?c))
      (at start (at-hoist ?h ?p))
      (at start (at-truck ?t ?p))
      (over all (at-hoist ?h ?p))
      (over all (at-truck ?t ?p))
    )
    :effect (and
      (at end (not (hoist-holding ?h ?c)))
      (at end (in-truck ?c ?t))
      (at end (hoist-available ?h))
    )
  )

  ;; Hoist takes a crate out of a truck. Duration 4. Start effects happen at start:
  ;; crate is removed from the truck and hoist immediately holds it.
  (:durative-action hoist-unload-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration 4)
    :condition (and
      (at start (in-truck ?c ?t))
      (at start (at-hoist ?h ?p))
      (at start (at-truck ?t ?p))
      (over all (at-hoist ?h ?p))
      (over all (at-truck ?t ?p))
    )
    :effect (and
      ;; start effects: crate removed from truck and hoist holds it immediately
      (at start (not (in-truck ?c ?t)))
      (at start (hoist-holding ?h ?c))
      (at start (not (hoist-available ?h)))
      (at start (not (at-obj ?c ?p)))
    )
  )

)