(define (domain multi-agent-meet)
  (:requirements :typing :durative-actions :numeric-fluent)
  (:types location)

  ;; Predicates
  (:predicates
     (at_visitor ?l - location)   ;; Visitor's current location
     (kenneth_at ?l - location)    ;; Kenneth's current location
     (met_kenneth)                 ;; Global goal: met Kenneth
  )

  ;; Time
  (:functions (current_time))       ;; minutes from midnight

  ;; Visitor travel action (distinct agent)
  (:durative-action drive_visitor
     :parameters (?from - location ?to - location)
     :duration (= ?dur 11)
     :condition (and
        (at start (at_visitor ?from))
     )
     :effect (and
        (at start (not (at_visitor ?from)))
        (at end (at_visitor ?to))
        (at end (increase (current_time) ?dur))
     )
  )

  ;; Kenneth travel action (distinct agent)
  (:durative-action drive_kenneth
     :parameters (?from - location ?to - location)
     :duration (= ?dur 11)
     :condition (and
        (at start (kenneth_at ?from))
     )
     :effect (and
        (at start (not (kenneth_at ?from)))
        (at end (kenneth_at ?to))
        (at end (increase (current_time) ?dur))
     )
  )

  ;; Generic waiting action (to advance time)
  (:durative-action wait
     :parameters (?mins - number)
     :duration (= ?dur ?mins)
     :condition (and)
     :effect (increase (current_time) ?dur)
  )

  ;; Meeting action: visitor and Kenneth meet at a location for 90 minutes
  ;; Preconditions require both to be at the same location during Kenneth's window
  (:durative-action meet_kenneth
     :parameters (?l - location)
     :duration (= ?dur 90)
     :condition (and
        (at start (at_visitor ?l))
        (at start (kenneth_at ?l))
        (over all (at_visitor ?l))
        (over all (kenneth_at ?l))
        (at start (>= (current_time) 855))  ;; 2:15 PM
        (at start (<= (current_time) 1185)) ;; 7:45 PM
     )
     :effect (and
        (at end (met_kenneth))
        (at end (increase (current_time) 90))
     )
  )
)