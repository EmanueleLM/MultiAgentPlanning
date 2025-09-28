(define (domain multiagent-hoist-truck)
  (:requirements :strips :typing :negative-preconditions :equality :conditional-effects :disjunctive-preconditions :quantified-preconditions :numeric-fluents)
  (:types
    place entity truck hoist pallet crate
  )
  ;; declare that truck/hoist/pallet/crate are subtypes of entity
  ;; NOTE: some parsers accept the '-' subtype notation only once; to keep compatibility
  ;; we use the simple flat listing but use 'entity' as a common type in predicates.
  (:predicates
    (at-entity ?e - entity ?p - place)        ; generic location for trucks/hoists/pallets/crates
    (truck-at ?t - truck ?p - place)          ; convenience predicate for trucks
    (hoist-at ?h - hoist ?p - place)          ; convenience predicate for hoists
    (on ?c - crate ?s - entity)               ; crate on top of other entity (crate or pallet)
    (in-truck ?c - crate ?t - truck)
    (clear ?s - entity)
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
    (lifted-from ?c - crate ?s - entity)
  )
  (:functions
    (current-load ?t - truck)
    (load-limit ?t - truck)
    (weight ?c - crate)
    (fuel-cost)
  )

  ;; Drive truck: update both convenience truck-at and generic at-entity predicates
  (:action drive-truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (truck-at ?t ?from) (not (= ?from ?to)))
    :effect (and
              (not (at-entity ?t ?from))
              (at-entity ?t ?to)
              (not (truck-at ?t ?from))
              (truck-at ?t ?to)
              (increase (fuel-cost) 10))
  )

  ;; Hoist lifts a crate from a surface (surface is an entity: pallet or crate)
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - entity ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (at-entity ?s ?p)
                    (at-entity ?c ?p)
                    (on ?c ?s)
                    (hoist-available ?h)
                    (clear ?c)
                    (clear ?s)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (at-entity ?c ?p))
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (not (clear ?c))
              (lifted-from ?c ?s)
              (increase (fuel-cost) 1))
  )

  (:action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - entity ?p - place)
    :precondition (and
                    (hoist-lifting ?h ?c)
                    (hoist-at ?h ?p)
                    (at-entity ?s ?p)
                    (clear ?s)
                    (lifted-from ?c ?s)
                  )
    :effect (and
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
              (on ?c ?s)
              (at-entity ?c ?p)
              (not (clear ?s))
              (clear ?c)
              (not (lifted-from ?c ?s))
              (increase (fuel-cost) 1))
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (hoist-lifting ?h ?c)
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (<= (+ (current-load ?tr) (weight ?c)) (load-limit ?tr))
                  )
    :effect (and
              (not (hoist-lifting ?h ?c))
              (hoist-available ?h)
              (in-truck ?c ?tr)
              (not (at-entity ?c ?p))
              (not (clear ?c))
              (increase (current-load ?tr) (weight ?c))
              (not (lifted-from ?c ?tr))
              (increase (fuel-cost) 1))
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (in-truck ?c ?tr)
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (hoist-available ?h)
                  )
    :effect (and
              (not (in-truck ?c ?tr))
              (hoist-lifting ?h ?c)
              (not (hoist-available ?h))
              (decrease (current-load ?tr) (weight ?c))
              ;; crate is being lifted at the place but not yet assigned an on target
              (not (at-entity ?c ?p))
              (not (clear ?c))
              (lifted-from ?c ?tr)
              (increase (fuel-cost) 1))
  )
)