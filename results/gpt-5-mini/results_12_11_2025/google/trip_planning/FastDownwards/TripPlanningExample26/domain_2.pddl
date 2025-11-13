(define (domain trip-planning-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types city day leg)

  (:predicates
    (city-on-day ?c - city ?d - day)
    (unassigned-day ?d - day)
    (direct-flight ?c1 - city ?c2 - city)
    (flight-leg ?l - leg ?c1 - city ?c2 - city)
    (flight-boundary ?l - leg ?d1 - day ?d2 - day)
    (flight-used ?l - leg)
  )

  ;; Assign Porto contiguous block d1..d5
  (:action assign-porto-block
    :parameters ()
    :precondition (and
      (unassigned-day d1) (unassigned-day d2) (unassigned-day d3)
      (unassigned-day d4) (unassigned-day d5)
    )
    :effect (and
      (city-on-day porto d1) (city-on-day porto d2) (city-on-day porto d3)
      (city-on-day porto d4) (city-on-day porto d5)
      (not (unassigned-day d1)) (not (unassigned-day d2))
      (not (unassigned-day d3)) (not (unassigned-day d4))
      (not (unassigned-day d5))
    )
  )

  ;; Take flight Porto->Berlin between d5 and d6 (does not consume days)
  (:action take-flight-legA
    :parameters ()
    :precondition (and
      (city-on-day porto d5)
      (unassigned-day d6)
      (direct-flight porto berlin)
      (flight-leg legA porto berlin)
      (flight-boundary legA d5 d6)
      (not (flight-used legA))
    )
    :effect (and
      (flight-used legA)
    )
  )

  ;; Assign Berlin contiguous block d6..d11 (requires flight legA taken)
  (:action assign-berlin-block
    :parameters ()
    :precondition (and
      (flight-used legA)
      (unassigned-day d6) (unassigned-day d7) (unassigned-day d8)
      (unassigned-day d9) (unassigned-day d10) (unassigned-day d11)
    )
    :effect (and
      (city-on-day berlin d6) (city-on-day berlin d7) (city-on-day berlin d8)
      (city-on-day berlin d9) (city-on-day berlin d10) (city-on-day berlin d11)
      (not (unassigned-day d6)) (not (unassigned-day d7)) (not (unassigned-day d8))
      (not (unassigned-day d9)) (not (unassigned-day d10)) (not (unassigned-day d11))
    )
  )

  ;; Take flight Berlin->Reykjavik between d11 and d12 (does not consume days)
  (:action take-flight-legB
    :parameters ()
    :precondition (and
      (city-on-day berlin d11)
      (unassigned-day d12)
      (direct-flight berlin reykjavik)
      (flight-leg legB berlin reykjavik)
      (flight-boundary legB d11 d12)
      (not (flight-used legB))
    )
    :effect (and
      (flight-used legB)
    )
  )

  ;; Assign Reykjavik contiguous block d12..d16 (requires flight legB taken)
  (:action assign-reykjavik-block
    :parameters ()
    :precondition (and
      (flight-used legB)
      (unassigned-day d12) (unassigned-day d13) (unassigned-day d14)
      (unassigned-day d15) (unassigned-day d16)
    )
    :effect (and
      (city-on-day reykjavik d12) (city-on-day reykjavik d13)
      (city-on-day reykjavik d14) (city-on-day reykjavik d15)
      (city-on-day reykjavik d16)
      (not (unassigned-day d12)) (not (unassigned-day d13))
      (not (unassigned-day d14)) (not (unassigned-day d15))
      (not (unassigned-day d16))
    )
  )
)