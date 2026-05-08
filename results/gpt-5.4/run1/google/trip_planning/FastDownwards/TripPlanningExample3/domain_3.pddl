(define (domain trip_planning_example3)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)

    (visited_on ?d - day ?c - city)

    (stay_need_berlin_3)
    (stay_need_berlin_2)
    (stay_need_berlin_1)

    (stay_need_warsaw_3)
    (stay_need_warsaw_2)
    (stay_need_warsaw_1)

    (stay_need_bucharest_2)
    (stay_need_bucharest_1)

    (friend_window_open ?d - day)
    (met_friend)
    (trip_finished)
  )

  (:action stay_day
    :parameters (?d - day ?d_next - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?c)
      (not (visited_on ?d ?c))
    )
    :effect (and
      (visited_on ?d ?c)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_berlin_3_to_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at berlin)
      (stay_need_berlin_3)
      (not (visited_on ?d berlin))
    )
    :effect (and
      (visited_on ?d berlin)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stay_need_berlin_3))
      (stay_need_berlin_2)
    )
  )

  (:action stay_berlin_2_to_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at berlin)
      (stay_need_berlin_2)
      (not (visited_on ?d berlin))
    )
    :effect (and
      (visited_on ?d berlin)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stay_need_berlin_2))
      (stay_need_berlin_1)
    )
  )

  (:action stay_berlin_1_done
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at berlin)
      (stay_need_berlin_1)
      (not (visited_on ?d berlin))
    )
    :effect (and
      (visited_on ?d berlin)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stay_need_berlin_1))
    )
  )

  (:action stay_warsaw_3_to_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at warsaw)
      (stay_need_warsaw_3)
      (not (visited_on ?d warsaw))
    )
    :effect (and
      (visited_on ?d warsaw)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stay_need_warsaw_3))
      (stay_need_warsaw_2)
    )
  )

  (:action stay_warsaw_2_to_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at warsaw)
      (stay_need_warsaw_2)
      (not (visited_on ?d warsaw))
    )
    :effect (and
      (visited_on ?d warsaw)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stay_need_warsaw_2))
      (stay_need_warsaw_1)
    )
  )

  (:action stay_warsaw_1_done
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at warsaw)
      (stay_need_warsaw_1)
      (not (visited_on ?d warsaw))
    )
    :effect (and
      (visited_on ?d warsaw)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stay_need_warsaw_1))
    )
  )

  (:action stay_bucharest_2_to_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at bucharest)
      (stay_need_bucharest_2)
      (not (visited_on ?d bucharest))
    )
    :effect (and
      (visited_on ?d bucharest)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stay_need_bucharest_2))
      (stay_need_bucharest_1)
    )
  )

  (:action stay_bucharest_1_done
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at bucharest)
      (stay_need_bucharest_1)
      (not (visited_on ?d bucharest))
    )
    :effect (and
      (visited_on ?d bucharest)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stay_need_bucharest_1))
    )
  )

  (:action fly_day
    :parameters (?d - day ?d_next - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct_flight ?from ?to)
      (not (visited_on ?d ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_on ?d ?to)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at bucharest)
      (friend_window_open ?d)
      (not (met_friend))
    )
    :effect (and
      (met_friend))
  )

  (:action finish_trip
    :parameters ()
    :precondition (and
      (current_day day7)
      (at bucharest)
      (met_friend)
      (not (stay_need_berlin_3))
      (not (stay_need_berlin_2))
      (not (stay_need_berlin_1))
      (not (stay_need_warsaw_3))
      (not (stay_need_warsaw_2))
      (not (stay_need_warsaw_1))
      (not (stay_need_bucharest_2))
      (not (stay_need_bucharest_1))
    )
    :effect (and
      (trip_finished))
  )
)