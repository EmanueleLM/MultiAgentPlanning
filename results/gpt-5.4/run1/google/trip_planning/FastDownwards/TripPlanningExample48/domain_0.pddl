(define (domain european_trip_4_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (meeting_day ?d - day)

    (current_day ?d - day)
    (at ?c - city ?d - day)
    (day_assigned ?d - day)

    (used_manchester_0)
    (used_manchester_1)
    (used_manchester_2)

    (used_split_0)
    (used_split_1)
    (used_split_2)

    (used_geneva_0)
    (used_geneva_1)
    (used_geneva_2)

    (friend_met)
    (trip_complete)
  )

  (:action assign_day_1_manchester
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (day_assigned day_1))
      (used_manchester_0)
    )
    :effect (and
      (at manchester day_1)
      (day_assigned day_1)
      (not (used_manchester_0))
      (used_manchester_1)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action assign_day_1_split
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (day_assigned day_1))
      (used_split_0)
    )
    :effect (and
      (at split day_1)
      (day_assigned day_1)
      (not (used_split_0))
      (used_split_1)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action assign_day_1_geneva
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (day_assigned day_1))
      (used_geneva_0)
    )
    :effect (and
      (at geneva day_1)
      (day_assigned day_1)
      (not (used_geneva_0))
      (used_geneva_1)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action continue_day_2_manchester
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_1 day_2)
      (at manchester day_1)
      (not (day_assigned day_2))
      (used_manchester_1)
    )
    :effect (and
      (at manchester day_2)
      (day_assigned day_2)
      (not (used_manchester_1))
      (used_manchester_2)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action continue_day_2_split
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_1 day_2)
      (at split day_1)
      (not (day_assigned day_2))
      (used_split_1)
      (meeting_day day_2)
    )
    :effect (and
      (at split day_2)
      (day_assigned day_2)
      (not (used_split_1))
      (used_split_2)
      (friend_met)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action continue_day_2_geneva
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_1 day_2)
      (at geneva day_1)
      (not (day_assigned day_2))
      (used_geneva_1)
    )
    :effect (and
      (at geneva day_2)
      (day_assigned day_2)
      (not (used_geneva_1))
      (used_geneva_2)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action fly_day_2_manchester_to_split
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_1 day_2)
      (at manchester day_1)
      (direct manchester split)
      (not (day_assigned day_2))
      (used_split_0)
      (meeting_day day_2)
    )
    :effect (and
      (at split day_2)
      (day_assigned day_2)
      (not (used_split_0))
      (used_split_1)
      (friend_met)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action fly_day_2_manchester_to_geneva
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_1 day_2)
      (at manchester day_1)
      (direct manchester geneva)
      (not (day_assigned day_2))
      (used_geneva_0)
    )
    :effect (and
      (at geneva day_2)
      (day_assigned day_2)
      (not (used_geneva_0))
      (used_geneva_1)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action fly_day_2_split_to_manchester
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_1 day_2)
      (at split day_1)
      (direct split manchester)
      (not (day_assigned day_2))
      (used_manchester_0)
    )
    :effect (and
      (at manchester day_2)
      (day_assigned day_2)
      (not (used_manchester_0))
      (used_manchester_1)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action fly_day_2_split_to_geneva
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_1 day_2)
      (at split day_1)
      (direct split geneva)
      (not (day_assigned day_2))
      (used_geneva_0)
    )
    :effect (and
      (at geneva day_2)
      (day_assigned day_2)
      (not (used_geneva_0))
      (used_geneva_1)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action fly_day_2_geneva_to_manchester
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_1 day_2)
      (at geneva day_1)
      (direct geneva manchester)
      (not (day_assigned day_2))
      (used_manchester_0)
    )
    :effect (and
      (at manchester day_2)
      (day_assigned day_2)
      (not (used_manchester_0))
      (used_manchester_1)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action fly_day_2_geneva_to_split
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_1 day_2)
      (at geneva day_1)
      (direct geneva split)
      (not (day_assigned day_2))
      (used_split_0)
      (meeting_day day_2)
    )
    :effect (and
      (at split day_2)
      (day_assigned day_2)
      (not (used_split_0))
      (used_split_1)
      (friend_met)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action continue_day_3_manchester
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_2 day_3)
      (at manchester day_2)
      (not (day_assigned day_3))
      (used_manchester_1)
    )
    :effect (and
      (at manchester day_3)
      (day_assigned day_3)
      (not (used_manchester_1))
      (used_manchester_2)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action continue_day_3_split
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_2 day_3)
      (at split day_2)
      (not (day_assigned day_3))
      (used_split_1)
      (meeting_day day_3)
    )
    :effect (and
      (at split day_3)
      (day_assigned day_3)
      (not (used_split_1))
      (used_split_2)
      (friend_met)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action continue_day_3_geneva
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_2 day_3)
      (at geneva day_2)
      (not (day_assigned day_3))
      (used_geneva_1)
    )
    :effect (and
      (at geneva day_3)
      (day_assigned day_3)
      (not (used_geneva_1))
      (used_geneva_2)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action fly_day_3_manchester_to_split
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_2 day_3)
      (at manchester day_2)
      (direct manchester split)
      (not (day_assigned day_3))
      (used_split_0)
      (meeting_day day_3)
    )
    :effect (and
      (at split day_3)
      (day_assigned day_3)
      (not (used_split_0))
      (used_split_1)
      (friend_met)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action fly_day_3_manchester_to_geneva
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_2 day_3)
      (at manchester day_2)
      (direct manchester geneva)
      (not (day_assigned day_3))
      (used_geneva_0)
    )
    :effect (and
      (at geneva day_3)
      (day_assigned day_3)
      (not (used_geneva_0))
      (used_geneva_1)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action fly_day_3_split_to_manchester
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_2 day_3)
      (at split day_2)
      (direct split manchester)
      (not (day_assigned day_3))
      (used_manchester_0)
    )
    :effect (and
      (at manchester day_3)
      (day_assigned day_3)
      (not (used_manchester_0))
      (used_manchester_1)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action fly_day_3_split_to_geneva
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_2 day_3)
      (at split day_2)
      (direct split geneva)
      (not (day_assigned day_3))
      (used_geneva_0)
    )
    :effect (and
      (at geneva day_3)
      (day_assigned day_3)
      (not (used_geneva_0))
      (used_geneva_1)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action fly_day_3_geneva_to_manchester
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_2 day_3)
      (at geneva day_2)
      (direct geneva manchester)
      (not (day_assigned day_3))
      (used_manchester_0)
    )
    :effect (and
      (at manchester day_3)
      (day_assigned day_3)
      (not (used_manchester_0))
      (used_manchester_1)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action fly_day_3_geneva_to_split
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_2 day_3)
      (at geneva day_2)
      (direct geneva split)
      (not (day_assigned day_3))
      (used_split_0)
      (meeting_day day_3)
    )
    :effect (and
      (at split day_3)
      (day_assigned day_3)
      (not (used_split_0))
      (used_split_1)
      (friend_met)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action continue_day_4_manchester
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_3 day_4)
      (at manchester day_3)
      (not (day_assigned day_4))
      (used_manchester_1)
    )
    :effect (and
      (at manchester day_4)
      (day_assigned day_4)
      (not (used_manchester_1))
      (used_manchester_2)
      (not (current_day day_4))
      (trip_complete)
    )
  )

  (:action continue_day_4_split
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_3 day_4)
      (at split day_3)
      (not (day_assigned day_4))
      (used_split_1)
    )
    :effect (and
      (at split day_4)
      (day_assigned day_4)
      (not (used_split_1))
      (used_split_2)
      (not (current_day day_4))
      (trip_complete)
    )
  )

  (:action continue_day_4_geneva
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_3 day_4)
      (at geneva day_3)
      (not (day_assigned day_4))
      (used_geneva_1)
    )
    :effect (and
      (at geneva day_4)
      (day_assigned day_4)
      (not (used_geneva_1))
      (used_geneva_2)
      (not (current_day day_4))
      (trip_complete)
    )
  )

  (:action fly_day_4_manchester_to_split
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_3 day_4)
      (at manchester day_3)
      (direct manchester split)
      (not (day_assigned day_4))
      (used_split_0)
    )
    :effect (and
      (at split day_4)
      (day_assigned day_4)
      (not (used_split_0))
      (used_split_1)
      (not (current_day day_4))
      (trip_complete)
    )
  )

  (:action fly_day_4_manchester_to_geneva
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_3 day_4)
      (at manchester day_3)
      (direct manchester geneva)
      (not (day_assigned day_4))
      (used_geneva_0)
    )
    :effect (and
      (at geneva day_4)
      (day_assigned day_4)
      (not (used_geneva_0))
      (used_geneva_1)
      (not (current_day day_4))
      (trip_complete)
    )
  )

  (:action fly_day_4_split_to_manchester
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_3 day_4)
      (at split day_3)
      (direct split manchester)
      (not (day_assigned day_4))
      (used_manchester_0)
    )
    :effect (and
      (at manchester day_4)
      (day_assigned day_4)
      (not (used_manchester_0))
      (used_manchester_1)
      (not (current_day day_4))
      (trip_complete)
    )
  )

  (:action fly_day_4_split_to_geneva
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_3 day_4)
      (at split day_3)
      (direct split geneva)
      (not (day_assigned day_4))
      (used_geneva_0)
    )
    :effect (and
      (at geneva day_4)
      (day_assigned day_4)
      (not (used_geneva_0))
      (used_geneva_1)
      (not (current_day day_4))
      (trip_complete)
    )
  )

  (:action fly_day_4_geneva_to_manchester
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_3 day_4)
      (at geneva day_3)
      (direct geneva manchester)
      (not (day_assigned day_4))
      (used_manchester_0)
    )
    :effect (and
      (at manchester day_4)
      (day_assigned day_4)
      (not (used_manchester_0))
      (used_manchester_1)
      (not (current_day day_4))
      (trip_complete)
    )
  )

  (:action fly_day_4_geneva_to_split
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_3 day_4)
      (at geneva day_3)
      (direct geneva split)
      (not (day_assigned day_4))
      (used_split_0)
    )
    :effect (and
      (at split day_4)
      (day_assigned day_4)
      (not (used_split_0))
      (used_split_1)
      (not (current_day day_4))
      (trip_complete)
    )
  )
)