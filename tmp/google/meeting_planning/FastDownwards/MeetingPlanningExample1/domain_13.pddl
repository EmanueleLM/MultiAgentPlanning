(define (domain integrated_meeting_planner)
  (:requirements :strips :typing)
  (:types location person)
  (:predicates
    (at ?p - person ?l - location)
    (meeting-minimum-time-satisfied)
    (can-meet-betty ?p - person)
    (available_for_meeting ?p - person)
    (travel_time_within_limit ?p - person ?from - location ?to - location)
  )
  (:action travel
    :parameters (?p - person ?from - location ?to - location)
    :precondition (and
      (at ?p ?from)
      (travel_time_within_limit ?p ?from ?to)
    )
    :effect (and
      (at ?p ?to)
      (not (at ?p ?from))
    )
  )
  (:action meet-betty
    :parameters (?p - person)
    :precondition (and
      (at ?p financial_district)
      (at betty financial_district)
      (available_for_meeting betty)
      (can-meet-betty ?p)
    )
    :effect (meeting-minimum-time-satisfied)
  )
)