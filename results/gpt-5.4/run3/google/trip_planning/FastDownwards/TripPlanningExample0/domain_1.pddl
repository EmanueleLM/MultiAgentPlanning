(define (domain european_trip_14_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (day_recorded ?d - day)
    (met_friend)
    (start_chosen)
    (florence_count_0)
    (florence_count_1)
    (florence_count_2)
    (florence_count_3)
    (florence_count_4)
    (florence_count_5)
    (florence_count_6)
    (barcelona_count_0)
    (barcelona_count_1)
    (barcelona_count_2)
    (barcelona_count_3)
    (barcelona_count_4)
    (barcelona_count_5)
    (helsinki_count_0)
    (helsinki_count_1)
    (helsinki_count_2)
    (helsinki_count_3)
    (helsinki_count_4)
    (helsinki_count_5)
  )

  (:action choose_start_barcelona
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (start_chosen))
      (not (day_recorded day_1))
      (not (at barcelona))
      (not (at florence))
      (not (at helsinki))
    )
    :effect (and
      (start_chosen)
      (at barcelona)
    )
  )

  (:action choose_start_florence
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (start_chosen))
      (not (day_recorded day_1))
      (not (at barcelona))
      (not (at florence))
      (not (at helsinki))
    )
    :effect (and
      (start_chosen)
      (at florence)
    )
  )

  (:action choose_start_helsinki
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (start_chosen))
      (not (day_recorded day_1))
      (not (at barcelona))
      (not (at florence))
      (not (at helsinki))
    )
    :effect (and
      (start_chosen)
      (at helsinki)
    )
  )

  (:action record_day_barcelona_0_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at barcelona)
      (not (day_recorded ?d))
      (barcelona_count_0)
    )
    :effect (and
      (day_recorded ?d)
      (not (barcelona_count_0))
      (barcelona_count_1)
    )
  )

  (:action record_day_barcelona_1_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at barcelona)
      (not (day_recorded ?d))
      (barcelona_count_1)
    )
    :effect (and
      (day_recorded ?d)
      (not (barcelona_count_1))
      (barcelona_count_2)
    )
  )

  (:action record_day_barcelona_2_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at barcelona)
      (not (day_recorded ?d))
      (barcelona_count_2)
    )
    :effect (and
      (day_recorded ?d)
      (not (barcelona_count_2))
      (barcelona_count_3)
    )
  )

  (:action record_day_barcelona_3_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at barcelona)
      (not (day_recorded ?d))
      (barcelona_count_3)
    )
    :effect (and
      (day_recorded ?d)
      (not (barcelona_count_3))
      (barcelona_count_4)
    )
  )

  (:action record_day_barcelona_4_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at barcelona)
      (not (day_recorded ?d))
      (barcelona_count_4)
    )
    :effect (and
      (day_recorded ?d)
      (not (barcelona_count_4))
      (barcelona_count_5)
    )
  )

  (:action record_day_florence_0_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at florence)
      (not (day_recorded ?d))
      (florence_count_0)
    )
    :effect (and
      (day_recorded ?d)
      (not (florence_count_0))
      (florence_count_1)
    )
  )

  (:action record_day_florence_1_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at florence)
      (not (day_recorded ?d))
      (florence_count_1)
    )
    :effect (and
      (day_recorded ?d)
      (not (florence_count_1))
      (florence_count_2)
    )
  )

  (:action record_day_florence_2_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at florence)
      (not (day_recorded ?d))
      (florence_count_2)
    )
    :effect (and
      (day_recorded ?d)
      (not (florence_count_2))
      (florence_count_3)
    )
  )

  (:action record_day_florence_3_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at florence)
      (not (day_recorded ?d))
      (florence_count_3)
    )
    :effect (and
      (day_recorded ?d)
      (not (florence_count_3))
      (florence_count_4)
    )
  )

  (:action record_day_florence_4_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at florence)
      (not (day_recorded ?d))
      (florence_count_4)
    )
    :effect (and
      (day_recorded ?d)
      (not (florence_count_4))
      (florence_count_5)
    )
  )

  (:action record_day_florence_5_6
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at florence)
      (not (day_recorded ?d))
      (florence_count_5)
    )
    :effect (and
      (day_recorded ?d)
      (not (florence_count_5))
      (florence_count_6)
    )
  )

  (:action record_day_helsinki_0_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at helsinki)
      (not (day_recorded ?d))
      (helsinki_count_0)
    )
    :effect (and
      (day_recorded ?d)
      (not (helsinki_count_0))
      (helsinki_count_1)
    )
  )

  (:action record_day_helsinki_1_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at helsinki)
      (not (day_recorded ?d))
      (helsinki_count_1)
    )
    :effect (and
      (day_recorded ?d)
      (not (helsinki_count_1))
      (helsinki_count_2)
    )
  )

  (:action record_day_helsinki_2_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at helsinki)
      (not (day_recorded ?d))
      (helsinki_count_2)
    )
    :effect (and
      (day_recorded ?d)
      (not (helsinki_count_2))
      (helsinki_count_3)
    )
  )

  (:action record_day_helsinki_3_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at helsinki)
      (not (day_recorded ?d))
      (helsinki_count_3)
    )
    :effect (and
      (day_recorded ?d)
      (not (helsinki_count_3))
      (helsinki_count_4)
    )
  )

  (:action record_day_helsinki_4_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (start_chosen)
      (at helsinki)
      (not (day_recorded ?d))
      (helsinki_count_4)
    )
    :effect (and
      (day_recorded ?d)
      (not (helsinki_count_4))
      (helsinki_count_5)
    )
  )

  (:action meet_friend_day_9
    :parameters ()
    :precondition (and
      (current_day day_9)
      (day_recorded day_9)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action meet_friend_day_10
    :parameters ()
    :precondition (and
      (current_day day_10)
      (day_recorded day_10)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action meet_friend_day_11
    :parameters ()
    :precondition (and
      (current_day day_11)
      (day_recorded day_11)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action meet_friend_day_12
    :parameters ()
    :precondition (and
      (current_day day_12)
      (day_recorded day_12)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action meet_friend_day_13
    :parameters ()
    :precondition (and
      (current_day day_13)
      (day_recorded day_13)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action meet_friend_day_14
    :parameters ()
    :precondition (and
      (current_day day_14)
      (day_recorded day_14)
      (at florence)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (day_recorded ?d1)
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
      (next_day ?d1 ?d2)
      (day_recorded ?d1)
      (at ?from)
      (direct ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
    )
  )
)