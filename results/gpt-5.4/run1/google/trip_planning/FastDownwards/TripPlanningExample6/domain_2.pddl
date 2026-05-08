(define (domain trip_planning_example6)
  (:requirements :strips :typing)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited ?d - day ?c - city)
    (remaining_berlin_4)
    (remaining_berlin_3)
    (remaining_berlin_2)
    (remaining_berlin_1)
    (remaining_berlin_0)
    (remaining_munich_3)
    (remaining_munich_2)
    (remaining_munich_1)
    (remaining_munich_0)
    (remaining_dubrovnik_3)
    (remaining_dubrovnik_2)
    (remaining_dubrovnik_1)
    (remaining_dubrovnik_0)
  )

  (:action stay_berlin_from_berlin
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at berlin)
      (remaining_berlin_4)
    )
    :effect (and
      (visited ?d berlin)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_berlin_4))
      (remaining_berlin_3)
    )
  )

  (:action stay_berlin_from_berlin_3
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at berlin)
      (remaining_berlin_3)
    )
    :effect (and
      (visited ?d berlin)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_berlin_3))
      (remaining_berlin_2)
    )
  )

  (:action stay_berlin_from_berlin_2
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at berlin)
      (remaining_berlin_2)
    )
    :effect (and
      (visited ?d berlin)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_berlin_2))
      (remaining_berlin_1)
    )
  )

  (:action stay_berlin_from_berlin_1
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at berlin)
      (remaining_berlin_1)
    )
    :effect (and
      (visited ?d berlin)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_berlin_1))
      (remaining_berlin_0)
    )
  )

  (:action fly_to_berlin_4
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from)
      (direct ?from berlin)
      (remaining_berlin_4)
    )
    :effect (and
      (not (at ?from))
      (at berlin)
      (visited ?d berlin)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_berlin_4))
      (remaining_berlin_3)
    )
  )

  (:action fly_to_berlin_3
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from)
      (direct ?from berlin)
      (remaining_berlin_3)
    )
    :effect (and
      (not (at ?from))
      (at berlin)
      (visited ?d berlin)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_berlin_3))
      (remaining_berlin_2)
    )
  )

  (:action fly_to_berlin_2
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from)
      (direct ?from berlin)
      (remaining_berlin_2)
    )
    :effect (and
      (not (at ?from))
      (at berlin)
      (visited ?d berlin)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_berlin_2))
      (remaining_berlin_1)
    )
  )

  (:action fly_to_berlin_1
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from)
      (direct ?from berlin)
      (remaining_berlin_1)
    )
    :effect (and
      (not (at ?from))
      (at berlin)
      (visited ?d berlin)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_berlin_1))
      (remaining_berlin_0)
    )
  )

  (:action stay_munich_3
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at munich)
      (remaining_munich_3)
    )
    :effect (and
      (visited ?d munich)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_munich_3))
      (remaining_munich_2)
    )
  )

  (:action stay_munich_2
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at munich)
      (remaining_munich_2)
    )
    :effect (and
      (visited ?d munich)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_munich_2))
      (remaining_munich_1)
    )
  )

  (:action stay_munich_1
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at munich)
      (remaining_munich_1)
    )
    :effect (and
      (visited ?d munich)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_munich_1))
      (remaining_munich_0)
    )
  )

  (:action fly_to_munich_3
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from)
      (direct ?from munich)
      (remaining_munich_3)
    )
    :effect (and
      (not (at ?from))
      (at munich)
      (visited ?d munich)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_munich_3))
      (remaining_munich_2)
    )
  )

  (:action fly_to_munich_2
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from)
      (direct ?from munich)
      (remaining_munich_2)
    )
    :effect (and
      (not (at ?from))
      (at munich)
      (visited ?d munich)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_munich_2))
      (remaining_munich_1)
    )
  )

  (:action fly_to_munich_1
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from)
      (direct ?from munich)
      (remaining_munich_1)
    )
    :effect (and
      (not (at ?from))
      (at munich)
      (visited ?d munich)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_munich_1))
      (remaining_munich_0)
    )
  )

  (:action stay_dubrovnik_3
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at dubrovnik)
      (remaining_dubrovnik_3)
    )
    :effect (and
      (visited ?d dubrovnik)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_dubrovnik_3))
      (remaining_dubrovnik_2)
    )
  )

  (:action stay_dubrovnik_2
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at dubrovnik)
      (remaining_dubrovnik_2)
    )
    :effect (and
      (visited ?d dubrovnik)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_dubrovnik_2))
      (remaining_dubrovnik_1)
    )
  )

  (:action stay_dubrovnik_1
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at dubrovnik)
      (remaining_dubrovnik_1)
    )
    :effect (and
      (visited ?d dubrovnik)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_dubrovnik_1))
      (remaining_dubrovnik_0)
    )
  )

  (:action fly_to_dubrovnik_3
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from)
      (direct ?from dubrovnik)
      (remaining_dubrovnik_3)
    )
    :effect (and
      (not (at ?from))
      (at dubrovnik)
      (visited ?d dubrovnik)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_dubrovnik_3))
      (remaining_dubrovnik_2)
    )
  )

  (:action fly_to_dubrovnik_2
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from)
      (direct ?from dubrovnik)
      (remaining_dubrovnik_2)
    )
    :effect (and
      (not (at ?from))
      (at dubrovnik)
      (visited ?d dubrovnik)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_dubrovnik_2))
      (remaining_dubrovnik_1)
    )
  )

  (:action fly_to_dubrovnik_1
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from)
      (direct ?from dubrovnik)
      (remaining_dubrovnik_1)
    )
    :effect (and
      (not (at ?from))
      (at dubrovnik)
      (visited ?d dubrovnik)
      (not (current_day ?d))
      (current_day ?nd)
      (not (remaining_dubrovnik_1))
      (remaining_dubrovnik_0)
    )
  )

  (:action finish_day8_berlin_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at berlin)
      (remaining_berlin_1)
    )
    :effect (and
      (visited ?d berlin)
      (not (current_day ?d))
      (not (remaining_berlin_1))
      (remaining_berlin_0)
    )
  )

  (:action finish_day8_munich_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at munich)
      (remaining_munich_1)
    )
    :effect (and
      (visited ?d munich)
      (not (current_day ?d))
      (not (remaining_munich_1))
      (remaining_munich_0)
    )
  )

  (:action finish_day8_dubrovnik_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at dubrovnik)
      (remaining_dubrovnik_1)
    )
    :effect (and
      (visited ?d dubrovnik)
      (not (current_day ?d))
      (not (remaining_dubrovnik_1))
      (remaining_dubrovnik_0)
    )
  )

  (:action finish_day8_fly_to_berlin_1
    :parameters (?from - city ?d - day)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (direct ?from berlin)
      (remaining_berlin_1)
    )
    :effect (and
      (not (at ?from))
      (at berlin)
      (visited ?d berlin)
      (not (current_day ?d))
      (not (remaining_berlin_1))
      (remaining_berlin_0)
    )
  )

  (:action finish_day8_fly_to_munich_1
    :parameters (?from - city ?d - day)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (direct ?from munich)
      (remaining_munich_1)
    )
    :effect (and
      (not (at ?from))
      (at munich)
      (visited ?d munich)
      (not (current_day ?d))
      (not (remaining_munich_1))
      (remaining_munich_0)
    )
  )

  (:action finish_day8_fly_to_dubrovnik_1
    :parameters (?from - city ?d - day)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (direct ?from dubrovnik)
      (remaining_dubrovnik_1)
    )
    :effect (and
      (not (at ?from))
      (at dubrovnik)
      (visited ?d dubrovnik)
      (not (current_day ?d))
      (not (remaining_dubrovnik_1))
      (remaining_dubrovnik_0)
    )
  )
)