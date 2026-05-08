(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location timepoint)

  (:predicates
    (at ?p - person ?l - location)
    (time_at ?t - timepoint)
    (has_met ?p - person)
  )

  ;; Travel from Nob Hill to Marina District (11 minutes)
  (:action travel_nob_hill_to_marina
    :parameters (?p - person)
    :precondition (and (at ?p nob_hill) (time_at t0900))
    :effect (and (not (at ?p nob_hill)) (at ?p marina_district) (not (time_at t0900)) (time_at t0911))
  )

  ;; Wait at Marina District from arrival until Mary appears at 8:00 PM (20:00)
  (:action wait_at_marina
    :parameters (?p - person)
    :precondition (and (at ?p marina_district) (time_at t0911))
    :effect (and (not (time_at t0911)) (time_at t2000))
  )

  ;; Meet Mary at Marina District for exactly 120 minutes (8:00 PM to 10:00 PM)
  ;; This covers the "minimum 120 minutes" constraint as Mary is only available for that duration.
  (:action meet_mary_marina
    :parameters (?me - person ?mary - person)
    :precondition (and (at ?me marina_district) (at ?mary marina_district) (time_at t2000))
    :effect (and (has_met ?mary) (not (time_at t2000)) (time_at t2200))
  )

  ;; Travel from Marina District to Nob Hill (12 minutes)
  (:action travel_marina_to_nob_hill
    :parameters (?p - person)
    :precondition (and (at ?p marina_district) (time_at t2200))
    :effect (and (not (at ?p marina_district)) (at ?p nob_hill) (not (time_at t2200)) (time_at t2212))
  )
)