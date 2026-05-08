(define (domain meeting_planning_example22)
  ;; Revised classical PDDL domain for this specific instance.
  ;; Key modeling choices:
  ;; - Time is represented by discrete named timepoints (objects of type time).
  ;; - Roles are enforced by predicates is-visitor and is-andrew rather than fragile type hierarchies,
  ;;   so actions cannot be applied with the wrong agent identity.
  ;; - Travel and wait transitions are precomputed as can-travel / can-wait facts (no numeric durations).
  ;; - Meeting intervals that satisfy Andrew's availability and the required minimum duration are
  ;;   encoded as can-meet time pairs; the meet action consumes a start->end pair and advances both agents.
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?p - agent ?l - location)                 ; agent located at location
    (at-time ?p - agent ?t - time)                ; agent's current discrete timepoint
    (can-travel ?from - location ?to - location ?t1 - time ?t2 - time) ; allowed travel start->end
    (can-wait ?t1 - time ?t2 - time)              ; allowed idle advance
    (can-meet ?t1 - time ?t2 - time)              ; allowed meeting start->end (availability & duration)
    (is-visitor ?p - agent)                       ; marks the visitor object
    (is-andrew ?p - agent)                        ; marks the Andrew object
    (met-andrew)                                  ; goal predicate: visitor met Andrew for required interval
  )

  ;; Travel: visitor moves between two locations using a precomputed timepair.
  (:action travel
    :parameters (?p - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
                    (is-visitor ?p)
                    (at ?p ?from)
                    (at-time ?p ?t1)
                    (can-travel ?from ?to ?t1 ?t2)
                  )
    :effect (and
              (not (at ?p ?from)) (at ?p ?to)
              (not (at-time ?p ?t1)) (at-time ?p ?t2)
            )
  )

  ;; Wait: visitor stays in place and advances from one precomputed timepoint to a later one.
  (:action wait
    :parameters (?p - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
                    (is-visitor ?p)
                    (at ?p ?loc)
                    (at-time ?p ?t1)
                    (can-wait ?t1 ?t2)
                  )
    :effect (and
              (not (at-time ?p ?t1)) (at-time ?p ?t2)
            )
  )

  ;; Meet Andrew: visitor and Andrew must be co-located and share the meeting start time.
  ;; The can-meet fact guarantees the chosen start->end respects Andrew's availability and minimum duration.
  (:action meet-andrew
    :parameters (?v - agent ?a - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and
                    (is-visitor ?v)
                    (is-andrew ?a)
                    (at ?v ?loc)
                    (at ?a ?loc)
                    (at-time ?v ?tstart)
                    (at-time ?a ?tstart)
                    (can-meet ?tstart ?tend)
                  )
    :effect (and
              (not (at-time ?v ?tstart)) (at-time ?v ?tend)
              (not (at-time ?a ?tstart)) (at-time ?a ?tend)
              (met-andrew)
            )
  )
)