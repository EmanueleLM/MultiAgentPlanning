(define (domain european_trip_14_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (started)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (meeting_day ?d - day)
    (met_friend)

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

  (:action start_in_barcelona
    :parameters ()
    :precondition (and
      (not (started))
      (barcelona_count_0)
      (florence_count_0)
      (helsinki_count_0)
    )
    :effect (and
      (started)
      (current_day day_1)
      (at barcelona day_1)
      (not (barcelona_count_0))
      (barcelona_count_1)
    )
  )

  (:action start_in_florence
    :parameters ()
    :precondition (and
      (not (started))
      (barcelona_count_0)
      (florence_count_0)
      (helsinki_count_0)
    )
    :effect (and
      (started)
      (current_day day_1)
      (at florence day_1)
      (not (florence_count_0))
      (florence_count_1)
    )
  )

  (:action start_in_helsinki
    :parameters ()
    :precondition (and
      (not (started))
      (barcelona_count_0)
      (florence_count_0)
      (helsinki_count_0)
    )
    :effect (and
      (started)
      (current_day day_1)
      (at helsinki day_1)
      (not (helsinki_count_0))
      (helsinki_count_1)
    )
  )

  (:action stay_barcelona_b1_to_b2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (barcelona_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_1))
      (barcelona_count_2)
    )
  )

  (:action stay_barcelona_b2_to_b3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (barcelona_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_2))
      (barcelona_count_3)
    )
  )

  (:action stay_barcelona_b3_to_b4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (barcelona_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_3))
      (barcelona_count_4)
    )
  )

  (:action stay_barcelona_b4_to_b5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (barcelona_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_4))
      (barcelona_count_5)
    )
  )

  (:action stay_florence_f1_to_f2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence ?d1)
      (florence_count_1)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (not (florence_count_1))
      (florence_count_2)
    )
  )

  (:action stay_florence_f2_to_f3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence ?d1)
      (florence_count_2)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (not (florence_count_2))
      (florence_count_3)
    )
  )

  (:action stay_florence_f3_to_f4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence ?d1)
      (florence_count_3)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (not (florence_count_3))
      (florence_count_4)
    )
  )

  (:action stay_florence_f4_to_f5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence ?d1)
      (florence_count_4)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (not (florence_count_4))
      (florence_count_5)
    )
  )

  (:action stay_florence_f5_to_f6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence ?d1)
      (florence_count_5)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (not (florence_count_5))
      (florence_count_6)
    )
  )

  (:action stay_helsinki_h1_to_h2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at helsinki ?d1)
      (helsinki_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at helsinki ?d2)
      (not (helsinki_count_1))
      (helsinki_count_2)
    )
  )

  (:action stay_helsinki_h2_to_h3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at helsinki ?d1)
      (helsinki_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at helsinki ?d2)
      (not (helsinki_count_2))
      (helsinki_count_3)
    )
  )

  (:action stay_helsinki_h3_to_h4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at helsinki ?d1)
      (helsinki_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at helsinki ?d2)
      (not (helsinki_count_3))
      (helsinki_count_4)
    )
  )

  (:action stay_helsinki_h4_to_h5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at helsinki ?d1)
      (helsinki_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at helsinki ?d2)
      (not (helsinki_count_4))
      (helsinki_count_5)
    )
  )

  (:action fly_barcelona_to_florence_f1_to_f2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_1)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (not (florence_count_1))
      (florence_count_2)
    )
  )

  (:action fly_barcelona_to_florence_f2_to_f3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_2)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (not (florence_count_2))
      (florence_count_3)
    )
  )

  (:action fly_barcelona_to_florence_f3_to_f4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_3)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (not (florence_count_3))
      (florence_count_4)
    )
  )

  (:action fly_barcelona_to_florence_f4_to_f5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_4)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (not (florence_count_4))
      (florence_count_5)
    )
  )

  (:action fly_barcelona_to_florence_f5_to_f6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_5)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (not (florence_count_5))
      (florence_count_6)
    )
  )

  (:action fly_florence_to_barcelona_b1_to_b2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence ?d1)
      (direct_flight florence barcelona)
      (barcelona_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_1))
      (barcelona_count_2)
    )
  )

  (:action fly_florence_to_barcelona_b2_to_b3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence ?d1)
      (direct_flight florence barcelona)
      (barcelona_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_2))
      (barcelona_count_3)
    )
  )

  (:action fly_florence_to_barcelona_b3_to_b4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence ?d1)
      (direct_flight florence barcelona)
      (barcelona_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_3))
      (barcelona_count_4)
    )
  )

  (:action fly_florence_to_barcelona_b4_to_b5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence ?d1)
      (direct_flight florence barcelona)
      (barcelona_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_4))
      (barcelona_count_5)
    )
  )

  (:action fly_barcelona_to_helsinki_h1_to_h2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona helsinki)
      (helsinki_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at helsinki ?d2)
      (not (helsinki_count_1))
      (helsinki_count_2)
    )
  )

  (:action fly_barcelona_to_helsinki_h2_to_h3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona helsinki)
      (helsinki_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at helsinki ?d2)
      (not (helsinki_count_2))
      (helsinki_count_3)
    )
  )

  (:action fly_barcelona_to_helsinki_h3_to_h4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona helsinki)
      (helsinki_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at helsinki ?d2)
      (not (helsinki_count_3))
      (helsinki_count_4)
    )
  )

  (:action fly_barcelona_to_helsinki_h4_to_h5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona helsinki)
      (helsinki_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at helsinki ?d2)
      (not (helsinki_count_4))
      (helsinki_count_5)
    )
  )

  (:action fly_helsinki_to_barcelona_b1_to_b2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at helsinki ?d1)
      (direct_flight helsinki barcelona)
      (barcelona_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_1))
      (barcelona_count_2)
    )
  )

  (:action fly_helsinki_to_barcelona_b2_to_b3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at helsinki ?d1)
      (direct_flight helsinki barcelona)
      (barcelona_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_2))
      (barcelona_count_3)
    )
  )

  (:action fly_helsinki_to_barcelona_b3_to_b4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at helsinki ?d1)
      (direct_flight helsinki barcelona)
      (barcelona_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_3))
      (barcelona_count_4)
    )
  )

  (:action fly_helsinki_to_barcelona_b4_to_b5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at helsinki ?d1)
      (direct_flight helsinki barcelona)
      (barcelona_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at barcelona ?d2)
      (not (barcelona_count_4))
      (barcelona_count_5)
    )
  )

  (:action stay_florence_meeting_f1_to_f2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (at florence ?d1)
      (florence_count_1)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (met_friend)
      (not (florence_count_1))
      (florence_count_2)
    )
  )

  (:action stay_florence_meeting_f2_to_f3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (at florence ?d1)
      (florence_count_2)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (met_friend)
      (not (florence_count_2))
      (florence_count_3)
    )
  )

  (:action stay_florence_meeting_f3_to_f4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (at florence ?d1)
      (florence_count_3)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (met_friend)
      (not (florence_count_3))
      (florence_count_4)
    )
  )

  (:action stay_florence_meeting_f4_to_f5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (at florence ?d1)
      (florence_count_4)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (met_friend)
      (not (florence_count_4))
      (florence_count_5)
    )
  )

  (:action stay_florence_meeting_f5_to_f6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (at florence ?d1)
      (florence_count_5)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (met_friend)
      (not (florence_count_5))
      (florence_count_6)
    )
  )

  (:action fly_barcelona_to_florence_meeting_f1_to_f2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_1)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (met_friend)
      (not (florence_count_1))
      (florence_count_2)
    )
  )

  (:action fly_barcelona_to_florence_meeting_f2_to_f3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_2)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (met_friend)
      (not (florence_count_2))
      (florence_count_3)
    )
  )

  (:action fly_barcelona_to_florence_meeting_f3_to_f4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_3)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (met_friend)
      (not (florence_count_3))
      (florence_count_4)
    )
  )

  (:action fly_barcelona_to_florence_meeting_f4_to_f5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_4)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (met_friend)
      (not (florence_count_4))
      (florence_count_5)
    )
  )

  (:action fly_barcelona_to_florence_meeting_f5_to_f6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_5)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (met_friend)
      (not (florence_count_5))
      (florence_count_6)
    )
  )
)