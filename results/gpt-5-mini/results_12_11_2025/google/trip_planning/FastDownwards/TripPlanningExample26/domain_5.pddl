(define (domain trip-planning-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types city day)

  (:predicates
    (city-on-day ?c - city ?d - day)
    (assigned ?d - day)
    (direct-flight ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
  )

  ;; Assign Porto contiguous block d1..d5
  (:action assign-porto-block
    :parameters ()
    :precondition (and
      (not (assigned d1)) (not (assigned d2)) (not (assigned d3))
      (not (assigned d4)) (not (assigned d5))
    )
    :effect (and
      (city-on-day porto d1) (city-on-day porto d2) (city-on-day porto d3)
      (city-on-day porto d4) (city-on-day porto d5)
      (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
    )
  )

  ;; Assign Berlin contiguous block d6..d11.
  ;; Requires Porto occupying d5 and a direct flight Porto->Berlin (transition between blocks).
  (:action assign-berlin-block
    :parameters ()
    :precondition (and
      (city-on-day porto d5)
      (direct-flight porto berlin)
      (not (assigned d6)) (not (assigned d7)) (not (assigned d8))
      (not (assigned d9)) (not (assigned d10)) (not (assigned d11))
    )
    :effect (and
      (city-on-day berlin d6) (city-on-day berlin d7) (city-on-day berlin d8)
      (city-on-day berlin d9) (city-on-day berlin d10) (city-on-day berlin d11)
      (assigned d6) (assigned d7) (assigned d8)
      (assigned d9) (assigned d10) (assigned d11)
    )
  )

  ;; Assign Reykjavik contiguous block d12..d16.
  ;; Requires Berlin occupying d11 and a direct flight Berlin->Reykjavik (transition between blocks).
  (:action assign-reykjavik-block
    :parameters ()
    :precondition (and
      (city-on-day berlin d11)
      (direct-flight berlin reykjavik)
      (not (assigned d12)) (not (assigned d13)) (not (assigned d14))
      (not (assigned d15)) (not (assigned d16))
    )
    :effect (and
      (city-on-day reykjavik d12) (city-on-day reykjavik d13)
      (city-on-day reykjavik d14) (city-on-day reykjavik d15)
      (city-on-day reykjavik d16)
      (assigned d12) (assigned d13) (assigned d14) (assigned d15) (assigned d16)
    )
  )
)