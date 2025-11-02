(define (domain multiagent-travel-meet)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :timed-initial-literals :numeric-fluents)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (william-available)
  )
  (:functions
    (total-cost)    ; objective to minimize: travel + waiting - meeting_time
    (met-duration)  ; accumulated meeting time with William (minutes)
    (travelled)     ; accumulated travel minutes (for bookkeeping)
  )

  ; --------------------
  ; Traveler travel actions (explicit, distinct)
  ; --------------------
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

  ; --------------------
  ; Waiting actions (separate for each agent)
  ; Waiting increases total-cost by amount of time waited (to prefer earlier schedules)
  ; --------------------
  (:durative-action wait-traveler
    :parameters (?loc - location)
    :duration (?duration)
    :condition (and (at start (at traveler ?loc))
                    (over all (at traveler ?loc)))
    :effect (and
              ; traveler remains at same location
              (at end (at traveler ?loc))
              (at start (not (at traveler ?loc))) ; ensures exclusivity during wait (planner semantics)
              (at end (at traveler ?loc))
              (at end (increase (total-cost) ?duration))
             )
  )

  (:durative-action wait-william
    :parameters (?loc - location)
    :duration (?duration)
    :condition (and (at start (at william ?loc))
                    (over all (at william ?loc)))
    :effect (and
              (at end (at william ?loc))
              (at start (not (at william ?loc)))
              (at end (at william ?loc))
              (at end (increase (total-cost) ?duration))
             )
  )

  ; --------------------
  ; Meeting action between traveler and William.
  ; Must last at least 75 minutes. William must be present (william-available and at william ?loc) over all.
  ; Meeting reduces total-cost proportional to its duration to prefer longer meetings.
  ; It also increases met-duration (so goal can require >=75).
  ; --------------------
  (:durative-action meet-with-william
    :parameters (?loc - location)
    ; meeting duration is flexible but constrained to at least 75 minutes
    :duration (>= ?duration 75)
    :condition (and
                 (at start (at traveler ?loc))
                 (at start (at william ?loc))
                 (over all (at traveler ?loc))
                 (over all (at william ?loc))
                 (over all (william-available))
                )
    :effect (and
              ; no location change
              (at end (at traveler ?loc))
              (at end (at william ?loc))
              ; accumulate meeting minutes
              (at end (increase (met-duration) ?duration))
              ; reward meeting minutes by decreasing total-cost
              (at end (increase (total-cost) (* -1 ?duration)))
             )
  )
)