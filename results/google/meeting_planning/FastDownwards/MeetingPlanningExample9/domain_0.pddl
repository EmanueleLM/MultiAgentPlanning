(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :equality :fluents)
  (:types agent location time count)

  (:predicates
    (time ?t - time)                     ; current time is ?t
    (next ?t1 - time ?t2 - time)         ; immediate successor in the discrete timeline
    (at ?a - agent ?l - location)        ; agent at location
    (mary-available ?t - time)           ; Mary is available at time ?t
    (meeting-active)                     ; a meeting is currently active
    (met-count ?c - count)               ; meeting progress counter (c0..c15, where c15 means 15 or more)
    (nextcount ?c1 - count ?c2 - count) ; successor relation for met-count
    (met-started-at ?t - time)           ; meeting was started at time ?t
  )

  (:functions
    (total-meeting-steps)                ; numeric accumulator for meeting steps (5-minute steps)
  )

  ;; Travel from Union Square to Nob Hill (2 x 5-minute steps = 10 minutes)
  (:action travel-us-to-nh
    :parameters (?t - time ?t1 - time ?t2 - time)
    :precondition (and
      (time ?t)
      (next ?t ?t1)
      (next ?t1 ?t2)
      (at visitor union-square)
      (not (meeting-active))
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
      (not (at visitor union-square))
      (at visitor nob-hill)
    )
  )

  ;; Travel from Nob Hill to Union Square (2 x 5-minute steps = 10 minutes)
  (:action travel-nh-to-us
    :parameters (?t - time ?t1 - time ?t2 - time)
    :precondition (and
      (time ?t)
      (next ?t ?t1)
      (next ?t1 ?t2)
      (at visitor nob-hill)
      (not (meeting-active))
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
      (not (at visitor nob-hill))
      (at visitor union-square)
    )
  )

  ;; Start a meeting at the current time without advancing the timeline.
  ;; Records the start time and sets the met-count to c0.
  (:action start-meeting
    :parameters (?t - time ?loc - location)
    :precondition (and
      (time ?t)
      (at visitor ?loc)
      (at mary ?loc)
      (mary-available ?t)
      (not (meeting-active))
    )
    :effect (and
      (meeting-active)
      (met-started-at ?t)
      (met-count c0)
    )
  )

  ;; Advance the meeting by one 5-minute step.
  ;; Increments the met-count and the numeric total-meeting-steps, and advances time by one step.
  (:action meet-advance
    :parameters (?t - time ?tnext - time ?c - count ?cnext - count ?loc - location)
    :precondition (and
      (time ?t)
      (next ?t ?tnext)
      (meeting-active)
      (met-count ?c)
      (nextcount ?c ?cnext)
      (mary-available ?t)
      (at visitor ?loc)
      (at mary ?loc)
    )
    :effect (and
      (not (time ?t))
      (time ?tnext)
      (not (met-count ?c))
      (met-count ?cnext)
      (increase (total-meeting-steps) 1)
    )
  )

  ;; End the meeting. Only allowed once the met-count has reached c15 (75 minutes).
  (:action end-meeting
    :parameters (?t - time)
    :precondition (and
      (time ?t)
      (meeting-active)
      (met-count c15)
      (mary-available ?t)
    )
    :effect (and
      (not (meeting-active))
      (not (met-count c15))
    )
  )
  
  ;; Objective: maximize total meeting steps (each step = 5 minutes)
  (:metric maximize (total-meeting-steps))
)