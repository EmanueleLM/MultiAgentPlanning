(define (domain trip_planning_example16)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (visited_day ?d - day ?c - city)

    (day_count_0)
    (day_count_1)
    (day_count_2)
    (day_count_3)
    (day_count_4)
    (day_count_5)
    (day_count_6)
    (day_count_7)
    (day_count_8)
    (day_count_9)

    (prague_days_0)
    (prague_days_1)
    (prague_days_2)
    (prague_days_3)

    (vienna_days_0)
    (vienna_days_1)
    (vienna_days_2)
    (vienna_days_3)

    (porto_days_0)
    (porto_days_1)
    (porto_days_2)
    (porto_days_3)
    (porto_days_4)
    (porto_days_5)

    (workshop_attended)
  )

  (:action stay_prague_from_1
    :parameters ()
    :precondition (and
      (current_day d1) (next_day d1 d2) (at prague)
      (day_count_0)
      (prague_days_0))
    :effect (and
      (not (current_day d1)) (current_day d2)
      (not (day_count_0)) (day_count_1)
      (not (prague_days_0)) (prague_days_1)
      (visited_day d1 prague)
      (workshop_attended))
  )

  (:action stay_prague_from_2
    :parameters ()
    :precondition (and
      (current_day d2) (next_day d2 d3) (at prague)
      (day_count_1)
      (prague_days_1))
    :effect (and
      (not (current_day d2)) (current_day d3)
      (not (day_count_1)) (day_count_2)
      (not (prague_days_1)) (prague_days_2)
      (visited_day d2 prague)
      (workshop_attended))
  )

  (:action stay_prague_from_3
    :parameters ()
    :precondition (and
      (current_day d3) (next_day d3 d4) (at prague)
      (day_count_2)
      (prague_days_2))
    :effect (and
      (not (current_day d3)) (current_day d4)
      (not (day_count_2)) (day_count_3)
      (not (prague_days_2)) (prague_days_3)
      (visited_day d3 prague)
      (workshop_attended))
  )

  (:action stay_prague_from_4
    :parameters ()
    :precondition (and
      (current_day d4) (next_day d4 d5) (at prague)
      (day_count_3)
      (prague_days_0))
    :effect (and
      (not (current_day d4)) (current_day d5)
      (not (day_count_3)) (day_count_4)
      (not (prague_days_0)) (prague_days_1)
      (visited_day d4 prague))
  )

  (:action stay_prague_from_5
    :parameters ()
    :precondition (and
      (current_day d5) (next_day d5 d6) (at prague)
      (day_count_4)
      (prague_days_1))
    :effect (and
      (not (current_day d5)) (current_day d6)
      (not (day_count_4)) (day_count_5)
      (not (prague_days_1)) (prague_days_2)
      (visited_day d5 prague))
  )

  (:action stay_prague_from_6
    :parameters ()
    :precondition (and
      (current_day d6) (next_day d6 d7) (at prague)
      (day_count_5)
      (prague_days_2))
    :effect (and
      (not (current_day d6)) (current_day d7)
      (not (day_count_5)) (day_count_6)
      (not (prague_days_2)) (prague_days_3)
      (visited_day d6 prague))
  )

  (:action stay_vienna_from_1
    :parameters ()
    :precondition (and
      (current_day d1) (next_day d1 d2) (at vienna)
      (day_count_0)
      (vienna_days_0))
    :effect (and
      (not (current_day d1)) (current_day d2)
      (not (day_count_0)) (day_count_1)
      (not (vienna_days_0)) (vienna_days_1)
      (visited_day d1 vienna))
  )

  (:action stay_vienna_from_2
    :parameters ()
    :precondition (and
      (current_day d2) (next_day d2 d3) (at vienna)
      (day_count_1)
      (vienna_days_1))
    :effect (and
      (not (current_day d2)) (current_day d3)
      (not (day_count_1)) (day_count_2)
      (not (vienna_days_1)) (vienna_days_2)
      (visited_day d2 vienna))
  )

  (:action stay_vienna_from_3
    :parameters ()
    :precondition (and
      (current_day d3) (next_day d3 d4) (at vienna)
      (day_count_2)
      (vienna_days_2))
    :effect (and
      (not (current_day d3)) (current_day d4)
      (not (day_count_2)) (day_count_3)
      (not (vienna_days_2)) (vienna_days_3)
      (visited_day d3 vienna))
  )

  (:action stay_porto_from_1
    :parameters ()
    :precondition (and
      (current_day d1) (next_day d1 d2) (at porto)
      (day_count_0)
      (porto_days_0))
    :effect (and
      (not (current_day d1)) (current_day d2)
      (not (day_count_0)) (day_count_1)
      (not (porto_days_0)) (porto_days_1)
      (visited_day d1 porto))
  )

  (:action stay_porto_from_2
    :parameters ()
    :precondition (and
      (current_day d2) (next_day d2 d3) (at porto)
      (day_count_1)
      (porto_days_1))
    :effect (and
      (not (current_day d2)) (current_day d3)
      (not (day_count_1)) (day_count_2)
      (not (porto_days_1)) (porto_days_2)
      (visited_day d2 porto))
  )

  (:action stay_porto_from_3
    :parameters ()
    :precondition (and
      (current_day d3) (next_day d3 d4) (at porto)
      (day_count_2)
      (porto_days_2))
    :effect (and
      (not (current_day d3)) (current_day d4)
      (not (day_count_2)) (day_count_3)
      (not (porto_days_2)) (porto_days_3)
      (visited_day d3 porto))
  )

  (:action stay_porto_from_4
    :parameters ()
    :precondition (and
      (current_day d4) (next_day d4 d5) (at porto)
      (day_count_3)
      (porto_days_3))
    :effect (and
      (not (current_day d4)) (current_day d5)
      (not (day_count_3)) (day_count_4)
      (not (porto_days_3)) (porto_days_4)
      (visited_day d4 porto))
  )

  (:action stay_porto_from_5
    :parameters ()
    :precondition (and
      (current_day d5) (next_day d5 d6) (at porto)
      (day_count_4)
      (porto_days_4))
    :effect (and
      (not (current_day d5)) (current_day d6)
      (not (day_count_4)) (day_count_5)
      (not (porto_days_4)) (porto_days_5)
      (visited_day d5 porto))
  )

  (:action fly_prague_to_vienna_from_1
    :parameters ()
    :precondition (and
      (current_day d1) (next_day d1 d2) (at prague) (direct prague vienna)
      (day_count_0)
      (prague_days_0))
    :effect (and
      (not (at prague)) (at vienna)
      (not (current_day d1)) (current_day d2)
      (not (day_count_0)) (day_count_1)
      (not (prague_days_0)) (prague_days_1)
      (visited_day d1 prague)
      (workshop_attended))
  )

  (:action fly_prague_to_vienna_from_2
    :parameters ()
    :precondition (and
      (current_day d2) (next_day d2 d3) (at prague) (direct prague vienna)
      (day_count_1)
      (prague_days_1))
    :effect (and
      (not (at prague)) (at vienna)
      (not (current_day d2)) (current_day d3)
      (not (day_count_1)) (day_count_2)
      (not (prague_days_1)) (prague_days_2)
      (visited_day d2 prague)
      (workshop_attended))
  )

  (:action fly_prague_to_vienna_from_3
    :parameters ()
    :precondition (and
      (current_day d3) (next_day d3 d4) (at prague) (direct prague vienna)
      (day_count_2)
      (prague_days_2))
    :effect (and
      (not (at prague)) (at vienna)
      (not (current_day d3)) (current_day d4)
      (not (day_count_2)) (day_count_3)
      (not (prague_days_2)) (prague_days_3)
      (visited_day d3 prague)
      (workshop_attended))
  )

  (:action fly_vienna_to_prague_from_1
    :parameters ()
    :precondition (and
      (current_day d1) (next_day d1 d2) (at vienna) (direct vienna prague)
      (day_count_0)
      (vienna_days_0))
    :effect (and
      (not (at vienna)) (at prague)
      (not (current_day d1)) (current_day d2)
      (not (day_count_0)) (day_count_1)
      (not (vienna_days_0)) (vienna_days_1)
      (visited_day d1 vienna))
  )

  (:action fly_vienna_to_prague_from_2
    :parameters ()
    :precondition (and
      (current_day d2) (next_day d2 d3) (at vienna) (direct vienna prague)
      (day_count_1)
      (vienna_days_1))
    :effect (and
      (not (at vienna)) (at prague)
      (not (current_day d2)) (current_day d3)
      (not (day_count_1)) (day_count_2)
      (not (vienna_days_1)) (vienna_days_2)
      (visited_day d2 vienna))
  )

  (:action fly_vienna_to_prague_from_3
    :parameters ()
    :precondition (and
      (current_day d3) (next_day d3 d4) (at vienna) (direct vienna prague)
      (day_count_2)
      (vienna_days_2))
    :effect (and
      (not (at vienna)) (at prague)
      (not (current_day d3)) (current_day d4)
      (not (day_count_2)) (day_count_3)
      (not (vienna_days_2)) (vienna_days_3)
      (visited_day d3 vienna))
  )

  (:action fly_vienna_to_porto_from_1
    :parameters ()
    :precondition (and
      (current_day d1) (next_day d1 d2) (at vienna) (direct vienna porto)
      (day_count_0)
      (vienna_days_0)
      (porto_days_0))
    :effect (and
      (not (at vienna)) (at porto)
      (not (current_day d1)) (current_day d2)
      (not (day_count_0)) (day_count_1)
      (not (vienna_days_0)) (vienna_days_1)
      (not (porto_days_0)) (porto_days_1)
      (visited_day d1 vienna))
  )

  (:action fly_vienna_to_porto_from_2
    :parameters ()
    :precondition (and
      (current_day d2) (next_day d2 d3) (at vienna) (direct vienna porto)
      (day_count_1)
      (vienna_days_1)
      (porto_days_1))
    :effect (and
      (not (at vienna)) (at porto)
      (not (current_day d2)) (current_day d3)
      (not (day_count_1)) (day_count_2)
      (not (vienna_days_1)) (vienna_days_2)
      (not (porto_days_1)) (porto_days_2)
      (visited_day d2 vienna))
  )

  (:action fly_vienna_to_porto_from_3
    :parameters ()
    :precondition (and
      (current_day d3) (next_day d3 d4) (at vienna) (direct vienna porto)
      (day_count_2)
      (vienna_days_2)
      (porto_days_2))
    :effect (and
      (not (at vienna)) (at porto)
      (not (current_day d3)) (current_day d4)
      (not (day_count_2)) (day_count_3)
      (not (vienna_days_2)) (vienna_days_3)
      (not (porto_days_2)) (porto_days_3)
      (visited_day d3 vienna))
  )

  (:action fly_porto_to_vienna_from_1
    :parameters ()
    :precondition (and
      (current_day d1) (next_day d1 d2) (at porto) (direct porto vienna)
      (day_count_0)
      (porto_days_0)
      (vienna_days_0))
    :effect (and
      (not (at porto)) (at vienna)
      (not (current_day d1)) (current_day d2)
      (not (day_count_0)) (day_count_1)
      (not (porto_days_0)) (porto_days_1)
      (not (vienna_days_0)) (vienna_days_1)
      (visited_day d1 porto))
  )

  (:action fly_porto_to_vienna_from_2
    :parameters ()
    :precondition (and
      (current_day d2) (next_day d2 d3) (at porto) (direct porto vienna)
      (day_count_1)
      (porto_days_1)
      (vienna_days_1))
    :effect (and
      (not (at porto)) (at vienna)
      (not (current_day d2)) (current_day d3)
      (not (day_count_1)) (day_count_2)
      (not (porto_days_1)) (porto_days_2)
      (not (vienna_days_1)) (vienna_days_2)
      (visited_day d2 porto))
  )

  (:action fly_porto_to_vienna_from_3
    :parameters ()
    :precondition (and
      (current_day d3) (next_day d3 d4) (at porto) (direct porto vienna)
      (day_count_2)
      (porto_days_2)
      (vienna_days_2))
    :effect (and
      (not (at porto)) (at vienna)
      (not (current_day d3)) (current_day d4)
      (not (day_count_2)) (day_count_3)
      (not (porto_days_2)) (porto_days_3)
      (not (vienna_days_2)) (vienna_days_3)
      (visited_day d3 porto))
  )

  (:action finish_in_prague_from_9
    :parameters ()
    :precondition (and
      (current_day d9) (next_day d9 d10) (at prague)
      (day_count_8)
      (prague_days_2))
    :effect (and
      (not (current_day d9)) (current_day d10)
      (not (day_count_8)) (day_count_9)
      (not (prague_days_2)) (prague_days_3)
      (visited_day d9 prague))
  )

  (:action finish_in_vienna_from_9
    :parameters ()
    :precondition (and
      (current_day d9) (next_day d9 d10) (at vienna)
      (day_count_8)
      (vienna_days_2))
    :effect (and
      (not (current_day d9)) (current_day d10)
      (not (day_count_8)) (day_count_9)
      (not (vienna_days_2)) (vienna_days_3)
      (visited_day d9 vienna))
  )

  (:action finish_in_porto_from_9
    :parameters ()
    :precondition (and
      (current_day d9) (next_day d9 d10) (at porto)
      (day_count_8)
      (porto_days_4))
    :effect (and
      (not (current_day d9)) (current_day d10)
      (not (day_count_8)) (day_count_9)
      (not (porto_days_4)) (porto_days_5)
      (visited_day d9 porto))
  )
)