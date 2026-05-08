(define (domain european_trip_13_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (flight ?from - city ?to - city)

    (visited_on ?c - city ?d - day)

    (meeting_window ?d - day)
    (met_friend)

    (need_barcelona_1) (need_barcelona_2) (need_barcelona_3) (need_barcelona_4)
    (need_barcelona_5) (need_barcelona_6) (need_barcelona_7)

    (need_krakow_1) (need_krakow_2) (need_krakow_3) (need_krakow_4)

    (need_rome_1) (need_rome_2) (need_rome_3) (need_rome_4)
  )

  (:action start_barcelona
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (at barcelona))
      (not (at krakow))
      (not (at rome))
    )
    :effect (and
      (at barcelona)
      (visited_on barcelona d1)
      (need_barcelona_1)
    )
  )

  (:action start_krakow
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (at barcelona))
      (not (at krakow))
      (not (at rome))
    )
    :effect (and
      (at krakow)
      (visited_on krakow d1)
      (need_krakow_1)
      (met_friend)
    )
  )

  (:action start_rome
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (at barcelona))
      (not (at krakow))
      (not (at rome))
    )
    :effect (and
      (at rome)
      (visited_on rome d1)
      (need_rome_1)
    )
  )

  (:action stay_barcelona
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona)
      (not (visited_on barcelona ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on barcelona ?d2)
    )
  )

  (:action stay_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow)
      (not (visited_on krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on krakow ?d2)
    )
  )

  (:action stay_krakow_meeting
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow)
      (meeting_window ?d2)
      (not (visited_on krakow ?d2))
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on krakow ?d2)
      (met_friend)
    )
  )

  (:action stay_rome
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at rome)
      (not (visited_on rome ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on rome ?d2)
    )
  )

  (:action fly_barcelona_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona)
      (flight barcelona krakow)
      (not (visited_on krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at barcelona))
      (at krakow)
      (visited_on krakow ?d2)
    )
  )

  (:action fly_barcelona_krakow_meeting
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona)
      (flight barcelona krakow)
      (meeting_window ?d2)
      (not (visited_on krakow ?d2))
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at barcelona))
      (at krakow)
      (visited_on krakow ?d2)
      (met_friend)
    )
  )

  (:action fly_krakow_barcelona
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow)
      (flight krakow barcelona)
      (not (visited_on barcelona ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at krakow))
      (at barcelona)
      (visited_on barcelona ?d2)
    )
  )

  (:action fly_barcelona_rome
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona)
      (flight barcelona rome)
      (not (visited_on rome ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at barcelona))
      (at rome)
      (visited_on rome ?d2)
    )
  )

  (:action fly_rome_barcelona
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at rome)
      (flight rome barcelona)
      (not (visited_on barcelona ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at rome))
      (at barcelona)
      (visited_on barcelona ?d2)
    )
  )

  (:action satisfy_barcelona_day_1
    :parameters ()
    :precondition (and (visited_on barcelona d1) (not (need_barcelona_1)))
    :effect (need_barcelona_1)
  )

  (:action satisfy_barcelona_day_2
    :parameters ()
    :precondition (and (visited_on barcelona d2) (not (need_barcelona_2)))
    :effect (need_barcelona_2)
  )

  (:action satisfy_barcelona_day_3
    :parameters ()
    :precondition (and (visited_on barcelona d3) (not (need_barcelona_3)))
    :effect (need_barcelona_3)
  )

  (:action satisfy_barcelona_day_4
    :parameters ()
    :precondition (and (visited_on barcelona d4) (not (need_barcelona_4)))
    :effect (need_barcelona_4)
  )

  (:action satisfy_barcelona_day_5
    :parameters ()
    :precondition (and (visited_on barcelona d5) (not (need_barcelona_5)))
    :effect (need_barcelona_5)
  )

  (:action satisfy_barcelona_day_6
    :parameters ()
    :precondition (and (visited_on barcelona d6) (not (need_barcelona_6)))
    :effect (need_barcelona_6)
  )

  (:action satisfy_barcelona_day_7
    :parameters ()
    :precondition (and (visited_on barcelona d7) (not (need_barcelona_7)))
    :effect (need_barcelona_7)
  )

  (:action satisfy_barcelona_day_8
    :parameters ()
    :precondition (and (visited_on barcelona d8) (not (need_barcelona_1)))
    :effect (need_barcelona_1)
  )

  (:action satisfy_barcelona_day_9
    :parameters ()
    :precondition (and (visited_on barcelona d9) (not (need_barcelona_2)))
    :effect (need_barcelona_2)
  )

  (:action satisfy_barcelona_day_10
    :parameters ()
    :precondition (and (visited_on barcelona d10) (not (need_barcelona_3)))
    :effect (need_barcelona_3)
  )

  (:action satisfy_barcelona_day_11
    :parameters ()
    :precondition (and (visited_on barcelona d11) (not (need_barcelona_4)))
    :effect (need_barcelona_4)
  )

  (:action satisfy_barcelona_day_12
    :parameters ()
    :precondition (and (visited_on barcelona d12) (not (need_barcelona_5)))
    :effect (need_barcelona_5)
  )

  (:action satisfy_barcelona_day_13
    :parameters ()
    :precondition (and (visited_on barcelona d13) (not (need_barcelona_6)))
    :effect (need_barcelona_6)
  )

  (:action satisfy_krakow_day_1
    :parameters ()
    :precondition (and (visited_on krakow d1) (not (need_krakow_1)))
    :effect (need_krakow_1)
  )

  (:action satisfy_krakow_day_2
    :parameters ()
    :precondition (and (visited_on krakow d2) (not (need_krakow_2)))
    :effect (need_krakow_2)
  )

  (:action satisfy_krakow_day_3
    :parameters ()
    :precondition (and (visited_on krakow d3) (not (need_krakow_3)))
    :effect (need_krakow_3)
  )

  (:action satisfy_krakow_day_4
    :parameters ()
    :precondition (and (visited_on krakow d4) (not (need_krakow_4)))
    :effect (need_krakow_4)
  )

  (:action satisfy_krakow_day_5
    :parameters ()
    :precondition (and (visited_on krakow d5) (not (need_krakow_1)))
    :effect (need_krakow_1)
  )

  (:action satisfy_krakow_day_6
    :parameters ()
    :precondition (and (visited_on krakow d6) (not (need_krakow_2)))
    :effect (need_krakow_2)
  )

  (:action satisfy_krakow_day_7
    :parameters ()
    :precondition (and (visited_on krakow d7) (not (need_krakow_3)))
    :effect (need_krakow_3)
  )

  (:action satisfy_krakow_day_8
    :parameters ()
    :precondition (and (visited_on krakow d8) (not (need_krakow_4)))
    :effect (need_krakow_4)
  )

  (:action satisfy_krakow_day_9
    :parameters ()
    :precondition (and (visited_on krakow d9) (not (need_krakow_1)))
    :effect (need_krakow_1)
  )

  (:action satisfy_krakow_day_10
    :parameters ()
    :precondition (and (visited_on krakow d10) (not (need_krakow_2)))
    :effect (need_krakow_2)
  )

  (:action satisfy_krakow_day_11
    :parameters ()
    :precondition (and (visited_on krakow d11) (not (need_krakow_3)))
    :effect (need_krakow_3)
  )

  (:action satisfy_krakow_day_12
    :parameters ()
    :precondition (and (visited_on krakow d12) (not (need_krakow_4)))
    :effect (need_krakow_4)
  )

  (:action satisfy_krakow_day_13
    :parameters ()
    :precondition (and (visited_on krakow d13) (not (need_krakow_1)))
    :effect (need_krakow_1)
  )

  (:action satisfy_rome_day_1
    :parameters ()
    :precondition (and (visited_on rome d1) (not (need_rome_1)))
    :effect (need_rome_1)
  )

  (:action satisfy_rome_day_2
    :parameters ()
    :precondition (and (visited_on rome d2) (not (need_rome_2)))
    :effect (need_rome_2)
  )

  (:action satisfy_rome_day_3
    :parameters ()
    :precondition (and (visited_on rome d3) (not (need_rome_3)))
    :effect (need_rome_3)
  )

  (:action satisfy_rome_day_4
    :parameters ()
    :precondition (and (visited_on rome d4) (not (need_rome_4)))
    :effect (need_rome_4)
  )

  (:action satisfy_rome_day_5
    :parameters ()
    :precondition (and (visited_on rome d5) (not (need_rome_1)))
    :effect (need_rome_1)
  )

  (:action satisfy_rome_day_6
    :parameters ()
    :precondition (and (visited_on rome d6) (not (need_rome_2)))
    :effect (need_rome_2)
  )

  (:action satisfy_rome_day_7
    :parameters ()
    :precondition (and (visited_on rome d7) (not (need_rome_3)))
    :effect (need_rome_3)
  )

  (:action satisfy_rome_day_8
    :parameters ()
    :precondition (and (visited_on rome d8) (not (need_rome_4)))
    :effect (need_rome_4)
  )

  (:action satisfy_rome_day_9
    :parameters ()
    :precondition (and (visited_on rome d9) (not (need_rome_1)))
    :effect (need_rome_1)
  )

  (:action satisfy_rome_day_10
    :parameters ()
    :precondition (and (visited_on rome d10) (not (need_rome_2)))
    :effect (need_rome_2)
  )

  (:action satisfy_rome_day_11
    :parameters ()
    :precondition (and (visited_on rome d11) (not (need_rome_3)))
    :effect (need_rome_3)
  )

  (:action satisfy_rome_day_12
    :parameters ()
    :precondition (and (visited_on rome d12) (not (need_rome_4)))
    :effect (need_rome_4)
  )

  (:action satisfy_rome_day_13
    :parameters ()
    :precondition (and (visited_on rome d13) (not (need_rome_1)))
    :effect (need_rome_1)
  )
)