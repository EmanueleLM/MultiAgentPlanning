(define (domain meeting-domain)
  (:requirements :typing :durative-actions :timed-initial-literals :negative-preconditions :fluents)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)       ; agent ?a is at location ?l
    (met ?v - agent ?j - agent)         ; visitor met jessica (satisfied when meeting completed)
  )

  ;; Visitor travel action (distinct agent action)
  (:durative-action travel-visitor
    :parameters (?from - location ?to - location)
    :duration (= ?duration 15)
    :condition (and
                 (at start (at visitor ?from))
                 ;; prevent travel to the same location
                 (at start (not (= ?from ?to)))
               )
    :effect (and
              (at end (at visitor ?to))
              (at end (not (at visitor ?from)))
            )
  )

  ;; Jessica travel action (distinct action for Jessica; not expected to be used due to Jessica's fixed availability)
  (:durative-action travel-jessica
    :parameters (?from - location ?to - location)
    :duration (= ?duration 15)
    :condition (and
                 (at start (at jessica ?from))
                 (at start (not (= ?from ?to)))
               )
    :effect (and
              (at end (at jessica ?to))
              (at end (not (at jessica ?from)))
            )
  )

  ;; Meeting action: requires both agents to be at the same location for the entire meeting.
  ;; Minimum duration is 90 minutes (enforced by duration constraint).
  (:durative-action meet
    :parameters (?l - location)
    :duration (>= ?duration 90)
    :condition (and
                 (at start (at visitor ?l))
                 (at start (at jessica ?l))
                 (over all (at visitor ?l))
                 (over all (at jessica ?l))
               )
    :effect (and
              (at end (met visitor jessica))
            )
  )

)