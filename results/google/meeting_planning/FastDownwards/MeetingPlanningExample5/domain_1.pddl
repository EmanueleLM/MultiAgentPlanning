(define (domain multiagent-travel-meet)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :timed-initial-literals)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (william-available)
  )
  (:functions
    (total-cost)
    (met-duration)
    (travelled)
  )

  (:durative-action travel-traveler-nobhill-castro
    :parameters ()
    :duration (= ?duration 17)
    :condition (at start (at traveler nob_hill))
    :effect (and
              (at start (not (at traveler nob_hill)))
              (at end   (at traveler castro))
              (at end   (increase (total-cost) 17))
              (at end   (increase (travelled) 17))
             )
  )

  (:durative-action travel-traveler-castro-nobhill
    :parameters ()
    :duration (= ?duration 16)
    :condition (at start (at traveler castro))
    :effect (and
              (at start (not (at traveler castro)))
              (at end   (at traveler nob_hill))
              (at end   (increase (total-cost) 16))
              (at end   (increase (travelled) 16))
             )
  )

  (:durative-action wait-traveler-1
    :parameters (?loc - location)
    :duration (= ?duration 1)
    :condition (and (at start (at traveler ?loc))
                    (over all (at traveler ?loc)))
    :effect (and
              (at end (at traveler ?loc))
              (at end (increase (total-cost) 1))
             )
  )

  (:durative-action wait-william-1
    :parameters (?loc - location)
    :duration (= ?duration 1)
    :condition (and (at start (at william ?loc))
                    (over all (at william ?loc)))
    :effect (and
              (at end (at william ?loc))
              (at end (increase (total-cost) 1))
             )
  )

  (:durative-action meet-75
    :parameters (?loc - location)
    :duration (= ?duration 75)
    :condition (and
                 (at start (at traveler ?loc))
                 (at start (at william ?loc))
                 (over all (at traveler ?loc))
                 (over all (at william ?loc))
                 (over all (william-available))
                )
    :effect (and
              (at end (at traveler ?loc))
              (at end (at william ?loc))
              (at end (increase (met-duration) 75))
              (at end (increase (total-cost) -75))
             )
  )

  (:durative-action meet-extend-1
    :parameters (?loc - location)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at traveler ?loc))
                 (at start (at william ?loc))
                 (over all (at traveler ?loc))
                 (over all (at william ?loc))
                 (over all (william-available))
                )
    :effect (and
              (at end (at traveler ?loc))
              (at end (at william ?loc))
              (at end (increase (met-duration) 1))
              (at end (increase (total-cost) -1))
             )
  )
)