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
    (next ?d1 - day ?d2 - day)
    (stay_recorded ?d - day ?c - city)

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

  (:action spend_day_bucharest_3_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at bucharest)
      (need_bucharest_3)
      (not (stay_recorded ?d bucharest))
    )
    :effect (and
      (stay_recorded ?d bucharest)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_bucharest_3))
      (need_bucharest_2)
    )
  )

  (:action spend_day_bucharest_2_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at bucharest)
      (need_bucharest_2)
      (not (stay_recorded ?d bucharest))
    )
    :effect (and
      (stay_recorded ?d bucharest)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_bucharest_2))
      (need_bucharest_1)
    )
  )

  (:action spend_day_bucharest_1_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at bucharest)
      (need_bucharest_1)
      (not (stay_recorded ?d bucharest))
    )
    :effect (and
      (stay_recorded ?d bucharest)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_bucharest_1))
      (need_bucharest_0)
    )
  )

  (:action spend_day_frankfurt_3_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at frankfurt)
      (need_frankfurt_3)
      (not (stay_recorded ?d frankfurt))
    )
    :effect (and
      (stay_recorded ?d frankfurt)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_frankfurt_3))
      (need_frankfurt_2)
    )
  )

  (:action spend_day_frankfurt_2_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at frankfurt)
      (need_frankfurt_2)
      (not (stay_recorded ?d frankfurt))
    )
    :effect (and
      (stay_recorded ?d frankfurt)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_frankfurt_2))
      (need_frankfurt_1)
    )
  )

  (:action spend_day_frankfurt_1_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at frankfurt)
      (need_frankfurt_1)
      (not (stay_recorded ?d frankfurt))
    )
    :effect (and
      (stay_recorded ?d frankfurt)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_frankfurt_1))
      (need_frankfurt_0)
    )
  )

  (:action spend_day_stuttgart_6_5
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at stuttgart)
      (need_stuttgart_6)
      (not (stay_recorded ?d stuttgart))
    )
    :effect (and
      (stay_recorded ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_6))
      (need_stuttgart_5)
    )
  )

  (:action spend_day_stuttgart_5_4
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at stuttgart)
      (need_stuttgart_5)
      (not (stay_recorded ?d stuttgart))
    )
    :effect (and
      (stay_recorded ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_5))
      (need_stuttgart_4)
    )
  )

  (:action spend_day_stuttgart_4_3
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at stuttgart)
      (need_stuttgart_4)
      (not (stay_recorded ?d stuttgart))
    )
    :effect (and
      (stay_recorded ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_4))
      (need_stuttgart_3)
    )
  )

  (:action spend_day_stuttgart_3_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at stuttgart)
      (need_stuttgart_3)
      (not (stay_recorded ?d stuttgart))
    )
    :effect (and
      (stay_recorded ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_3))
      (need_stuttgart_2)
    )
  )

  (:action spend_day_stuttgart_2_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at stuttgart)
      (need_stuttgart_2)
      (not (stay_recorded ?d stuttgart))
    )
    :effect (and
      (stay_recorded ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_2))
      (need_stuttgart_1)
    )
  )

  (:action spend_day_stuttgart_1_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?n)
      (at stuttgart)
      (need_stuttgart_1)
      (not (stay_recorded ?d stuttgart))
    )
    :effect (and
      (stay_recorded ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (need_stuttgart_1))
      (need_stuttgart_0)
    )
  )

  (:action attend_workshop_day_5
    :parameters ()
    :precondition (and
      (stay_recorded day5 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )

  (:action attend_workshop_day_6
    :parameters ()
    :precondition (and
      (stay_recorded day6 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )

  (:action attend_workshop_day_7
    :parameters ()
    :precondition (and
      (stay_recorded day7 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )

  (:action attend_workshop_day_8
    :parameters ()
    :precondition (and
      (stay_recorded day8 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )

  (:action attend_workshop_day_9
    :parameters ()
    :precondition (and
      (stay_recorded day9 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )

  (:action attend_workshop_day_10
    :parameters ()
    :precondition (and
      (stay_recorded day10 stuttgart)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )
)