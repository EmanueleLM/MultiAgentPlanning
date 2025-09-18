(define (domain integrated-visit)
  (:requirements :typing :durative-actions :negative-preconditions :timed-initial-literals)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
    (met ?v - person ?j - person)
  )

  ;; ---------------------------
  ;; Visitor actions (kept distinct)
  ;; ---------------------------

  ;; Visitor: travel from Presidio to MarinaDistrict (10 minutes)
  (:durative-action visitor-travel-presidio-to-marina
    :parameters (?v - person ?from - location ?to - location)
    :duration (= ?duration 10)
    :condition (and
      (at start (at ?v Presidio))
      ;; The action is intended to represent the specific leg; guard with actual names
      (at start (equals ?from Presidio))
      (at start (equals ?to MarinaDistrict))
    )
    :effect (and
      (at start (not (at ?v Presidio)))
      (at end (at ?v MarinaDistrict))
    )
  )

  ;; Visitor: travel from MarinaDistrict to Presidio (10 minutes)
  (:durative-action visitor-travel-marina-to-presidio
    :parameters (?v - person ?from - location ?to - location)
    :duration (= ?duration 10)
    :condition (and
      (at start (at ?v MarinaDistrict))
      (at start (equals ?from MarinaDistrict))
      (at start (equals ?to Presidio))
    )
    :effect (and
      (at start (not (at ?v MarinaDistrict)))
      (at end (at ?v Presidio))
    )
  )

  ;; Visitor: wait actions for aligning with Jessica's window (1, 5, 10, 60 minutes)
  (:durative-action visitor-wait-1
    :parameters (?v - person)
    :duration (= ?duration 1)
    :condition ()
    :effect ()
  )
  (:durative-action visitor-wait-5
    :parameters (?v - person)
    :duration (= ?duration 5)
    :condition ()
    :effect ()
  )
  (:durative-action visitor-wait-10
    :parameters (?v - person)
    :duration (= ?duration 10)
    :condition ()
    :effect ()
  )
  (:durative-action visitor-wait-60
    :parameters (?v - person)
    :duration (= ?duration 60)
    :condition ()
    :effect ()
  )

  ;; ---------------------------
  ;; Joint meeting action (kept distinct name)
  ;; ---------------------------
  ;; Meeting requires both visitor and Jessica at the same location for the whole meeting.
  ;; Jessica's availability window is modeled with Timed Initial Literals in the problem file.
  ;; The meeting must last at least 60 minutes; the "over all" requirement plus TILs
  ;; ensures the meeting cannot extend outside Jessica's MarinaDistrict window.
  (:durative-action meet-visitor-jessica
    :parameters (?v - person ?j - person ?loc - location)
    :duration (>= ?duration 60)
    :condition (and
      (at start (at ?v ?loc))
      (at start (at ?j ?loc))
      (over all (at ?v ?loc))
      (over all (at ?j ?loc))
    )
    :effect (and
      (at end (met ?v ?j))
    )
  )
)