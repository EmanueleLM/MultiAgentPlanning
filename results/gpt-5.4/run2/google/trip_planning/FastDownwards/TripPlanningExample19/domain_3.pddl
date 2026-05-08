(define (domain tripplanningexample19)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (visited_brussels ?d - day)
    (visited_valencia ?d - day)
    (visited_nice ?d - day)
    (friend_window ?d - day)
    (met_friends)
    (trip_complete)
  )

  (:action spend_day_in_brussels
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at brussels)
      (not (visited_brussels ?d))
      (not (visited_valencia ?d))
      (not (visited_nice ?d))
    )
    :effect (and
      (visited_brussels ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action spend_day_in_valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at valencia)
      (not (visited_brussels ?d))
      (not (visited_valencia ?d))
      (not (visited_nice ?d))
    )
    :effect (and
      (visited_valencia ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action spend_day_in_nice
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice)
      (not (visited_brussels ?d))
      (not (visited_valencia ?d))
      (not (visited_nice ?d))
    )
    :effect (and
      (visited_nice ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action meet_friends_in_nice
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice)
      (friend_window ?d)
      (not (met_friends))
      (not (visited_brussels ?d))
      (not (visited_valencia ?d))
      (not (visited_nice ?d))
    )
    :effect (and
      (visited_nice ?d)
      (met_friends)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_brussels_to_valencia
    :parameters ()
    :precondition (and
      (at brussels)
      (direct brussels valencia)
    )
    :effect (and
      (not (at brussels))
      (at valencia)
    )
  )

  (:action fly_valencia_to_brussels
    :parameters ()
    :precondition (and
      (at valencia)
      (direct valencia brussels)
    )
    :effect (and
      (not (at valencia))
      (at brussels)
    )
  )

  (:action fly_brussels_to_nice
    :parameters ()
    :precondition (and
      (at brussels)
      (direct brussels nice)
    )
    :effect (and
      (not (at brussels))
      (at nice)
    )
  )

  (:action fly_nice_to_brussels
    :parameters ()
    :precondition (and
      (at nice)
      (direct nice brussels)
    )
    :effect (and
      (not (at nice))
      (at brussels)
    )
  )

  (:action finish_in_brussels
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at brussels)
      (not (visited_brussels ?d))
      (not (visited_valencia ?d))
      (not (visited_nice ?d))
    )
    :effect (and
      (visited_brussels ?d)
      (trip_complete)
    )
  )

  (:action finish_in_valencia
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at valencia)
      (not (visited_brussels ?d))
      (not (visited_valencia ?d))
      (not (visited_nice ?d))
    )
    :effect (and
      (visited_valencia ?d)
      (trip_complete)
    )
  )

  (:action finish_in_nice
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at nice)
      (not (visited_brussels ?d))
      (not (visited_valencia ?d))
      (not (visited_nice ?d))
    )
    :effect (and
      (visited_nice ?d)
      (trip_complete)
    )
  )

  (:action finish_meet_friends_in_nice
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at nice)
      (friend_window ?d)
      (not (met_friends))
      (not (visited_brussels ?d))
      (not (visited_valencia ?d))
      (not (visited_nice ?d))
    )
    :effect (and
      (visited_nice ?d)
      (met_friends)
      (trip_complete)
    )
  )
)