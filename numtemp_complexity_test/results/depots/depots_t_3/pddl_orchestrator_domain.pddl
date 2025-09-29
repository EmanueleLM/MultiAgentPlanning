(define (domain multiagent-temporal-stacking)
  (:requirements :typing :durative-actions :numeric-fluents :negative-preconditions :fluents :conditional-effects :duration-inequalities)
  (:types
    crate pallet truck hoist place - thing
    thing
  )

  (:predicates
    (at ?o - thing ?p - place)
    (on ?c - crate ?s - (either crate pallet))
    (in ?c - crate ?t - truck)
    (clear ?s - (either crate pallet))
    (hoist-empty ?h - hoist)
    (holding ?h - hoist ?c - crate)
  )

  (:functions
    (dist ?from - place ?to - place) ; directed distances
    (speed ?t - truck)
    (power ?h - hoist)
    (weight ?c - crate)
    (total-time)
  )

  ;; Truck drive: duration = dist(from,to) / speed(truck)
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (dist ?from ?to) (speed ?tr)))
    :condition (and
      (at start (at ?tr ?from))
    )
    :effect (and
      (at start (not (at ?tr ?from)))
      (at end (at ?tr ?to))
      (at end (increase (total-time) ?duration))
    )
  )

  ;; Hoist lift: pick up a crate from a surface (crate or pallet)
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?surf - (either crate pallet) ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at ?h ?p))
      (at start (at ?surf ?p))
      (at start (on ?c ?surf))
      (at start (clear ?c))
      (at start (hoist-empty ?h))
    )
    :effect (and
      ;; at start effects: remove stacking and location, mark hoist non-empty
      (at start (not (on ?c ?surf)))
      (at start (not (at ?c ?p)))
      (at start (not (hoist-empty ?h)))
      ;; at end effects: hoist holds the crate, surface becomes clear, increment time
      (at end (holding ?h ?c))
      (at end (clear ?surf))
      (at end (increase (total-time) ?duration))
    )
  )

  ;; Hoist put-down: put a held crate onto a surface (crate or pallet)
  (:durative-action hoist-put
    :parameters (?h - hoist ?c - crate ?surf - (either crate pallet) ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at ?h ?p))
      (at start (at ?surf ?p))
      (at start (holding ?h ?c))
      (at start (clear ?surf))
    )
    :effect (and
      ;; at start: hoist is holding; at end: crate on surface, hoist becomes empty
      (at end (on ?c ?surf))
      (at end (at ?c ?p))
      (at end (hoist-empty ?h))
      (at end (not (holding ?h ?c)))
      ;; surface now not clear, crate becomes clear (top)
      (at end (not (clear ?surf)))
      (at end (clear ?c))
      (at end (increase (total-time) ?duration))
    )
  )

  ;; Hoist load: move a held crate into a truck at same place
  (:durative-action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (at ?h ?p))
      (at start (at ?tr ?p))
      (at start (holding ?h ?c))
    )
    :effect (and
      ;; crate no longer held at end, becomes in truck
      (at end (in ?c ?tr))
      (at end (not (holding ?h ?c)))
      (at end (hoist-empty ?h))
      (at end (not (at ?c ?p)))
      (at end (increase (total-time) ?duration))
    )
  )

  ;; Hoist unload: move a crate from a truck onto a surface at same place
  (:durative-action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?surf - (either crate pallet) ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (at ?h ?p))
      (at start (at ?tr ?p))
      (at start (in ?c ?tr))
      (at start (hoist-empty ?h))
      (at start (at ?surf ?p))
      (at start (clear ?surf))
    )
    :effect (and
      ;; crate removed from truck at start so it is unavailable, hoist becomes non-empty during action
      (at start (not (in ?c ?tr)))
      (at start (not (hoist-empty ?h)))
      ;; at end: crate placed on surface and hoist emptied
      (at end (on ?c ?surf))
      (at end (at ?c ?p))
      (at end (hoist-empty ?h))
      (at end (not (holding ?h ?c))) ; hoist not holding after finishing
      (at end (not (clear ?surf)))
      (at end (clear ?c))
      (at end (increase (total-time) ?duration))
    )
  )

)