(define (domain jackofalltrades_trip_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (succ ?d1 - day ?d2 - day)
    (direct_flight ?c1 - city ?c2 - city)
    (at ?c - city ?d - day)
    (assigned ?d - day)
  )

  ;; Assign day1 and day2 to the same city (no flight needed)
  (:action assign_day1_same
    :parameters (?c - city)
    :precondition (and
      (not (assigned day1))
      (not (assigned day2))
    )
    :effect (and
      (at ?c day1)
      (at ?c day2)
      (assigned day1)
      (assigned day2)
    )
  )

  ;; Assign day1 and day2 to different cities; requires direct flight from day1 city to day2 city
  (:action assign_day1_fly
    :parameters (?c1 - city ?c2 - city)
    :precondition (and
      (not (assigned day1))
      (not (assigned day2))
      (direct_flight ?c1 ?c2)
    )
    :effect (and
      (at ?c1 day1)
      (at ?c2 day2)
      (assigned day1)
      (assigned day2)
    )
  )

  ;; Given city for day2, stay same city for day3 (no flight)
  (:action assign_day2_same
    :parameters (?c - city)
    :precondition (and
      (at ?c day2)
      (not (assigned day3))
    )
    :effect (and
      (at ?c day3)
      (assigned day3)
    )
  )

  ;; Given city for day2, move to a different city for day3 using a direct flight
  (:action assign_day2_fly
    :parameters (?c1 - city ?c2 - city)
    :precondition (and
      (at ?c1 day2)
      (not (assigned day3))
      (direct_flight ?c1 ?c2)
    )
    :effect (and
      (at ?c2 day3)
      (assigned day3)
    )
  )

  ;; Given city for day3, stay same city for day4 (no flight)
  (:action assign_day3_same
    :parameters (?c - city)
    :precondition (and
      (at ?c day3)
      (not (assigned day4))
    )
    :effect (and
      (at ?c day4)
      (assigned day4)
    )
  )

  ;; Given city for day3, move to a different city for day4 using a direct flight
  (:action assign_day3_fly
    :parameters (?c1 - city ?c2 - city)
    :precondition (and
      (at ?c1 day3)
      (not (assigned day4))
      (direct_flight ?c1 ?c2)
    )
    :effect (and
      (at ?c2 day4)
      (assigned day4)
    )
  )
)