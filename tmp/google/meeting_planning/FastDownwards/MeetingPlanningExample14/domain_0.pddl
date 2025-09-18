(define (domain integrated-meeting-domain)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :equality)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (will-be-at-marina-window)   ; Mary will be at Marina_District between 20:00 and 22:00
    (met-visitor)                ; Mary's view that the visitor met her
    (met-mary)                   ; Visitor's view that he met Mary
  )
  (:functions
    (time)  ; global time in minutes since midnight
  )

  ;; -------------------------
  ;; Visitor actions (prefixed visitor-)
  ;; -------------------------

  ;; Travel from Nob_Hill to Marina_District: 11 minutes
  (:durative-action visitor-travel-nob-to-mari
    :parameters (?v - agent)
    :duration (= ?duration 11)
    :condition (and
      (at start (at ?v Nob_Hill))
    )
    :effect (and
      (at start (not (at ?v Nob_Hill)))
      (at end (at ?v Marina_District))
      (at end (increase (time) 11))
    )
  )

  ;; Travel from Marina_District to Nob_Hill: 12 minutes
  (:durative-action visitor-travel-mari-to-nob
    :parameters (?v - agent)
    :duration (= ?duration 12)
    :condition (and
      (at start (at ?v Marina_District))
    )
    :effect (and
      (at start (not (at ?v Marina_District)))
      (at end (at ?v Nob_Hill))
      (at end (increase (time) 12))
    )
  )

  ;; Visitor wait: advance global time by chosen non-negative duration ?d
  (:durative-action visitor-wait
    :parameters (?d)
    :duration (= ?duration ?d)
    :condition (and
      (at start (>= ?d 0))
    )
    :effect (and
      (at end (increase (time) ?d))
    )
  )

  ;; -------------------------
  ;; Mary actions (prefixed mary-)
  ;; -------------------------

  ;; Mary wait: advance global time by chosen non-negative duration ?d
  (:durative-action mary-wait
    :parameters (?d)
    :duration (= ?duration ?d)
    :condition (and
      (at start (>= ?d 0))
    )
    :effect (and
      (at end (increase (time) ?d))
    )
  )

  ;; -------------------------
  ;; Joint meeting action (both agents participate)
  ;; Requires both to be at Marina_District and the meeting to fit within Mary's window.
  ;; Duration is fixed 120 minutes (meeting must last at least 120).
  ;; Start time must be >= 1200 and start + duration <= 1320 (i.e. fully inside 20:00-22:00).
  ;; -------------------------
  (:durative-action meet-both
    :parameters (?v - agent ?m - agent)
    :duration (= ?duration 120)
    :condition (and
      (at start (at ?v Marina_District))
      (at start (at ?m Marina_District))
      (at start (will-be-at-marina-window))
      (at start (>= (time) 1200))
      (at start (<= (+ (time) ?duration) 1320))
    )
    :effect (and
      (at end (met-mary))
      (at end (met-visitor))
      (at end (increase (time) 120))
    )
  )
)