(define (domain trip_planning_example19)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)

    (visited ?c - city)
    (stay_done ?d - day)

    (brussels_count_0)
    (brussels_count_1)
    (brussels_count_2)

    (valencia_count_0)
    (valencia_count_1)
    (valencia_count_2)
    (valencia_count_3)

    (nice_count_0)
    (nice_count_1)
    (nice_count_2)
    (nice_count_3)
    (nice_count_4)
    (nice_count_5)
    (nice_count_6)

    (friends_met)
  )

  (:action start_day_1
    :parameters (?c - city)
    :precondition (and
      (today day_1)
      (not (stay_done day_1))
    )
    :effect (and
      (at ?c)
      (visited ?c)
      (stay_done day_1)
    )
  )

  (:action stay_brussels
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at brussels)
      (not (stay_done ?d2))
      (brussels_count_0)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )

  (:action stay_brussels_final
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at brussels)
      (not (stay_done ?d2))
      (brussels_count_1)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (brussels_count_1))
      (brussels_count_2)
    )
  )

  (:action stay_valencia_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at valencia)
      (not (stay_done ?d2))
      (valencia_count_0)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action stay_valencia_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at valencia)
      (not (stay_done ?d2))
      (valencia_count_1)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (valencia_count_1))
      (valencia_count_2)
    )
  )

  (:action stay_valencia_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at valencia)
      (not (stay_done ?d2))
      (valencia_count_2)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (valencia_count_2))
      (valencia_count_3)
    )
  )

  (:action stay_nice_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (not (stay_done ?d2))
      (nice_count_0)
      (or_window_day_1 ?d2)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (nice_count_0))
      (nice_count_1)
      (friends_met)
    )
  )

  (:action stay_nice_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (not (stay_done ?d2))
      (nice_count_1)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (nice_count_1))
      (nice_count_2)
    )
  )

  (:action stay_nice_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (not (stay_done ?d2))
      (nice_count_2)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (nice_count_2))
      (nice_count_3)
    )
  )

  (:action stay_nice_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (not (stay_done ?d2))
      (nice_count_3)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (nice_count_3))
      (nice_count_4)
    )
  )

  (:action stay_nice_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (not (stay_done ?d2))
      (nice_count_4)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (nice_count_4))
      (nice_count_5)
    )
  )

  (:action stay_nice_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at nice)
      (not (stay_done ?d2))
      (nice_count_5)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (nice_count_5))
      (nice_count_6)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (stay_done ?d1)
      (at ?from)
      (not (= ?from ?to))
      (flight ?from ?to)
      (not (stay_done ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (stay_done ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?to)
    )
  )
)