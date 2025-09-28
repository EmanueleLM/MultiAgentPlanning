(define (domain multi-agent-hoist-truck)
  (:requirements :durative-actions :negative-preconditions :numeric-fluents :equality :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  
  (:predicates
    (at ?o ?p)
    (on ?c ?s)
    (in-truck ?c ?t)
    (clear ?o)
    (available ?h)
    (holding ?h ?c)
    (lifting ?h)
  )

  (:functions
    (distance ?p1 ?p2) - number
    (speed ?tr) - number
    (power ?h) - number
    (weight ?c) - number
    (total-time) - number
  )

  (:durative-action drive
    :parameters (?tr ?from ?to)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
                 (at start (at ?tr ?from))
               )
    :effect (and
              (at start (not (at ?tr ?from)))
              (at end (at ?tr ?to))
              (at end (increase (total-time) (/ (distance ?from ?to) (speed ?tr))))
            )
  )

  (:durative-action hoist-lift
    :parameters (?h ?c ?s ?p)
    :duration (= ?duration 1)
    :condition (and
                 (at start (available ?h))
                 (at start (at ?h ?p))
                 (at start (at ?s ?p))
                 (at start (on ?c ?s))
                 (at start (clear ?c))
                 (over all (at ?h ?p))
               )
    :effect (and
              (at start (not (available ?h)))
              (at start (not (on ?c ?s)))
              (at start (clear ?s))
              (at end (holding ?h ?c))
              (at end (lifting ?h))
              (at end (not (clear ?c)))
              (at end (increase (total-time) 1))
            )
  )

  (:durative-action hoist-putdown
    :parameters (?h ?c ?target ?p)
    :duration (= ?duration 1)
    :condition (and
                 (at start (holding ?h ?c))
                 (at start (at ?h ?p))
                 (at start (at ?target ?p))
                 (at start (clear ?target))
                 (over all (at ?h ?p))
               )
    :effect (and
              (at end (on ?c ?target))
              (at end (not (clear ?target)))
              (at end (clear ?c))
              (at end (not (holding ?h ?c)))
              (at end (not (lifting ?h)))
              (at end (available ?h))
              (at end (increase (total-time) 1))
            )
  )

  (:durative-action hoist-load
    :parameters (?h ?c ?tr ?p)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (holding ?h ?c))
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
                 (over all (at ?h ?p))
                 (over all (at ?tr ?p))
               )
    :effect (and
              (at end (in-truck ?c ?tr))
              (at end (not (holding ?h ?c)))
              (at end (not (lifting ?h)))
              (at end (available ?h))
              (at end (clear ?c))
              (at end (increase (total-time) (/ (weight ?c) (power ?h))))
            )
  )

  (:durative-action hoist-unload
    :parameters (?h ?c ?tr ?target ?p)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                 (at start (available ?h))
                 (at start (at ?h ?p))
                 (at start (at ?tr ?p))
                 (at start (in-truck ?c ?tr))
                 (at start (clear ?target))
                 (at start (at ?target ?p))
                 (over all (at ?h ?p))
                 (over all (at ?tr ?p))
               )
    :effect (and
              (at start (not (available ?h)))
              (at end (on ?c ?target))
              (at end (not (in-truck ?c ?tr)))
              (at end (not (clear ?target)))
              (at end (clear ?c))
              (at end (available ?h))
              (at end (increase (total-time) (/ (weight ?c) (power ?h))))
            )
  )
)