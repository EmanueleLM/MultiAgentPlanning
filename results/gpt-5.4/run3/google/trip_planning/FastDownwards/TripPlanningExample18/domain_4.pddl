(define (domain trip_planning_example18)
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
    (visited ?c - city ?d - day)
    (friends_met)
  )

  (:action start_at
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (at amsterdam))
      (not (at vilnius))
      (not (at bucharest))
    )
    :effect (and
      (at ?c)
      (visited ?c day1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (visited amsterdam ?d2))
      (not (visited vilnius ?d2))
      (not (visited bucharest ?d2))
    )
    :effect (and
      (visited ?c ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (visited amsterdam ?d2))
      (not (visited vilnius ?d2))
      (not (visited bucharest ?d2))
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action meet_friends_day6
    :parameters ()
    :precondition (and
      (visited bucharest day6)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day7
    :parameters ()
    :precondition (and
      (visited bucharest day7)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day8
    :parameters ()
    :precondition (and
      (visited bucharest day8)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day9
    :parameters ()
    :precondition (and
      (visited bucharest day9)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day10
    :parameters ()
    :precondition (and
      (visited bucharest day10)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day11
    :parameters ()
    :precondition (and
      (visited bucharest day11)
      (not (friends_met))
    )
    :effect (friends_met)
  )
)