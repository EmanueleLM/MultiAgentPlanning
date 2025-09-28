(define (domain trucks-hoists-crates)
  (:requirements :typing :negative-preconditions :equality :numeric-fluents :disjunctive-preconditions :conditional-effects :quantified-preconditions)
  (:types object place)

  (:predicates
    (at ?o - object ?p - place)
    (on ?c - object ?s - object)
    (in ?c - object ?t - object)
    (clear ?s - object)
    (available ?h - object)
    (lifting ?h - object ?c - object)
    (stable ?c - object)
  )

  (:functions
    (current-load ?t - object)
    (load-limit ?t - object)
    (crate-weight ?c - object)
    (fuel-cost)
  )

  (:action drive
    :parameters (?tr - object ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (increase (fuel-cost) 10)
    )
  )

  (:action hoist-lift
    :parameters (?h - object ?c - object ?s - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
      (not (stable ?c))
      (not (on ?s ?c))
    )
    :effect (and
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (clear ?c))
      (not (at ?c ?p))
      (not (stable ?c))
      (increase (fuel-cost) 1)
    )
  )

  (:action hoist-putdown
    :parameters (?h - object ?c - object ?s - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
      (not (on ?s ?c))
    )
    :effect (and
      (on ?c ?s)
      (at ?c ?p)
      (not (lifting ?h ?c))
      (available ?h)
      (clear ?c)
      (not (clear ?s))
      (stable ?c)
      (increase (fuel-cost) 1)
    )
  )

  (:action hoist-load-into-truck
    :parameters (?h - object ?c - object ?tr - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
      (<= (+ (current-load ?tr) (crate-weight ?c)) (load-limit ?tr))
    )
    :effect (and
      (in ?c ?tr)
      (not (lifting ?h ?c))
      (available ?h)
      (increase (current-load ?tr) (crate-weight ?c))
      (increase (fuel-cost) 1)
      (not (at ?c ?p))
      (not (clear ?c))
      (not (stable ?c))
    )
  )

  (:action hoist-unload-from-truck
    :parameters (?h - object ?c - object ?tr - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (in ?c ?tr)
      (available ?h)
    )
    :effect (and
      (not (in ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
      (decrease (current-load ?tr) (crate-weight ?c))
      (increase (fuel-cost) 1)
      ;; crate remains held by hoist (lifting), not automatically placed at location
      (not (clear ?c))
      (not (stable ?c))
    )
  )
)