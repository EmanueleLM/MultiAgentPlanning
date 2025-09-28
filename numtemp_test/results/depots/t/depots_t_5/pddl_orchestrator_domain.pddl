(define (domain multiagent-loading)
  (:requirements :typing :fluents :durative-actions :negative-preconditions)
  (:types place truck hoist surface pallet crate)
  ;; pallets and crates are surfaces
  (:constants)
  (:predicates
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at ?s - surface ?p - place)                ; surface (pallet or crate) is located at place
    (on ?c - crate ?s - surface)                ; crate is placed on surface (pallet or crate)
    (in-truck ?c - crate ?t - truck)
    (clear ?s - surface)                        ; nothing on top of this surface
    (available ?h - hoist)                      ; hoist is free to operate
    (holding ?h - hoist ?c - crate)             ; hoist is holding this crate
  )

  (:functions
    (weight ?c - crate)
    (power ?h - hoist)
    (speed-truck ?t - truck)
    (distance ?from - place ?to - place)
  )

  ;; Actions for trucks (distinct for each truck)
  ;; drive-truck0
  (:durative-action drive-truck0
    :parameters (?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed-truck truck0)))
    :condition (and
      (at start (at-truck truck0 ?from))
    )
    :effect (and
      (at start (not (at-truck truck0 ?from)))
      (at end (at-truck truck0 ?to))
    )
  )

  ;; drive-truck1
  (:durative-action drive-truck1
    :parameters (?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed-truck truck1)))
    :condition (and
      (at start (at-truck truck1 ?from))
    )
    :effect (and
      (at start (not (at-truck truck1 ?from)))
      (at end (at-truck truck1 ?to))
    )
  )

  ;; For each hoist we create separate lift, putdown, load, unload actions
  ;; hoist0 actions
  (:durative-action lift-hoist0
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist0)))
    :condition (and
      (at start (at-hoist hoist0 ?p))
      (at start (at ?s ?p))
      (at start (on ?c ?s))
      (at start (available hoist0))
      (at start (clear ?c))
      (at start (not (holding hoist0 ?c)))
    )
    :effect (and
      (at start (not (on ?c ?s)))
      (at start (not (available hoist0)))
      (at start (holding hoist0 ?c))
      (at start (clear ?s))
      (at end (not (holding hoist0 ?c))) ; temporarily ensure consistency; actual holding persists across interval - but we mark hold at start and keep it until putdown/load
      (at end (holding hoist0 ?c))
    )
  )

  (:durative-action putdown-hoist0
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist0)))
    :condition (and
      (at start (holding hoist0 ?c))
      (at start (at-hoist hoist0 ?p))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (holding hoist0 ?c)))
      (at end (on ?c ?s))
      (at end (not (available hoist0)))
      (at end (available hoist0))
      (at end (clear ?c))
      (at end (not (clear ?s)))
    )
  )

  (:durative-action load-hoist0
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist0)))
    :condition (and
      (at start (holding hoist0 ?c))
      (at start (at-hoist hoist0 ?p))
      (at start (at-truck ?t ?p))
    )
    :effect (and
      (at start (not (holding hoist0 ?c)))
      (at end (in-truck ?c ?t))
      (at end (available hoist0))
    )
  )

  (:durative-action unload-hoist0
    :parameters (?c - crate ?t - truck ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist0)))
    :condition (and
      (at start (available hoist0))
      (at start (at-hoist hoist0 ?p))
      (at start (at-truck ?t ?p))
      (at start (in-truck ?c ?t))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (available hoist0)))
      (at end (not (in-truck ?c ?t)))
      (at end (on ?c ?s))
      (at end (available hoist0))
      (at end (not (clear ?s)))
      (at end (clear ?c))
    )
  )

  ;; hoist1 actions
  (:durative-action lift-hoist1
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist1)))
    :condition (and
      (at start (at-hoist hoist1 ?p))
      (at start (at ?s ?p))
      (at start (on ?c ?s))
      (at start (available hoist1))
      (at start (clear ?c))
      (at start (not (holding hoist1 ?c)))
    )
    :effect (and
      (at start (not (on ?c ?s)))
      (at start (not (available hoist1)))
      (at start (holding hoist1 ?c))
      (at start (clear ?s))
      (at end (holding hoist1 ?c))
    )
  )

  (:durative-action putdown-hoist1
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist1)))
    :condition (and
      (at start (holding hoist1 ?c))
      (at start (at-hoist hoist1 ?p))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (holding hoist1 ?c)))
      (at end (on ?c ?s))
      (at end (available hoist1))
      (at end (clear ?c))
      (at end (not (clear ?s)))
    )
  )

  (:durative-action load-hoist1
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist1)))
    :condition (and
      (at start (holding hoist1 ?c))
      (at start (at-hoist hoist1 ?p))
      (at start (at-truck ?t ?p))
    )
    :effect (and
      (at start (not (holding hoist1 ?c)))
      (at end (in-truck ?c ?t))
      (at end (available hoist1))
    )
  )

  (:durative-action unload-hoist1
    :parameters (?c - crate ?t - truck ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist1)))
    :condition (and
      (at start (available hoist1))
      (at start (at-hoist hoist1 ?p))
      (at start (at-truck ?t ?p))
      (at start (in-truck ?c ?t))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (available hoist1)))
      (at end (not (in-truck ?c ?t)))
      (at end (on ?c ?s))
      (at end (available hoist1))
      (at end (not (clear ?s)))
      (at end (clear ?c))
    )
  )

  ;; hoist2 actions
  (:durative-action lift-hoist2
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist2)))
    :condition (and
      (at start (at-hoist hoist2 ?p))
      (at start (at ?s ?p))
      (at start (on ?c ?s))
      (at start (available hoist2))
      (at start (clear ?c))
      (at start (not (holding hoist2 ?c)))
    )
    :effect (and
      (at start (not (on ?c ?s)))
      (at start (not (available hoist2)))
      (at start (holding hoist2 ?c))
      (at start (clear ?s))
      (at end (holding hoist2 ?c))
    )
  )

  (:durative-action putdown-hoist2
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist2)))
    :condition (and
      (at start (holding hoist2 ?c))
      (at start (at-hoist hoist2 ?p))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (holding hoist2 ?c)))
      (at end (on ?c ?s))
      (at end (available hoist2))
      (at end (clear ?c))
      (at end (not (clear ?s)))
    )
  )

  (:durative-action load-hoist2
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist2)))
    :condition (and
      (at start (holding hoist2 ?c))
      (at start (at-hoist hoist2 ?p))
      (at start (at-truck ?t ?p))
    )
    :effect (and
      (at start (not (holding hoist2 ?c)))
      (at end (in-truck ?c ?t))
      (at end (available hoist2))
    )
  )

  (:durative-action unload-hoist2
    :parameters (?c - crate ?t - truck ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist2)))
    :condition (and
      (at start (available hoist2))
      (at start (at-hoist hoist2 ?p))
      (at start (at-truck ?t ?p))
      (at start (in-truck ?c ?t))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (available hoist2)))
      (at end (not (in-truck ?c ?t)))
      (at end (on ?c ?s))
      (at end (available hoist2))
      (at end (not (clear ?s)))
      (at end (clear ?c))
    )
  )

  ;; hoist3 actions
  (:durative-action lift-hoist3
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist3)))
    :condition (and
      (at start (at-hoist hoist3 ?p))
      (at start (at ?s ?p))
      (at start (on ?c ?s))
      (at start (available hoist3))
      (at start (clear ?c))
      (at start (not (holding hoist3 ?c)))
    )
    :effect (and
      (at start (not (on ?c ?s)))
      (at start (not (available hoist3)))
      (at start (holding hoist3 ?c))
      (at start (clear ?s))
      (at end (holding hoist3 ?c))
    )
  )

  (:durative-action putdown-hoist3
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist3)))
    :condition (and
      (at start (holding hoist3 ?c))
      (at start (at-hoist hoist3 ?p))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (holding hoist3 ?c)))
      (at end (on ?c ?s))
      (at end (available hoist3))
      (at end (clear ?c))
      (at end (not (clear ?s)))
    )
  )

  (:durative-action load-hoist3
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist3)))
    :condition (and
      (at start (holding hoist3 ?c))
      (at start (at-hoist hoist3 ?p))
      (at start (at-truck ?t ?p))
    )
    :effect (and
      (at start (not (holding hoist3 ?c)))
      (at end (in-truck ?c ?t))
      (at end (available hoist3))
    )
  )

  (:durative-action unload-hoist3
    :parameters (?c - crate ?t - truck ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist3)))
    :condition (and
      (at start (available hoist3))
      (at start (at-hoist hoist3 ?p))
      (at start (at-truck ?t ?p))
      (at start (in-truck ?c ?t))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (available hoist3)))
      (at end (not (in-truck ?c ?t)))
      (at end (on ?c ?s))
      (at end (available hoist3))
      (at end (not (clear ?s)))
      (at end (clear ?c))
    )
  )

  ;; hoist4 actions
  (:durative-action lift-hoist4
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist4)))
    :condition (and
      (at start (at-hoist hoist4 ?p))
      (at start (at ?s ?p))
      (at start (on ?c ?s))
      (at start (available hoist4))
      (at start (clear ?c))
      (at start (not (holding hoist4 ?c)))
    )
    :effect (and
      (at start (not (on ?c ?s)))
      (at start (not (available hoist4)))
      (at start (holding hoist4 ?c))
      (at start (clear ?s))
      (at end (holding hoist4 ?c))
    )
  )

  (:durative-action putdown-hoist4
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist4)))
    :condition (and
      (at start (holding hoist4 ?c))
      (at start (at-hoist hoist4 ?p))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (holding hoist4 ?c)))
      (at end (on ?c ?s))
      (at end (available hoist4))
      (at end (clear ?c))
      (at end (not (clear ?s)))
    )
  )

  (:durative-action load-hoist4
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist4)))
    :condition (and
      (at start (holding hoist4 ?c))
      (at start (at-hoist hoist4 ?p))
      (at start (at-truck ?t ?p))
    )
    :effect (and
      (at start (not (holding hoist4 ?c)))
      (at end (in-truck ?c ?t))
      (at end (available hoist4))
    )
  )

  (:durative-action unload-hoist4
    :parameters (?c - crate ?t - truck ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist4)))
    :condition (and
      (at start (available hoist4))
      (at start (at-hoist hoist4 ?p))
      (at start (at-truck ?t ?p))
      (at start (in-truck ?c ?t))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (available hoist4)))
      (at end (not (in-truck ?c ?t)))
      (at end (on ?c ?s))
      (at end (available hoist4))
      (at end (not (clear ?s)))
      (at end (clear ?c))
    )
  )

  ;; hoist5 actions
  (:durative-action lift-hoist5
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist5)))
    :condition (and
      (at start (at-hoist hoist5 ?p))
      (at start (at ?s ?p))
      (at start (on ?c ?s))
      (at start (available hoist5))
      (at start (clear ?c))
      (at start (not (holding hoist5 ?c)))
    )
    :effect (and
      (at start (not (on ?c ?s)))
      (at start (not (available hoist5)))
      (at start (holding hoist5 ?c))
      (at start (clear ?s))
      (at end (holding hoist5 ?c))
    )
  )

  (:durative-action putdown-hoist5
    :parameters (?c - crate ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist5)))
    :condition (and
      (at start (holding hoist5 ?c))
      (at start (at-hoist hoist5 ?p))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (holding hoist5 ?c)))
      (at end (on ?c ?s))
      (at end (available hoist5))
      (at end (clear ?c))
      (at end (not (clear ?s)))
    )
  )

  (:durative-action load-hoist5
    :parameters (?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist5)))
    :condition (and
      (at start (holding hoist5 ?c))
      (at start (at-hoist hoist5 ?p))
      (at start (at-truck ?t ?p))
    )
    :effect (and
      (at start (not (holding hoist5 ?c)))
      (at end (in-truck ?c ?t))
      (at end (available hoist5))
    )
  )

  (:durative-action unload-hoist5
    :parameters (?c - crate ?t - truck ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power hoist5)))
    :condition (and
      (at start (available hoist5))
      (at start (at-hoist hoist5 ?p))
      (at start (at-truck ?t ?p))
      (at start (in-truck ?c ?t))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (available hoist5)))
      (at end (not (in-truck ?c ?t)))
      (at end (on ?c ?s))
      (at end (available hoist5))
      (at end (not (clear ?s)))
      (at end (clear ?c))
    )
  )

)