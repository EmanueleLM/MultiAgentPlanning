(define (domain meeting-scheduling)
  (:requirements :strips :typing :durative-actions :negative-preconditions :timed-initial-literals :duration-inequalities)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)
  )

  ;; Visitor-specific travel (only the visitor can use this action)
  (:durative-action travel-visitor
    :parameters (?from - location ?to - location)
    :duration (= ?duration 16)
    :condition (and
      (at start (at visitor ?from))
    )
    :effect (and
      (at end (not (at visitor ?from)))
      (at end (at visitor ?to))
    )
  )

  ;; James-specific travel (kept distinct even if not required by his private info)
  (:durative-action travel-james
    :parameters (?from - location ?to - location)
    :duration (= ?duration 18)
    :condition (and
      (at start (at james ?from))
    )
    :effect (and
      (at end (not (at james ?from)))
      (at end (at james ?to))
    )
  )

  ;; Meeting action that requires both agents to be at the same location for 15 minutes.
  ;; It is specific to the visitor and James pair to keep agent actions distinct.
  (:durative-action meet-visitor-james
    :parameters (?loc - location)
    :duration (= ?duration 15)
    :condition (and
      (at start (at visitor ?loc))
      (at start (at james ?loc))
      (over all (at visitor ?loc))
      (over all (at james ?loc))
    )
    :effect (at end (met))
  )
)