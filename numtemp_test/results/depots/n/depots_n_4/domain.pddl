(define (domain orchestrator-crate-transport)
  (:requirements :strips :typing :negative-preconditions :equality :fluents :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types place truck hoist surface
          crate pallet - surface
  )

  (:predicates
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at ?x - surface ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?x - surface)
    (in-truck ?c - crate ?t - truck)
    (holding ?h - hoist ?c - crate)
    (available ?h - hoist)
  )

  (:functions
    (current-load ?t - truck)
    (load-limit ?t - truck)
    (weight ?c - crate)
    (fuel-cost)
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at-truck ?tr ?from))
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
              (increase (fuel-cost) 10)
            )
  )

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (available ?h)
                    (at ?c ?p)
                    (at ?s ?p)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (clear ?c))
              (holding ?h ?c)
              (not (available ?h))
              (clear ?s)
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist-put-down
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (holding ?h ?c)
                    (clear ?s)
                    (at ?s ?p)
                    (not (available ?h))
                  )
    :effect (and
              (on ?c ?s)
              (not (holding ?h ?c))
              (available ?h)
              (not (clear ?s))
              (clear ?c)
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?t ?p)
                    (holding ?h ?c)
                    (not (available ?h))
                    (<= (+ (current-load ?t) (weight ?c)) (load-limit ?t))
                  )
    :effect (and
              (in-truck ?c ?t)
              (not (holding ?h ?c))
              (available ?h)
              (increase (current-load ?t) (weight ?c))
              (increase (fuel-cost) 1)
            )
  )

  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?t ?p)
                    (in-truck ?c ?t)
                    (available ?h)
                  )
    :effect (and
              (not (in-truck ?c ?t))
              (holding ?h ?c)
              (not (available ?h))
              (decrease (current-load ?t) (weight ?c))
              (increase (fuel-cost) 1)
            )
  )
)