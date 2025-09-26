(define (domain sf-meeting)
  ;; Multi-agent temporal domain for Fast Downward
  ;; Agents: you, betty
  ;; Locations: richmond, financial
  ;; Travel durations and a durative meeting action whose duration is bounded.
  (:requirements :strips :typing :durative-actions :fluents :timed-initial-literals :negative-preconditions :numeric-fluents)
  (:types agent location)

  ;; Predicates for agent location
  (:predicates
    (at ?a - agent ?l - location)
  )

  ;; Numeric fluent to accumulate meeting time (minutes)
  (:functions
    (total-meeting-time)
  )

  ;; Travel from Richmond -> Financial (22 minutes)
  ;; This action is defined for any agent, but the duration encodes the known travel time.
  (:durative-action travel-rd-to-fd
    :parameters (?a - agent)
    :duration (= ?duration 22)
    :condition (at start (at ?a richmond))
    :effect (and
      (at end (not (at ?a richmond)))
      (at end (at ?a financial))
    )
  )

  ;; Travel from Financial -> Richmond (21 minutes)
  (:durative-action travel-fd-to-rd
    :parameters (?a - agent)
    :duration (= ?duration 21)
    :condition (at start (at ?a financial))
    :effect (and
      (at end (not (at ?a financial)))
      (at end (at ?a richmond))
    )
  )

  ;; Meeting action between two agents at one location.
  ;; Duration is flexible but constrained:
  ;;  - minimum 60 minutes (user requirement)
  ;;  - maximum 270 minutes (the overlap of Betty's availability 17:15-21:45 = 270 minutes)
  ;; The action requires both agents to be at the meeting location at start and remain there for the entire meeting.
  ;; The action increases the numeric fluent total-meeting-time by the actual duration used.
  (:durative-action meet
    :parameters (?a - agent ?b - agent ?l - location)
    :duration (and (>= ?duration 60) (<= ?duration 270))
    :condition (and
      (at start (at ?a ?l))
      (at start (at ?b ?l))
      (over all (at ?a ?l))
      (over all (at ?b ?l))
    )
    :effect (and
      (increase (total-meeting-time) ?duration)
    )
  )

)