(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location ?t - time)
    (can_travel ?from - location ?to - location ?td - time ?ta - time)
    (consecutive ?t1 - time ?t2 - time)
    (loc_available ?l - location ?ts - time ?te - time)
    (beth_min_interval ?ts - time ?te - time)
    (meeting_held ?l - location ?ts - time ?te - time)
    (is_traveler ?p - person)
    (is_betty ?p - person)
  )

  ;; Travel from a location at a declared departure time to the declared arrival time.
  (:action travel
    :parameters (?p - person ?from - location ?to - location ?td - time ?ta - time)
    :precondition (and
      (at ?p ?from ?td)
      (can_travel ?from ?to ?td ?ta)
    )
    :effect (and
      (not (at ?p ?from ?td))
      (at ?p ?to ?ta)
    )
  )

  ;; Stay: propagate presence from one time point to its immediate successor.
  (:action stay
    :parameters (?p - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?loc ?t1)
      (consecutive ?t1 ?t2)
    )
    :effect (and
      (at ?p ?loc ?t2)
    )
  )

  ;; Hold a meeting that occupies one consecutive interval (ts -> te).
  ;; Requires the location to be available and the interval to satisfy Betty's minimum meeting constraint.
  ;; Enforces that the meeting is between the traveler and Betty (prevents self-meetings).
  (:action hold_meeting
    :parameters (?loc - location ?p_trav - person ?p_bet - person ?ts - time ?te - time)
    :precondition (and
      (loc_available ?loc ?ts ?te)
      (beth_min_interval ?ts ?te)
      (consecutive ?ts ?te)
      (at ?p_trav ?loc ?ts)
      (at ?p_bet ?loc ?ts)
      (is_traveler ?p_trav)
      (is_betty ?p_bet)
    )
    :effect (and
      (meeting_held ?loc ?ts ?te)
      (at ?p_trav ?loc ?te)
      (at ?p_bet ?loc ?te)
    )
  )
)