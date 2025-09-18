(define (domain meeting-orchestrator)
  (:requirements :typing :strips :negative-preconditions :equality)
  (:types agent location timepoint)

  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - timepoint)
    (can-wait ?t - timepoint ?tend - timepoint)
    (can-travel-visitor ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    (can-travel-william ?from - location ?to - location ?t - timepoint ?tend -timepoint)
    (meeting-span ?t - timepoint ?tend - timepoint)
    (can-start ?a - agent ?t - timepoint)
    (meeting-done)
  )

  (:action travel_visitor
    :parameters (?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at ?a ?from) (current-time ?t) (can-travel-visitor ?from ?to ?t ?tend))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current-time ?t))
      (current-time ?tend)
    )
  )

  (:action travel_william
    :parameters (?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at ?a ?from) (current-time ?t) (can-travel-william ?from ?to ?t ?tend))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current-time ?t))
      (current-time ?tend)
    )
  )

  (:action wait_visitor
    :parameters (?a - agent ?l - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at ?a ?l) (current-time ?t) (can-wait ?t ?tend))
    :effect (and
      (not (current-time ?t))
      (current-time ?tend)
    )
  )

  (:action wait_william
    :parameters (?a - agent ?l - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at ?a ?l) (current-time ?t) (can-wait ?t ?tend))
    :effect (and
      (not (current-time ?t))
      (current-time ?tend)
    )
  )

  (:action orchestrator_start_meeting
    :parameters (?v - agent ?w - agent ?loc - location ?t - timepoint ?tend - timepoint)
    :precondition (and
      (at ?v ?loc)
      (at ?w ?loc)
      (not (meeting-done))
      (current-time ?t)
      (meeting-span ?t ?tend)
      (can-start ?v ?t)
      (can-start ?w ?t)
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?tend)
      (meeting-done)
    )
  )
)