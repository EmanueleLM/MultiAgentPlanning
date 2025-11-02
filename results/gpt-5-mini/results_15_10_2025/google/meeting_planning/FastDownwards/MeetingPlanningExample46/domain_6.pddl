(define (domain meeting-planning-adapted)
  (:requirements :typing :strips :negative-preconditions :adl :equality :action-costs)
  (:types person location time)
  (:constants haight_ashbury north_beach - location)
  (:predicates
    (at ?p - person ?l - location ?t - time)
    (free-interval ?p - person ?ts - time ?te - time)
    (after19 ?ts - time ?te - time)
    (after18 ?ts - time ?te - time)
    (after90 ?ts - time ?te - time)
    (robert-available-interval ?ts - time ?te - time)
    (met-robert)
  )
  (:action traveler-move-haight-to-north
    :parameters (?ts - time ?te - time)
    :precondition (and (at traveler haight_ashbury ?ts) (free-interval traveler ?ts ?te) (after19 ?ts ?te))
    :effect (and (not (at traveler haight_ashbury ?ts)) (at traveler north_beach ?te) (not (free-interval traveler ?ts ?te)))
    :cost 19
  )
  (:action traveler-move-north-to-haight
    :parameters (?ts - time ?te - time)
    :precondition (and (at traveler north_beach ?ts) (free-interval traveler ?ts ?te) (after18 ?ts ?te))
    :effect (and (not (at traveler north_beach ?ts)) (at traveler haight_ashbury ?te) (not (free-interval traveler ?ts ?te)))
    :cost 18
  )
  (:action traveler-meet-robert
    :parameters (?ts - time ?te - time)
    :precondition (and (at traveler north_beach ?ts) (free-interval traveler ?ts ?te) (after90 ?ts ?te) (robert-available-interval ?ts ?te))
    :effect (and (at traveler north_beach ?te) (not (free-interval traveler ?ts ?te)) (met-robert))
    :cost -1
  )
  (:action robert-stationary
    :parameters (?ts - time ?te - time)
    :precondition (robert-available-interval ?ts ?te)
    :effect (at robert north_beach ?ts)
    :cost 0
  )
)