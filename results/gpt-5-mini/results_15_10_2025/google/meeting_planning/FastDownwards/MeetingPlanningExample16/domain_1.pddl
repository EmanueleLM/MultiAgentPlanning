(define (domain meeting-planning)
  (:requirements :strips :typing :durative-actions :fluents :negative-preconditions :timed-initial-literals)
  (:types location person)
  (:predicates
    (at-traveler ?l - location)
    (met ?p - person)
    (available-ronald)
  )
  (:functions
    (met-count)
  )
  (:durative-action move-chinatown-to-russianhill
    :parameters ()
    :duration (= ?duration 7)
    :condition (at start (at-traveler Chinatown))
    :effect (at end (and (not (at-traveler Chinatown)) (at-traveler Russian_Hill)))
  )
  (:durative-action move-russianhill-to-chinatown
    :parameters ()
    :duration (= ?duration 9)
    :condition (at start (at-traveler Russian_Hill))
    :effect (at end (and (not (at-traveler Russian_Hill)) (at-traveler Chinatown)))
  )
  (:durative-action meet-ronald
    :parameters (?d)
    :duration (>= ?d 105)
    :condition (and
                 (at start (at-traveler Russian_Hill))
                 (at start (not (met ronald)))
                 (over all (available-ronald))
               )
    :effect (at end (and (met ronald) (increase (met-count) 1)))
  )
)