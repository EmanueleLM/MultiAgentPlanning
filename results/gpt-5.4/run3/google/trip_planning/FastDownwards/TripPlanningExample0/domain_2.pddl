(define (domain trip_planning_example0)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (recorded ?d - day)

    (need_barcelona_5)
    (need_barcelona_4)
    (need_barcelona_3)
    (need_barcelona_2)
    (need_barcelona_1)
    (done_barcelona)

    (need_florence_6)
    (need_florence_5)
    (need_florence_4)
    (need_florence_3)
    (need_florence_2)
    (need_florence_1)
    (done_florence)

    (need_helsinki_5)
    (need_helsinki_4)
    (need_helsinki_3)
    (need_helsinki_2)
    (need_helsinki_1)
    (done_helsinki)

    (met_friend)
  )

  (:action record_day_barcelona_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at barcelona)
      (not (recorded ?d))
      (need_barcelona_5)
    )
    :effect (and
      (recorded ?d)
      (not (need_barcelona_5))
      (need_barcelona_4)
    )
  )

  (:action record_day_barcelona_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at barcelona)
      (not (recorded ?d))
      (need_barcelona_4)
    )
    :effect (and
      (recorded ?d)
      (not (need_barcelona_4))
      (need_barcelona_3)
    )
  )

  (:action record_day_barcelona_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at barcelona)
      (not (recorded ?d))
      (need_barcelona_3)
    )
    :effect (and
      (recorded ?d)
      (not (need_barcelona_3))
      (need_barcelona_2)
    )
  )

  (:action record_day_barcelona_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at barcelona)
      (not (recorded ?d))
      (need_barcelona_2)
    )
    :effect (and
      (recorded ?d)
      (not (need_barcelona_2))
      (need_barcelona_1)
    )
  )

  (:action record_day_barcelona_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at barcelona)
      (not (recorded ?d))
      (need_barcelona_1)
    )
    :effect (and
      (recorded ?d)
      (not (need_barcelona_1))
      (done_barcelona)
    )
  )

  (:action record_day_florence_6
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at florence)
      (not (recorded ?d))
      (need_florence_6)
    )
    :effect (and
      (recorded ?d)
      (not (need_florence_6))
      (need_florence_5)
    )
  )

  (:action record_day_florence_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at florence)
      (not (recorded ?d))
      (need_florence_5)
    )
    :effect (and
      (recorded ?d)
      (not (need_florence_5))
      (need_florence_4)
    )
  )

  (:action record_day_florence_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at florence)
      (not (recorded ?d))
      (need_florence_4)
    )
    :effect (and
      (recorded ?d)
      (not (need_florence_4))
      (need_florence_3)
    )
  )

  (:action record_day_florence_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at florence)
      (not (recorded ?d))
      (need_florence_3)
    )
    :effect (and
      (recorded ?d)
      (not (need_florence_3))
      (need_florence_2)
    )
  )

  (:action record_day_florence_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at florence)
      (not (recorded ?d))
      (need_florence_2)
    )
    :effect (and
      (recorded ?d)
      (not (need_florence_2))
      (need_florence_1)
    )
  )

  (:action record_day_florence_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at florence)
      (not (recorded ?d))
      (need_florence_1)
    )
    :effect (and
      (recorded ?d)
      (not (need_florence_1))
      (done_florence)
    )
  )

  (:action record_day_helsinki_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at helsinki)
      (not (recorded ?d))
      (need_helsinki_5)
    )
    :effect (and
      (recorded ?d)
      (not (need_helsinki_5))
      (need_helsinki_4)
    )
  )

  (:action record_day_helsinki_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at helsinki)
      (not (recorded ?d))
      (need_helsinki_4)
    )
    :effect (and
      (recorded ?d)
      (not (need_helsinki_4))
      (need_helsinki_3)
    )
  )

  (:action record_day_helsinki_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at helsinki)
      (not (recorded ?d))
      (need_helsinki_3)
    )
    :effect (and
      (recorded ?d)
      (not (need_helsinki_3))
      (need_helsinki_2)
    )
  )

  (:action record_day_helsinki_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at helsinki)
      (not (recorded ?d))
      (need_helsinki_2)
    )
    :effect (and
      (recorded ?d)
      (not (need_helsinki_2))
      (need_helsinki_1)
    )
  )

  (:action record_day_helsinki_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at helsinki)
      (not (recorded ?d))
      (need_helsinki_1)
    )
    :effect (and
      (recorded ?d)
      (not (need_helsinki_1))
      (done_helsinki)
    )
  )

  (:action record_extra_day_barcelona
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at barcelona)
      (not (recorded ?d))
      (done_barcelona)
    )
    :effect (recorded ?d)
  )

  (:action record_extra_day_florence
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at florence)
      (not (recorded ?d))
      (done_florence)
    )
    :effect (recorded ?d)
  )

  (:action record_extra_day_helsinki
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at helsinki)
      (not (recorded ?d))
      (done_helsinki)
    )
    :effect (recorded ?d)
  )

  (:action meet_friend_day_9
    :parameters ()
    :precondition (and
      (current_day day_9)
      (recorded day_9)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action meet_friend_day_10
    :parameters ()
    :precondition (and
      (current_day day_10)
      (recorded day_10)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action meet_friend_day_11
    :parameters ()
    :precondition (and
      (current_day day_11)
      (recorded day_11)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action meet_friend_day_12
    :parameters ()
    :precondition (and
      (current_day day_12)
      (recorded day_12)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action meet_friend_day_13
    :parameters ()
    :precondition (and
      (current_day day_13)
      (recorded day_13)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action meet_friend_day_14
    :parameters ()
    :precondition (and
      (current_day day_14)
      (recorded day_14)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (recorded ?d1)
      (at ?c)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (recorded ?d1)
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
    )
  )
)