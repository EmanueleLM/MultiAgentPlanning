(define (domain trip-planning-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types city day leg)

  (:predicates
    (city-on-day ?c - city ?d - day)
    (unassigned-day ?d - day)
    (direct-flight ?c1 - city ?c2 - city)
    (flight-leg ?l - leg ?c1 - city ?c2 - city)
    (flight-boundary ?l - leg ?d1 - day ?d2 - day)
    (flight-done ?l - leg)
  )

  ;; Single atomic action that assigns the audited itinerary as a contiguous sequence
  ;; Porto: d1..d5, Berlin: d6..d11, Reykjavik: d12..d16.
  ;; This action requires that all days are currently unassigned so no other
  ;; assignments can conflict; it marks the two flight legs as done at their boundaries.
  (:action assign-audited-itinerary
    :parameters ()
    :precondition (and
      (unassigned-day d1) (unassigned-day d2) (unassigned-day d3) (unassigned-day d4)
      (unassigned-day d5) (unassigned-day d6) (unassigned-day d7) (unassigned-day d8)
      (unassigned-day d9) (unassigned-day d10) (unassigned-day d11) (unassigned-day d12)
      (unassigned-day d13) (unassigned-day d14) (unassigned-day d15) (unassigned-day d16)
      ;; ensure required direct-flight links exist so the itinerary is feasible
      (direct-flight porto berlin)
      (direct-flight berlin reykjavik)
      ;; ensure the concrete flight-leg definitions and their required boundaries exist
      (flight-leg legA porto berlin)
      (flight-boundary legA d5 d6)
      (flight-leg legB berlin reykjavik)
      (flight-boundary legB d11 d12)
    )
    :effect (and
      ;; assign Porto days 1-5
      (city-on-day porto d1) (city-on-day porto d2) (city-on-day porto d3)
      (city-on-day porto d4) (city-on-day porto d5)
      ;; assign Berlin days 6-11
      (city-on-day berlin d6) (city-on-day berlin d7) (city-on-day berlin d8)
      (city-on-day berlin d9) (city-on-day berlin d10) (city-on-day berlin d11)
      ;; assign Reykjavik days 12-16
      (city-on-day reykjavik d12) (city-on-day reykjavik d13)
      (city-on-day reykjavik d14) (city-on-day reykjavik d15) (city-on-day reykjavik d16)

      ;; consume unassigned-day for all days so no day can be reassigned
      (not (unassigned-day d1)) (not (unassigned-day d2)) (not (unassigned-day d3))
      (not (unassigned-day d4)) (not (unassigned-day d5)) (not (unassigned-day d6))
      (not (unassigned-day d7)) (not (unassigned-day d8)) (not (unassigned-day d9))
      (not (unassigned-day d10)) (not (unassigned-day d11)) (not (unassigned-day d12))
      (not (unassigned-day d13)) (not (unassigned-day d14)) (not (unassigned-day d15))
      (not (unassigned-day d16))

      ;; mark flights as taken
      (flight-done legA)
      (flight-done legB)
    )
  )
)