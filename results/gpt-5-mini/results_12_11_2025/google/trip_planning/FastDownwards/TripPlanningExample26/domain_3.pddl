(define (domain trip-planning-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types city day leg)

  (:predicates
    (city-on-day ?c - city ?d - day)
    (unassigned ?d - day)
    (direct-flight ?c1 - city ?c2 - city)
    (flight-leg ?l - leg ?c1 - city ?c2 - city)
    (flight-used ?l - leg)
    (next ?d1 - day ?d2 - day)
  )

  ;; Assign Porto contiguous block d1..d5
  (:action assign-porto-block
    :parameters ()
    :precondition (and
      (unassigned d1) (unassigned d2) (unassigned d3)
      (unassigned d4) (unassigned d5)
    )
    :effect (and
      (city-on-day porto d1) (city-on-day porto d2) (city-on-day porto d3)
      (city-on-day porto d4) (city-on-day porto d5)
      (not (unassigned d1)) (not (unassigned d2))
      (not (unassigned d3)) (not (unassigned d4))
      (not (unassigned d5))
    )
  )

  ;; Take direct flight Porto->Berlin between day 5 and day 6 (no day consumed)
  (:action take-flight-legA
    :parameters ()
    :precondition (and
      (city-on-day porto d5)
      (unassigned d6)
      (direct-flight porto berlin)
      (flight-leg legA porto berlin)
      (not (flight-used legA))
    )
    :effect (and
      (flight-used legA)
    )
  )

  ;; Assign Berlin contiguous block d6..d11 (requires flight legA used)
  (:action assign-berlin-block
    :parameters ()
    :precondition (and
      (flight-used legA)
      (unassigned d6) (unassigned d7) (unassigned d8)
      (unassigned d9) (unassigned d10) (unassigned d11)
    )
    :effect (and
      (city-on-day berlin d6) (city-on-day berlin d7) (city-on-day berlin d8)
      (city-on-day berlin d9) (city-on-day berlin d10) (city-on-day berlin d11)
      (not (unassigned d6)) (not (unassigned d7)) (not (unassigned d8))
      (not (unassigned d9)) (not (unassigned d10)) (not (unassigned d11))
    )
  )

  ;; Take direct flight Berlin->Reykjavik between day 11 and day 12 (no day consumed)
  (:action take-flight-legB
    :parameters ()
    :precondition (and
      (city-on-day berlin d11)
      (unassigned d12)
      (direct-flight berlin reykjavik)
      (flight-leg legB berlin reykjavik)
      (not (flight-used legB))
    )
    :effect (and
      (flight-used legB)
    )
  )

  ;; Assign Reykjavik contiguous block d12..d16 (requires flight legB used)
  (:action assign-reykjavik-block
    :parameters ()
    :precondition (and
      (flight-used legB)
      (unassigned d12) (unassigned d13) (unassigned d14)
      (unassigned d15) (unassigned d16)
    )
    :effect (and
      (city-on-day reykjavik d12) (city-on-day reykjavik d13)
      (city-on-day reykjavik d14) (city-on-day reykjavik d15)
      (city-on-day reykjavik d16)
      (not (unassigned d12)) (not (unassigned d13))
      (not (unassigned d14)) (not (unassigned d15))
      (not (unassigned d16))
    )
  )
)