(define (domain multiagent-travel)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents :timed-initial-literals)
  (:types person place)

  (:predicates
    (at ?p - person ?l - place)
    (friend-in-meeting ?f - person)
    (stephanie-in-meeting)
    (available ?p - person)
    (met ?p - person)
  )

  (:functions
    (total-met) ; number of friends met (to maximize)
  )

  ;; Traveler travel actions (distinct agent action)
  (:durative-action travel-fw-to-nobhill
    :parameters ()
    :duration (= ?duration 11)
    :condition (and
      (at start (at traveler fishermans-wharf))
    )
    :effect (and
      (at end (at traveler nob-hill))
      (at start (not (at traveler fishermans-wharf)))
    )
  )

  (:durative-action travel-nobhill-to-fw
    :parameters ()
    :duration (= ?duration 11)
    :condition (and
      (at start (at traveler nob-hill))
    )
    :effect (and
      (at end (at traveler fishermans-wharf))
      (at start (not (at traveler nob-hill)))
    )
  )

  ;; Friend agent attends meeting (distinct action for friend)
  (:durative-action friend-attend
    :parameters (?f - person)
    :duration (= ?duration 30)
    :condition (and
      (at start (available ?f))
      (at start (at ?f nob-hill))
      (over all (available ?f))
    )
    :effect (and
      (at start (friend-in-meeting ?f))
      (at end (not (friend-in-meeting ?f)))
    )
  )

  ;; Traveler meets friend (traveler action distinct)
  (:durative-action traveler-meet-friend
    :parameters (?f - person)
    :duration (= ?duration 30)
    :condition (and
      (at start (at traveler nob-hill))
      (over all (friend-in-meeting ?f))
    )
    :effect (and
      (at end (met ?f))
      (at end (increase (total-met) 1))
    )
  )

  ;; Stephanie attends meeting (Stephanie's distinct action)
  (:durative-action stephanie-attend
    :parameters ()
    :duration (= ?duration 120)
    :condition (and
      (at start (available stephanie))
      (at start (at stephanie nob-hill))
      (over all (available stephanie))
    )
    :effect (and
      (at start (stephanie-in-meeting))
      (at end (not (stephanie-in-meeting)))
    )
  )

  ;; Traveler meets Stephanie (traveler's distinct action)
  (:durative-action traveler-meet-stephanie
    :parameters ()
    :duration (= ?duration 120)
    :condition (and
      (at start (at traveler nob-hill))
      (over all (stephanie-in-meeting))
    )
    :effect (and
      (at end (met stephanie))
    )
  )
)