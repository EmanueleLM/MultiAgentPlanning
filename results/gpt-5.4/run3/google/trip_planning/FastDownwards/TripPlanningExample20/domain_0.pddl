(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (occupied ?d - day ?c - city)
    (assigned ?d - day)
    (start_open)
    (used_pair ?d1 - day ?d2 - day)

    (istanbul_day1) (istanbul_day2) (istanbul_day3) (istanbul_day4) (istanbul_day5)
    (budapest_day1) (budapest_day2) (budapest_day3) (budapest_day4) (budapest_day5) (budapest_day6)
    (dubrovnik_day1) (dubrovnik_day2) (dubrovnik_day3)
  )

  (:action choose_start_istanbul
    :parameters ()
    :precondition (and
      (start_open)
      (not (assigned d1))
    )
    :effect (and
      (occupied d1 istanbul)
      (assigned d1)
      (not (start_open))
      (istanbul_day1)
    )
  )

  (:action choose_start_budapest
    :parameters ()
    :precondition (and
      (start_open)
      (not (assigned d1))
    )
    :effect (and
      (occupied d1 budapest)
      (assigned d1)
      (not (start_open))
      (budapest_day1)
    )
  )

  (:action choose_start_dubrovnik
    :parameters ()
    :precondition (and
      (start_open)
      (not (assigned d1))
    )
    :effect (and
      (occupied d1 dubrovnik)
      (assigned d1)
      (not (start_open))
      (dubrovnik_day1)
    )
  )

  (:action stay_istanbul
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (occupied ?d1 istanbul)
      (assigned ?d1)
      (not (assigned ?d2))
      (not (used_pair ?d1 ?d2))
    )
    :effect (and
      (occupied ?d2 istanbul)
      (assigned ?d2)
      (used_pair ?d1 ?d2)
    )
  )

  (:action stay_budapest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (occupied ?d1 budapest)
      (assigned ?d1)
      (not (assigned ?d2))
      (not (used_pair ?d1 ?d2))
    )
    :effect (and
      (occupied ?d2 budapest)
      (assigned ?d2)
      (used_pair ?d1 ?d2)
    )
  )

  (:action stay_dubrovnik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (occupied ?d1 dubrovnik)
      (assigned ?d1)
      (not (assigned ?d2))
      (not (used_pair ?d1 ?d2))
    )
    :effect (and
      (occupied ?d2 dubrovnik)
      (assigned ?d2)
      (used_pair ?d1 ?d2)
    )
  )

  (:action fly_istanbul_to_budapest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (occupied ?d1 istanbul)
      (direct_flight istanbul budapest)
      (assigned ?d1)
      (not (assigned ?d2))
      (not (used_pair ?d1 ?d2))
    )
    :effect (and
      (occupied ?d2 budapest)
      (assigned ?d2)
      (used_pair ?d1 ?d2)
    )
  )

  (:action fly_budapest_to_istanbul
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (occupied ?d1 budapest)
      (direct_flight budapest istanbul)
      (assigned ?d1)
      (not (assigned ?d2))
      (not (used_pair ?d1 ?d2))
    )
    :effect (and
      (occupied ?d2 istanbul)
      (assigned ?d2)
      (used_pair ?d1 ?d2)
    )
  )

  (:action fly_dubrovnik_to_istanbul
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (occupied ?d1 dubrovnik)
      (direct_flight dubrovnik istanbul)
      (assigned ?d1)
      (not (assigned ?d2))
      (not (used_pair ?d1 ?d2))
    )
    :effect (and
      (occupied ?d2 istanbul)
      (assigned ?d2)
      (used_pair ?d1 ?d2)
    )
  )

  (:action mark_istanbul_day2
    :parameters (?d - day)
    :precondition (and (occupied ?d istanbul) (not (istanbul_day2)))
    :effect (istanbul_day2)
  )

  (:action mark_istanbul_day3
    :parameters (?d - day)
    :precondition (and (occupied ?d istanbul) (istanbul_day2) (not (istanbul_day3)))
    :effect (istanbul_day3)
  )

  (:action mark_istanbul_day4
    :parameters (?d - day)
    :precondition (and (occupied ?d istanbul) (istanbul_day3) (not (istanbul_day4)))
    :effect (istanbul_day4)
  )

  (:action mark_istanbul_day5
    :parameters (?d - day)
    :precondition (and (occupied ?d istanbul) (istanbul_day4) (not (istanbul_day5)))
    :effect (istanbul_day5)
  )

  (:action mark_budapest_day2
    :parameters (?d - day)
    :precondition (and (occupied ?d budapest) (not (budapest_day2)))
    :effect (budapest_day2)
  )

  (:action mark_budapest_day3
    :parameters (?d - day)
    :precondition (and (occupied ?d budapest) (budapest_day2) (not (budapest_day3)))
    :effect (budapest_day3)
  )

  (:action mark_budapest_day4
    :parameters (?d - day)
    :precondition (and (occupied ?d budapest) (budapest_day3) (not (budapest_day4)))
    :effect (budapest_day4)
  )

  (:action mark_budapest_day5
    :parameters (?d - day)
    :precondition (and (occupied ?d budapest) (budapest_day4) (not (budapest_day5)))
    :effect (budapest_day5)
  )

  (:action mark_budapest_day6
    :parameters (?d - day)
    :precondition (and (occupied ?d budapest) (budapest_day5) (not (budapest_day6)))
    :effect (budapest_day6)
  )

  (:action mark_dubrovnik_day2
    :parameters (?d - day)
    :precondition (and (occupied ?d dubrovnik) (not (dubrovnik_day2)))
    :effect (dubrovnik_day2)
  )

  (:action mark_dubrovnik_day3
    :parameters (?d - day)
    :precondition (and (occupied ?d dubrovnik) (dubrovnik_day2) (not (dubrovnik_day3)))
    :effect (dubrovnik_day3)
  )
)