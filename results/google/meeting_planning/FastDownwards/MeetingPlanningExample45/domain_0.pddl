(define (domain meeting-domain)
  (:requirements :typing :durative-actions :fluents :numeric-fluents :negative-preconditions :metric-functions)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met ?a - agent ?b - agent)
  )
  (:functions
    (time)
    (met-count)
    (travel-time ?from - location ?to - location)
  )

  ;; Travel action for (the) traveler: advances time by the predefined travel-time.
  ;; This action is written so it can be instantiated for a specific agent (we will
  ;; instantiate it for the concrete traveler in the problem).
  (:durative-action travel-traveler
    :parameters (?ag - agent ?from - location ?to - location)
    :duration (= ?duration (travel-time ?from ?to))
    :condition (and
      (at start (at ?ag ?from))
    )
    :effect (and
      (at start (not (at ?ag ?from)))
      (at end   (at ?ag ?to))
      (at end   (increase (time) (travel-time ?from ?to)))
    )
  )

  ;; Meeting action specifically between the traveler and Emily.
  ;; Must start no earlier than Emily's window start (600 = 10:00) and must finish
  ;; no later than Emily's window end (660 = 11:00). Duration must be >= 15 minutes.
  ;; Meeting can only occur when both agents are colocated.
  (:durative-action meet-traveler-emily
    :parameters (?trav - agent ?em - agent ?loc - location)
    :duration (>= ?duration 15)
    :condition (and
      (at start (at ?trav ?loc))
      (at start (at ?em ?loc))
      (at start (>= (time) 600))  ; Emily availability window start (10:00 = 600 minutes)
      (at end   (<= (time) 660))  ; Emily availability window end (11:00 = 660 minutes)
    )
    :effect (and
      (at end (met ?trav ?em))
      (at end (increase (met-count) 1))
      (at end (increase (time) ?duration))
    )
  )
)