(define (domain meeting-scheduling)
  (:requirements :strips :typing :durative-actions :negative-preconditions :timed-initial-literals)
  (:types agent location)
  (:predicates
    (visitor-at ?l - location)
    (kenneth-at ?l - location)
    (met)
  )

  ;; Visitor travels between locations (both directions allowed).
  ;; Travel time is fixed at 11 minutes.
  (:durative-action visitor-travel
    :parameters (?from ?to - location)
    :duration (= ?duration 11)
    :condition (and
                 (at start (visitor-at ?from)))
    :effect (and
              (at start (not (visitor-at ?from)))
              (at end   (visitor-at ?to)))
  )

  ;; Visitor initiates meeting at a location. Requires visitor and Kenneth
  ;; to be at the same location at start and throughout the meeting.
  ;; Meeting must last at least 90 minutes. Produces the public goal (met).
  (:durative-action visitor-meet-kenneth
    :parameters (?l - location)
    :duration (>= ?duration 90)
    :condition (and
                 (at start (visitor-at ?l))
                 (at start (kenneth-at ?l))
                 (over all (visitor-at ?l))
                 (over all (kenneth-at ?l))
                 (at start (not (met))))
    :effect (at end (met))
  )

  ;; Kenneth's counterpart meeting action (distinct agent action).
  ;; Semantically similar preconditions to ensure meeting happens only when
  ;; both present; also produces (met).
  (:durative-action kenneth-meet-visitor
    :parameters (?l - location)
    :duration (>= ?duration 90)
    :condition (and
                 (at start (visitor-at ?l))
                 (at start (kenneth-at ?l))
                 (over all (visitor-at ?l))
                 (over all (kenneth-at ?l))
                 (at start (not (met))))
    :effect (at end (met))
  )

  ;; Kenneth can optionally "wait" while present (keeps actions distinct).
  (:durative-action kenneth-wait
    :parameters (?l - location)
    :duration (>= ?duration 0)
    :condition (at start (kenneth-at ?l))
    :effect (and)
  )
)