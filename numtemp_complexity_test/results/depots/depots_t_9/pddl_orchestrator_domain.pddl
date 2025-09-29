(define (domain orchestrator)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :equality :action-costs)
  (:types
    truck hoist pallet crate place
  )

  (:predicates
    (at ?x - (either truck hoist pallet crate) ?p - place)
    (on ?c - crate ?s - (either crate pallet))
    (clear ?s - (either crate pallet))
    (in-truck ?c - crate ?t - truck)
    (hoist-free ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)
  )

  (:functions
    (distance ?p1 - place ?p2 - place) ; directed distance
    (truck-speed ?t - truck)
    (hoist-power ?h - hoist)
    (crate-weight ?c - crate)
    (total-time)
  )

  ; Drive action for trucks. Duration = distance(from,to) / truck-speed(truck)
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (truck-speed ?tr)))
    :condition (and
      (at start (at ?tr ?from))
    )
    :effect (and
      (at start (not (at ?tr ?from)))
      (at end (at ?tr ?to))
      (at end (increase (total-time) ?duration))
    )
  )

  ; Hoist lifts a clear crate from its support (crate or pallet) at the same place.
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?p - place)
    :duration (= ?duration (/ (crate-weight ?c) (hoist-power ?h)))
    :condition (and
      (at start (hoist-free ?h))
      (at start (at ?h ?p))
      (at start (at ?s ?p))
      (at start (at ?c ?p))
      (at start (on ?c ?s))
      (at start (clear ?c))
    )
    :effect (and
      (at start (not (hoist-free ?h)))
      (at start (not (on ?c ?s)))
      (at start (not (at ?c ?p)))
      (at end (hoist-holding ?h ?c))
      (at end (increase (total-time) ?duration))
      (at end (clear ?s)) ; support becomes clear after lifting top crate
    )
  )

  ; Hoist puts a held crate onto a target support (crate or pallet) at same place.
  (:durative-action hoist-put
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?p - place)
    :duration (= ?duration (/ (crate-weight ?c) (hoist-power ?h)))
    :condition (and
      (at start (hoist-holding ?h ?c))
      (at start (hoist-free ?h)) ; to prevent conflicting use in some planners, require hoist was free flag false at start of put - handled by effects of lift/load
      (at start (at ?h ?p))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (hoist-holding ?h ?c)))
      (at end (hoist-free ?h))
      (at end (on ?c ?s))
      (at end (at ?c ?p))
      (at end (not (clear ?s)))
      (at end (increase (total-time) ?duration))
      (at end (not (clear ?c))) ; newly placed crate is not clear until something explicitly cleared
    )
  )

  ; Hoist loads a crate into a truck (crate removed from site and becomes in-truck).
  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?s - (either crate pallet))
    :duration (= ?duration (/ (crate-weight ?c) (hoist-power ?h)))
    :condition (and
      (at start (hoist-free ?h))
      (at start (at ?h ?p))
      (at start (at ?t ?p))
      (at start (at ?c ?p))
      (at start (on ?c ?s))
      (at start (clear ?c))
    )
    :effect (and
      (at start (not (hoist-free ?h)))
      (at start (not (on ?c ?s)))
      (at start (not (at ?c ?p)))
      (at end (in-truck ?c ?t))
      (at end (hoist-free ?h))
      (at end (clear ?s))
      (at end (increase (total-time) ?duration))
    )
  )

  ; Hoist unloads a crate from a truck to a support (crate or pallet) at the same place.
  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?s - (either crate pallet) ?p - place)
    :duration (= ?duration (/ (crate-weight ?c) (hoist-power ?h)))
    :condition (and
      (at start (hoist-free ?h))
      (at start (at ?h ?p))
      (at start (at ?t ?p))
      (at start (in-truck ?c ?t))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (hoist-free ?h)))
      (at start (not (in-truck ?c ?t)))
      (at end (at ?c ?p))
      (at end (on ?c ?s))
      (at end (hoist-free ?h))
      (at end (not (clear ?s)))
      (at end (increase (total-time) ?duration))
      (at end (not (clear ?c)))
    )
  )

  ; Combined helper: hoist-pick-from-truck-to-hand (explicit pick to holding)
  (:durative-action hoist-pick-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (crate-weight ?c) (hoist-power ?h)))
    :condition (and
      (at start (hoist-free ?h))
      (at start (at ?h ?p))
      (at start (at ?t ?p))
      (at start (in-truck ?c ?t))
    )
    :effect (and
      (at start (not (hoist-free ?h)))
      (at start (not (in-truck ?c ?t)))
      (at end (hoist-holding ?h ?c))
      (at end (increase (total-time) ?duration))
    )
  )

)