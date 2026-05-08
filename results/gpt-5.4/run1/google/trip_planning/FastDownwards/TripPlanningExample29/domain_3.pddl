(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next ?d - day ?dn - day)
    (current ?d - day)
    (wedding_window ?d - day)
    (visited_frankfurt)
    (visited_dubrovnik)
    (visited_krakow)
    (in_krakow_on_wedding_day)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition
      (and
        (current day1)
        (not (at frankfurt day1))
        (not (at krakow day1))
        (not (at dubrovnik day1))
      )
    :effect
      (and
        (at ?c day1)
        (when (not (visited_frankfurt)) (visited_frankfurt))
      )
  )

  (:action start_in_frankfurt
    :parameters ()
    :precondition
      (and
        (current day1)
        (not (at frankfurt day1))
        (not (at krakow day1))
        (not (at dubrovnik day1))
      )
    :effect
      (and
        (at frankfurt day1)
        (visited_frankfurt)
      )
  )

  (:action start_in_krakow
    :parameters ()
    :precondition
      (and
        (current day1)
        (not (at frankfurt day1))
        (not (at krakow day1))
        (not (at dubrovnik day1))
      )
    :effect
      (and
        (at krakow day1)
        (visited_krakow)
      )
  )

  (:action start_in_dubrovnik
    :parameters ()
    :precondition
      (and
        (current day1)
        (not (at frankfurt day1))
        (not (at krakow day1))
        (not (at dubrovnik day1))
      )
    :effect
      (and
        (at dubrovnik day1)
        (visited_dubrovnik)
      )
  )

  (:action stay_frankfurt
    :parameters (?d - day ?dn - day)
    :precondition
      (and
        (current ?d)
        (next ?d ?dn)
        (at frankfurt ?d)
      )
    :effect
      (and
        (not (current ?d))
        (current ?dn)
        (not (at frankfurt ?d))
        (at frankfurt ?dn)
        (visited_frankfurt)
      )
  )

  (:action stay_krakow
    :parameters (?d - day ?dn - day)
    :precondition
      (and
        (current ?d)
        (next ?d ?dn)
        (at krakow ?d)
      )
    :effect
      (and
        (not (current ?d))
        (current ?dn)
        (not (at krakow ?d))
        (at krakow ?dn)
        (visited_krakow)
      )
  )

  (:action stay_dubrovnik
    :parameters (?d - day ?dn - day)
    :precondition
      (and
        (current ?d)
        (next ?d ?dn)
        (at dubrovnik ?d)
      )
    :effect
      (and
        (not (current ?d))
        (current ?dn)
        (not (at dubrovnik ?d))
        (at dubrovnik ?dn)
        (visited_dubrovnik)
      )
  )

  (:action fly_frankfurt_krakow
    :parameters (?d - day ?dn - day)
    :precondition
      (and
        (current ?d)
        (next ?d ?dn)
        (at frankfurt ?d)
        (direct frankfurt krakow)
        (not (at krakow ?d))
      )
    :effect
      (and
        (not (current ?d))
        (current ?dn)
        (not (at frankfurt ?d))
        (at krakow ?dn)
        (visited_krakow)
      )
  )

  (:action fly_krakow_frankfurt
    :parameters (?d - day ?dn - day)
    :precondition
      (and
        (current ?d)
        (next ?d ?dn)
        (at krakow ?d)
        (direct krakow frankfurt)
        (not (at frankfurt ?d))
      )
    :effect
      (and
        (not (current ?d))
        (current ?dn)
        (not (at krakow ?d))
        (at frankfurt ?dn)
        (visited_frankfurt)
      )
  )

  (:action fly_dubrovnik_frankfurt
    :parameters (?d - day ?dn - day)
    :precondition
      (and
        (current ?d)
        (next ?d ?dn)
        (at dubrovnik ?d)
        (direct dubrovnik frankfurt)
        (not (at frankfurt ?d))
      )
    :effect
      (and
        (not (current ?d))
        (current ?dn)
        (not (at dubrovnik ?d))
        (at frankfurt ?dn)
        (visited_frankfurt)
      )
  )

  (:action fly_frankfurt_dubrovnik
    :parameters (?d - day ?dn - day)
    :precondition
      (and
        (current ?d)
        (next ?d ?dn)
        (at frankfurt ?d)
        (direct frankfurt dubrovnik)
        (not (at dubrovnik ?d))
      )
    :effect
      (and
        (not (current ?d))
        (current ?dn)
        (not (at frankfurt ?d))
        (at dubrovnik ?dn)
        (visited_dubrovnik)
      )
  )

  (:action mark_wedding_attendance
    :parameters (?d - day)
    :precondition
      (and
        (wedding_window ?d)
        (at krakow ?d)
        (not (in_krakow_on_wedding_day))
      )
    :effect
      (and
        (in_krakow_on_wedding_day)
      )
  )
)