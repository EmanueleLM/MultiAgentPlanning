(define (domain european_trip_14_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (started)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (occupied ?c - city ?d - day)
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
    :precondition (and
      (not (started))
      (barcelona_count_0)
      (florence_count_0)
      (helsinki_count_0)
    )
    :effect (and
      (started)
      (current_day day_1)
      (occupied barcelona day_1)
      (not (barcelona_count_0))
      (barcelona_count_1)
    )
  )

  (:action start_in_florence
    :precondition (and
      (not (started))
      (barcelona_count_0)
      (florence_count_0)
      (helsinki_count_0)
    )
    :effect (and
      (started)
      (current_day day_1)
      (occupied florence day_1)
      (not (florence_count_0))
      (florence_count_1)
    )
  )

  (:action start_in_helsinki
    :precondition (and
      (not (started))
      (barcelona_count_0)
      (florence_count_0)
      (helsinki_count_0)
    )
    :effect (and
      (started)
      (current_day day_1)
      (occupied helsinki day_1)
      (not (helsinki_count_0))
      (helsinki_count_1)
    )
  )

  (:action stay_barcelona_b0_to_b1
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (barcelona_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_0))
      (barcelona_count_1)
    )
  )

  (:action stay_barcelona_b1_to_b2
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (barcelona_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_1))
      (barcelona_count_2)
    )
  )

  (:action stay_barcelona_b2_to_b3
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (barcelona_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_2))
      (barcelona_count_3)
    )
  )

  (:action stay_barcelona_b3_to_b4
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (barcelona_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_3))
      (barcelona_count_4)
    )
  )

  (:action stay_barcelona_b4_to_b5
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (barcelona_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_4))
      (barcelona_count_5)
    )
  )

  (:action stay_florence_f0_to_f1
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied florence ?d1)
      (florence_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_0))
      (florence_count_1)
    )
  )

  (:action stay_florence_f1_to_f2
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied florence ?d1)
      (florence_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_1))
      (florence_count_2)
    )
  )

  (:action stay_florence_f2_to_f3
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied florence ?d1)
      (florence_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_2))
      (florence_count_3)
    )
  )

  (:action stay_florence_f3_to_f4
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied florence ?d1)
      (florence_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_3))
      (florence_count_4)
    )
  )

  (:action stay_florence_f4_to_f5
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied florence ?d1)
      (florence_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_4))
      (florence_count_5)
    )
  )

  (:action stay_florence_f5_to_f6
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied florence ?d1)
      (florence_count_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_5))
      (florence_count_6)
    )
  )

  (:action stay_helsinki_h0_to_h1
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied helsinki ?d1)
      (helsinki_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied helsinki ?d2)
      (not (helsinki_count_0))
      (helsinki_count_1)
    )
  )

  (:action stay_helsinki_h1_to_h2
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied helsinki ?d1)
      (helsinki_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied helsinki ?d2)
      (not (helsinki_count_1))
      (helsinki_count_2)
    )
  )

  (:action stay_helsinki_h2_to_h3
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied helsinki ?d1)
      (helsinki_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied helsinki ?d2)
      (not (helsinki_count_2))
      (helsinki_count_3)
    )
  )

  (:action stay_helsinki_h3_to_h4
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied helsinki ?d1)
      (helsinki_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied helsinki ?d2)
      (not (helsinki_count_3))
      (helsinki_count_4)
    )
  )

  (:action stay_helsinki_h4_to_h5
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied helsinki ?d1)
      (helsinki_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied helsinki ?d2)
      (not (helsinki_count_4))
      (helsinki_count_5)
    )
  )

  (:action fly_barcelona_to_florence_f0_to_f1
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_0))
      (florence_count_1)
    )
  )

  (:action fly_barcelona_to_florence_f1_to_f2
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_1))
      (florence_count_2)
    )
  )

  (:action fly_barcelona_to_florence_f2_to_f3
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_2))
      (florence_count_3)
    )
  )

  (:action fly_barcelona_to_florence_f3_to_f4
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_3))
      (florence_count_4)
    )
  )

  (:action fly_barcelona_to_florence_f4_to_f5
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_4))
      (florence_count_5)
    )
  )

  (:action fly_barcelona_to_florence_f5_to_f6
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (not (florence_count_5))
      (florence_count_6)
    )
  )

  (:action fly_florence_to_barcelona_b0_to_b1
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied florence ?d1)
      (direct_flight florence barcelona)
      (barcelona_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_0))
      (barcelona_count_1)
    )
  )

  (:action fly_florence_to_barcelona_b1_to_b2
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied florence ?d1)
      (direct_flight florence barcelona)
      (barcelona_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_1))
      (barcelona_count_2)
    )
  )

  (:action fly_florence_to_barcelona_b2_to_b3
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied florence ?d1)
      (direct_flight florence barcelona)
      (barcelona_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_2))
      (barcelona_count_3)
    )
  )

  (:action fly_florence_to_barcelona_b3_to_b4
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied florence ?d1)
      (direct_flight florence barcelona)
      (barcelona_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_3))
      (barcelona_count_4)
    )
  )

  (:action fly_florence_to_barcelona_b4_to_b5
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied florence ?d1)
      (direct_flight florence barcelona)
      (barcelona_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_4))
      (barcelona_count_5)
    )
  )

  (:action fly_barcelona_to_helsinki_h0_to_h1
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona helsinki)
      (helsinki_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied helsinki ?d2)
      (not (helsinki_count_0))
      (helsinki_count_1)
    )
  )

  (:action fly_barcelona_to_helsinki_h1_to_h2
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona helsinki)
      (helsinki_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied helsinki ?d2)
      (not (helsinki_count_1))
      (helsinki_count_2)
    )
  )

  (:action fly_barcelona_to_helsinki_h2_to_h3
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona helsinki)
      (helsinki_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied helsinki ?d2)
      (not (helsinki_count_2))
      (helsinki_count_3)
    )
  )

  (:action fly_barcelona_to_helsinki_h3_to_h4
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona helsinki)
      (helsinki_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied helsinki ?d2)
      (not (helsinki_count_3))
      (helsinki_count_4)
    )
  )

  (:action fly_barcelona_to_helsinki_h4_to_h5
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona helsinki)
      (helsinki_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied helsinki ?d2)
      (not (helsinki_count_4))
      (helsinki_count_5)
    )
  )

  (:action fly_helsinki_to_barcelona_b0_to_b1
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied helsinki ?d1)
      (direct_flight helsinki barcelona)
      (barcelona_count_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_0))
      (barcelona_count_1)
    )
  )

  (:action fly_helsinki_to_barcelona_b1_to_b2
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied helsinki ?d1)
      (direct_flight helsinki barcelona)
      (barcelona_count_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_1))
      (barcelona_count_2)
    )
  )

  (:action fly_helsinki_to_barcelona_b2_to_b3
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied helsinki ?d1)
      (direct_flight helsinki barcelona)
      (barcelona_count_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_2))
      (barcelona_count_3)
    )
  )

  (:action fly_helsinki_to_barcelona_b3_to_b4
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied helsinki ?d1)
      (direct_flight helsinki barcelona)
      (barcelona_count_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_3))
      (barcelona_count_4)
    )
  )

  (:action fly_helsinki_to_barcelona_b4_to_b5
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied helsinki ?d1)
      (direct_flight helsinki barcelona)
      (barcelona_count_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied barcelona ?d2)
      (not (barcelona_count_4))
      (barcelona_count_5)
    )
  )

  (:action stay_florence_meeting_f0_to_f1
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied florence ?d1)
      (florence_count_0)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_0))
      (florence_count_1)
    )
  )

  (:action stay_florence_meeting_f1_to_f2
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied florence ?d1)
      (florence_count_1)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_1))
      (florence_count_2)
    )
  )

  (:action stay_florence_meeting_f2_to_f3
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied florence ?d1)
      (florence_count_2)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_2))
      (florence_count_3)
    )
  )

  (:action stay_florence_meeting_f3_to_f4
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied florence ?d1)
      (florence_count_3)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_3))
      (florence_count_4)
    )
  )

  (:action stay_florence_meeting_f4_to_f5
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied florence ?d1)
      (florence_count_4)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_4))
      (florence_count_5)
    )
  )

  (:action stay_florence_meeting_f5_to_f6
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied florence ?d1)
      (florence_count_5)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_5))
      (florence_count_6)
    )
  )

  (:action fly_barcelona_to_florence_meeting_f0_to_f1
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_0)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_0))
      (florence_count_1)
    )
  )

  (:action fly_barcelona_to_florence_meeting_f1_to_f2
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_1)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_1))
      (florence_count_2)
    )
  )

  (:action fly_barcelona_to_florence_meeting_f2_to_f3
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_2)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_2))
      (florence_count_3)
    )
  )

  (:action fly_barcelona_to_florence_meeting_f3_to_f4
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_3)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_3))
      (florence_count_4)
    )
  )

  (:action fly_barcelona_to_florence_meeting_f4_to_f5
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_4)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_4))
      (florence_count_5)
    )
  )

  (:action fly_barcelona_to_florence_meeting_f5_to_f6
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (meeting_day ?d2)
      (occupied barcelona ?d1)
      (direct_flight barcelona florence)
      (florence_count_5)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied florence ?d2)
      (met_friend)
      (not (florence_count_5))
      (florence_count_6)
    )
  )
)