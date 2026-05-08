(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location timepoint)
  (:constants
    nob_hill marina_district - location
    t0900 t0911 t2000 t2200 t2212 - timepoint
  )
  (:predicates
    (at ?p - person ?l - location)
    (time_at ?t - timepoint)
    (has_met ?p1 - person ?p2 - person)
  )

  ;; Travel from Nob Hill to Marina District (11 minutes)
  ;; Starting at 9:00 AM as per arriving at Nob Hill.
  (:action travel_nob_hill_to_marina
    :parameters (?p - person)
    :precondition (and (at ?p nob_hill) (time_at t0900))
    :effect (and (not (at ?p nob_hill)) (at ?p marina_district) (not (time_at t0900)) (time_at t0911))
  )

  ;; Wait at Marina District from arrival until Mary's window begins at 8:00 PM (20:00)
  (:action wait_at_marina
    :parameters (?p - person)
    :precondition (and (at ?p marina_district) (time_at t0911))
    :effect (and (not (time_at t0911)) (time_at t2000))
  )

  ;; Meet a person at Marina District for 120 minutes (8:00 PM to 10:00 PM)
  ;; This satisfies the "minimum 120 minutes" window for Mary's availability.
  (:action meet_person
    :parameters (?me - person ?other - person)
    :precondition (and (at ?me marina_district) (at ?other marina_district) (time_at t2000))
    :effect (and (has_met ?me ?other) (not (time_at t2000)) (time_at t2200))
  )

  ;; Travel from Marina District to Nob Hill (12 minutes)
  ;; Window starts after the meeting ends at 10:00 PM (22:00).
  (:action travel_marina_to_nob_hill
    :parameters (?p - person)
    :precondition (and (at ?p marina_district) (time_at t2200))
    :effect (and (not (at ?p marina_district)) (at ?p nob_hill) (not (time_at t2200)) (time_at t2212))
  )
)