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
    (istanbul_count_1)
    (istanbul_count_2)
    (istanbul_count_3)
    (istanbul_count_4)
    (istanbul_count_5)
    (budapest_count_1)
    (budapest_count_2)
    (budapest_count_3)
    (budapest_count_4)
    (budapest_count_5)
    (budapest_count_6)
    (dubrovnik_count_1)
    (dubrovnik_count_2)
    (dubrovnik_count_3)
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
      (istanbul_count_1)
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
      (budapest_count_1)
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
      (dubrovnik_count_1)
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

  (:action count_istanbul_2
    :parameters (?d - day)
    :precondition (and (occupied ?d istanbul) (istanbul_count_1) (not (istanbul_count_2)))
    :effect (istanbul_count_2)
  )

  (:action count_istanbul_3
    :parameters (?d - day)
    :precondition (and (occupied ?d istanbul) (istanbul_count_2) (not (istanbul_count_3)))
    :effect (istanbul_count_3)
  )

  (:action count_istanbul_4
    :parameters (?d - day)
    :precondition (and (occupied ?d istanbul) (istanbul_count_3) (not (istanbul_count_4)))
    :effect (istanbul_count_4)
  )

  (:action count_istanbul_5
    :parameters (?d - day)
    :precondition (and (occupied ?d istanbul) (istanbul_count_4) (not (istanbul_count_5)))
    :effect (istanbul_count_5)
  )

  (:action count_budapest_2
    :parameters (?d - day)
    :precondition (and (occupied ?d budapest) (budapest_count_1) (not (budapest_count_2)))
    :effect (budapest_count_2)
  )

  (:action count_budapest_3
    :parameters (?d - day)
    :precondition (and (occupied ?d budapest) (budapest_count_2) (not (budapest_count_3)))
    :effect (budapest_count_3)
  )

  (:action count_budapest_4
    :parameters (?d - day)
    :precondition (and (occupied ?d budapest) (budapest_count_3) (not (budapest_count_4)))
    :effect (budapest_count_4)
  )

  (:action count_budapest_5
    :parameters (?d - day)
    :precondition (and (occupied ?d budapest) (budapest_count_4) (not (budapest_count_5)))
    :effect (budapest_count_5)
  )

  (:action count_budapest_6
    :parameters (?d - day)
    :precondition (and (occupied ?d budapest) (budapest_count_5) (not (budapest_count_6)))
    :effect (budapest_count_6)
  )

  (:action count_dubrovnik_2
    :parameters (?d - day)
    :precondition (and (occupied ?d dubrovnik) (dubrovnik_count_1) (not (dubrovnik_count_2)))
    :effect (dubrovnik_count_2)
  )

  (:action count_dubrovnik_3
    :parameters (?d - day)
    :precondition (and (occupied ?d dubrovnik) (dubrovnik_count_2) (not (dubrovnik_count_3)))
    :effect (dubrovnik_count_3)
  )
)