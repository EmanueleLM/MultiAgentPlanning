(define (domain multi-agent-meeting)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :timed-initial-literals)
  (:types agent location)
  (:predicates
    (at-you ?l - location)
    (at-david ?l - location)
    (free-you)
    (free-david)
    (in-meeting-you)
    (in-meeting-david)
    (meeting-in-progress)
    (met)
  )
  (:functions
    (travel-time ?from - location ?to - location)
  )

  ;; You's travel action (distinct, labelled)
  (:durative-action you-travel
    :parameters (?from - location ?to - location)
    :duration (= ?duration (travel-time ?from ?to))
    :condition (and
                 (at start (at-you ?from))
                 (at start (not (in-meeting-you))))
    :effect (and
              (at start (not (at-you ?from)))
              (at end (at-you ?to))))
  
  ;; David's travel action (distinct, labelled)
  (:durative-action david-travel
    :parameters (?from - location ?to - location)
    :duration (= ?duration (travel-time ?from ?to))
    :condition (and
                 (at start (at-david ?from))
                 (at start (not (in-meeting-david))))
    :effect (and
              (at start (not (at-david ?from)))
              (at end (at-david ?to))))
  
  ;; Joint meeting action: requires both agents at same location and both free
  ;; Meeting duration fixed to 105 minutes (satisfies "at least 105")
  (:durative-action meet-joint
    :parameters (?loc - location)
    :duration (= ?duration 105)
    :condition (and
                 ;; must start co-located and free
                 (at start (at-you ?loc))
                 (at start (at-david ?loc))
                 (at start (free-you))
                 (at start (free-david))
                 (at start (not (in-meeting-you)))
                 (at start (not (in-meeting-david)))
                 ;; must remain co-located and free for whole meeting
                 (over all (at-you ?loc))
                 (over all (at-david ?loc))
                 (over all (free-you))
                 (over all (free-david))
                )
    :effect (and
              ;; enter meeting at start
              (at start (in-meeting-you))
              (at start (in-meeting-david))
              (at start (meeting-in-progress))
              ;; leave meeting at end, mark meeting completed
              (at end (not (in-meeting-you)))
              (at end (not (in-meeting-david)))
              (at end (not (meeting-in-progress)))
              (at end (met))))
)