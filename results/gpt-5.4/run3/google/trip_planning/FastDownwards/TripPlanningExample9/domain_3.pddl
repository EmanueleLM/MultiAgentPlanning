(define (domain european_trip_10_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    bucharest frankfurt stuttgart - city
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d - day ?n - day)
    (visited ?d - day ?c - city)
    (need_bucharest_3)
    (need_bucharest_2)
    (need_bucharest_1)
    (need_bucharest_0)
    (need_frankfurt_3)
    (need_frankfurt_2)
    (need_frankfurt_1)
    (need_frankfurt_0)
    (need_stuttgart_6)
    (need_stuttgart_5)
    (need_stuttgart_4)
    (need_stuttgart_3)
    (need_stuttgart_2)
    (need_stuttgart_1)
    (need_stuttgart_0)
    (workshop_attended)
  )

  (:action spend_day_in_bucharest_3_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at bucharest)
      (need_bucharest_3)
      (not (visited ?d bucharest))
    )
    :effect (and
      (visited ?d bucharest)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_bucharest_3))
      (need_bucharest_2)
    )
  )

  (:action spend_day_in_bucharest_2_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at bucharest)
      (need_bucharest_2)
      (not (visited ?d bucharest))
    )
    :effect (and
      (visited ?d bucharest)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_bucharest_2))
      (need_bucharest_1)
    )
  )

  (:action spend_day_in_bucharest_1_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at bucharest)
      (need_bucharest_1)
      (not (visited ?d bucharest))
    )
    :effect (and
      (visited ?d bucharest)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_bucharest_1))
      (need_bucharest_0)
    )
  )

  (:action spend_day_in_frankfurt_3_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at frankfurt)
      (need_frankfurt_3)
      (not (visited ?d frankfurt))
    )
    :effect (and
      (visited ?d frankfurt)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_frankfurt_3))
      (need_frankfurt_2)
    )
  )

  (:action spend_day_in_frankfurt_2_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at frankfurt)
      (need_frankfurt_2)
      (not (visited ?d frankfurt))
    )
    :effect (and
      (visited ?d frankfurt)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_frankfurt_2))
      (need_frankfurt_1)
    )
  )

  (:action spend_day_in_frankfurt_1_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at frankfurt)
      (need_frankfurt_1)
      (not (visited ?d frankfurt))
    )
    :effect (and
      (visited ?d frankfurt)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_frankfurt_1))
      (need_frankfurt_0)
    )
  )

  (:action spend_day_in_stuttgart_6_5
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (need_stuttgart_6)
      (not (visited ?d stuttgart))
    )
    :effect (and
      (visited ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_6))
      (need_stuttgart_5)
    )
  )

  (:action spend_day_in_stuttgart_5_4
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (need_stuttgart_5)
      (not (visited ?d stuttgart))
    )
    :effect (and
      (visited ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_5))
      (need_stuttgart_4)
    )
  )

  (:action spend_day_in_stuttgart_4_3
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (need_stuttgart_4)
      (not (visited ?d stuttgart))
    )
    :effect (and
      (visited ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_4))
      (need_stuttgart_3)
    )
  )

  (:action spend_day_in_stuttgart_3_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (need_stuttgart_3)
      (not (visited ?d stuttgart))
    )
    :effect (and
      (visited ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_3))
      (need_stuttgart_2)
    )
  )

  (:action spend_day_in_stuttgart_2_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (need_stuttgart_2)
      (not (visited ?d stuttgart))
    )
    :effect (and
      (visited ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_2))
      (need_stuttgart_1)
    )
  )

  (:action spend_day_in_stuttgart_1_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (need_stuttgart_1)
      (not (visited ?d stuttgart))
    )
    :effect (and
      (visited ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_1))
      (need_stuttgart_0)
    )
  )

  (:action spend_extra_day_in_bucharest
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at bucharest)
      (need_bucharest_0)
      (not (visited ?d bucharest))
    )
    :effect (and
      (visited ?d bucharest)
      (not (current_day ?d))
      (current_day ?n)
    )
  )

  (:action spend_extra_day_in_frankfurt
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at frankfurt)
      (need_frankfurt_0)
      (not (visited ?d frankfurt))
    )
    :effect (and
      (visited ?d frankfurt)
      (not (current_day ?d))
      (current_day ?n)
    )
  )

  (:action spend_extra_day_in_stuttgart
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (need_stuttgart_0)
      (not (visited ?d stuttgart))
    )
    :effect (and
      (visited ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
    )
  )

  (:action attend_workshop_on_day_5
    :parameters ()
    :precondition (and
      (visited day5 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )

  (:action attend_workshop_on_day_6
    :parameters ()
    :precondition (and
      (visited day6 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )

  (:action attend_workshop_on_day_7
    :parameters ()
    :precondition (and
      (visited day7 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )

  (:action attend_workshop_on_day_8
    :parameters ()
    :precondition (and
      (visited day8 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )

  (:action attend_workshop_on_day_9
    :parameters ()
    :precondition (and
      (visited day9 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )

  (:action attend_workshop_on_day_10
    :parameters ()
    :precondition (and
      (visited day10 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)