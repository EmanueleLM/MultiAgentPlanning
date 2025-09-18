(define (domain integrated-meet-mary)
  (:requirements :typing :negative-preconditions :action-costs :adl)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location)
    (current-time ?t - time)
    (next9 ?t1 - time ?t2 - time)
    (next7 ?t1 - time ?t2 - time)
    (next75 ?t1 - time ?t2 - time)
    (wait-to720 ?t1 - time ?t2 - time)
    (meeting-slot ?t1 - time ?t2 - time)
    (mary-available ?t1 - time ?t2 - time)
    (met ?p - person)
  )

  ;; Traveler actions
  (:action traveler_travel_union_to_nob
    :parameters (?from - time ?to - time)
    :precondition (and (at traveler union-square) (current-time ?from) (next9 ?from ?to))
    :effect (and (not (at traveler union-square)) (at traveler nob-hill) (not (current-time ?from)) (current-time ?to))
    :cost 9
  )

  (:action traveler_travel_nob_to_union
    :parameters (?from - time ?to - time)
    :precondition (and (at traveler nob-hill) (current-time ?from) (next7 ?from ?to))
    :effect (and (not (at traveler nob-hill)) (at traveler union-square) (not (current-time ?from)) (current-time ?to))
    :cost 7
  )

  (:action traveler_wait_to_720
    :parameters (?from - time ?to - time)
    :precondition (and (current-time ?from) (wait-to720 ?from ?to) (at traveler union-square))
    :effect (and (not (current-time ?from)) (current-time ?to))
    :cost 180
  )

  (:action traveler_wait_to_720_from_nob
    :parameters (?from - time ?to - time)
    :precondition (and (current-time ?from) (wait-to720 ?from ?to) (at traveler nob-hill))
    :effect (and (not (current-time ?from)) (current-time ?to))
    :cost 171
  )

  (:action traveler_meet_mary
    :parameters (?start - time ?end - time)
    :precondition (and (at traveler nob-hill) (at mary nob-hill) (current-time ?start) (meeting-slot ?start ?end) (mary-available ?start ?end))
    :effect (and (met mary) (not (current-time ?start)) (current-time ?end))
    :cost 75
  )

  ;; Mary actions (kept distinct/prefixed)
  (:action mary_travel_union_to_nob
    :parameters (?from - time ?to - time)
    :precondition (and (at mary union-square) (current-time ?from) (next9 ?from ?to))
    :effect (and (not (at mary union-square)) (at mary nob-hill) (not (current-time ?from)) (current-time ?to))
    :cost 9
  )

  (:action mary_travel_nob_to_union
    :parameters (?from - time ?to - time)
    :precondition (and (at mary nob-hill) (current-time ?from) (next7 ?from ?to))
    :effect (and (not (at mary nob-hill)) (at mary union-square) (not (current-time ?from)) (current-time ?to))
    :cost 7
  )

  (:action mary_wait_to_720
    :parameters (?from - time ?to - time)
    :precondition (and (current-time ?from) (wait-to720 ?from ?to) (at mary nob-hill))
    :effect (and (not (current-time ?from)) (current-time ?to))
    :cost 180
  )
)