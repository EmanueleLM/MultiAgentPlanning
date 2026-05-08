(define (domain trip_planning_example20)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (present_on ?c - city ?d - day)
    (used_day ?d - day)
    (goal_reached)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (used_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (used_day ?d2)
      (present_on ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (used_day ?d2))
      (not (= ?from ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (used_day ?d2)
      (present_on ?to ?d2)
    )
  )

  (:action verify_goal
    :parameters ()
    :precondition (and
      (current_day d12)
      (present_on istanbul d4)
      (present_on istanbul d5)
      (present_on istanbul d6)
      (present_on istanbul d7)
      (present_on istanbul d8)
      (present_on budapest d2)
      (present_on budapest d3)
      (present_on budapest d9)
      (present_on budapest d10)
      (present_on budapest d11)
      (present_on budapest d12)
      (present_on dubrovnik d1)
      (present_on dubrovnik d2)
      (present_on dubrovnik d3)
    )
    :effect (goal_reached)
  )
)