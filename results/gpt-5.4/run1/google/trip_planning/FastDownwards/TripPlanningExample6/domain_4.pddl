(define (domain trip_planning_example6)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (last_day ?d - day)
    (conference_day ?d - day)

    (visited_on ?d - day ?c - city)

    (need_berlin)
    (need_munich)
    (need_dubrovnik)

    (need_day2_berlin)
    (need_day3_berlin)
    (need_day5_berlin)
    (need_day6_berlin)

    (need_day2_munich)
    (need_day3_munich)
    (need_day5_munich)

    (need_day6_dubrovnik)
    (need_day7_dubrovnik)
    (need_day8_dubrovnik)
  )

  (:action stay_nonconference
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?nd)
      (at ?c)
    )
    :effect (and
      (visited_on ?d ?c)
      (not (current_day ?d))
      (current_day ?nd)

      (when_berlin_day2 ?d ?c)
      (when_berlin_day3 ?d ?c)
      (when_berlin_day5 ?d ?c)
      (when_berlin_day6 ?d ?c)

      (when_munich_day2 ?d ?c)
      (when_munich_day3 ?d ?c)
      (when_munich_day5 ?d ?c)

      (when_dubrovnik_day6 ?d ?c)
      (when_dubrovnik_day7 ?d ?c)
      (when_dubrovnik_day8 ?d ?c)
    )
  )

  (:action fly_nonconference
    :parameters (?d - day ?nd - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?nd)
      (at ?from)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_on ?d ?to)
      (not (current_day ?d))
      (current_day ?nd)

      (when_berlin_day2 ?d ?to)
      (when_berlin_day3 ?d ?to)
      (when_berlin_day5 ?d ?to)
      (when_berlin_day6 ?d ?to)

      (when_munich_day2 ?d ?to)
      (when_munich_day3 ?d ?to)
      (when_munich_day5 ?d ?to)

      (when_dubrovnik_day6 ?d ?to)
      (when_dubrovnik_day7 ?d ?to)
      (when_dubrovnik_day8 ?d ?to)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?c)
    )
    :effect (and
      (visited_on ?d ?c)
      (not (current_day ?d))

      (when_berlin_day2 ?d ?c)
      (when_berlin_day3 ?d ?c)
      (when_berlin_day5 ?d ?c)
      (when_berlin_day6 ?d ?c)

      (when_munich_day2 ?d ?c)
      (when_munich_day3 ?d ?c)
      (when_munich_day5 ?d ?c)

      (when_dubrovnik_day6 ?d ?c)
      (when_dubrovnik_day7 ?d ?c)
      (when_dubrovnik_day8 ?d ?c)
    )
  )

  (:action fly_last_day
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?from)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_on ?d ?to)
      (not (current_day ?d))

      (when_berlin_day2 ?d ?to)
      (when_berlin_day3 ?d ?to)
      (when_berlin_day5 ?d ?to)
      (when_berlin_day6 ?d ?to)

      (when_munich_day2 ?d ?to)
      (when_munich_day3 ?d ?to)
      (when_munich_day5 ?d ?to)

      (when_dubrovnik_day6 ?d ?to)
      (when_dubrovnik_day7 ?d ?to)
      (when_dubrovnik_day8 ?d ?to)
    )
  )
)