(define (domain meeting-orchestrator)
  (:requirements :typing :strips :negative-preconditions :equality)
  (:types agent location timepoint)

  (:predicates
    (at ?a - agent ?l - location)
    (meeting-done)
    (current-time ?t - timepoint)
    (can-wait ?t - timepoint ?tend - timepoint)
    (can-travel-d2 ?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    (can-travel-d4 ?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    (can-travel-d5 ?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    (meeting-span ?t - timepoint ?tend - timepoint)
    (can-start ?a - agent ?t - timepoint)
  )

  (:action travel-a1-d2
    :parameters (?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at ?a ?from) (current-time ?t) (can-travel-d2 ?a ?from ?to ?t ?tend))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current-time ?t))
      (current-time ?tend)
    )
  )

  (:action travel-a1-d5
    :parameters (?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at ?a ?from) (current-time ?t) (can-travel-d5 ?a ?from ?to ?t ?tend))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current-time ?t))
      (current-time ?tend)
    )
  )

  (:action travel-a2-d4
    :parameters (?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at ?a ?from) (current-time ?t) (can-travel-d4 ?a ?from ?to ?t ?tend))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current-time ?t))
      (current-time ?tend)
    )
  )

  (:action travel-a2-d5
    :parameters (?a - agent ?from - location ?to - location ?t - timepoint ?tend - timepoint)
    :precondition (and (at ?a ?from) (current-time ?t) (can-travel-d5 ?a ?from ?to ?t ?tend))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current-time ?t))
      (current-time ?tend)
    )
  )

  (:action wait-a1
    :parameters (?t - timepoint ?tend - timepoint)
    :precondition (and (current-time ?t) (can-wait ?t ?tend))
    :effect (and
      (not (current-time ?t))
      (current-time ?tend)
    )
  )

  (:action wait-a2
    :parameters (?t - timepoint ?tend - timepoint)
    :precondition (and (current-time ?t) (can-wait ?t ?tend))
    :effect (and
      (not (current-time ?t))
      (current-time ?tend)
    )
  )

  (:action orchestrator_start_meeting
    :parameters (?a1 - agent ?a2 - agent ?loc - location ?t - timepoint ?tend - timepoint)
    :precondition (and
      (at ?a1 ?loc)
      (at ?a2 ?loc)
      (not (meeting-done))
      (current-time ?t)
      (meeting-span ?t ?tend)
      (can-start ?a1 ?t)
      (can-start ?a2 ?t)
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?tend)
      (meeting-done)
    )
  )

)