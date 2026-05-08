(define (domain tripplanningexample19)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d - day ?nd - day)
    (current_day ?d - day)

    (stay_need_brussels ?d - day)
    (stay_need_valencia ?d - day)
    (stay_need_nice ?d - day)

    (friends_window ?d - day)
    (met_friends)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition
      (and
        (at ?c)
        (current_day ?d)
        (next ?d ?nd)
        (or_dummy))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?nd))
  )

  (:action stay_brussels
    :parameters (?d - day ?nd - day)
    :precondition
      (and
        (at brussels)
        (current_day ?d)
        (next ?d ?nd)
        (stay_need_brussels ?d))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?nd))
  )

  (:action stay_valencia
    :parameters (?d - day ?nd - day)
    :precondition
      (and
        (at valencia)
        (current_day ?d)
        (next ?d ?nd)
        (stay_need_valencia ?d))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?nd))
  )

  (:action stay_nice
    :parameters (?d - day ?nd - day)
    :precondition
      (and
        (at nice)
        (current_day ?d)
        (next ?d ?nd)
        (stay_need_nice ?d))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?nd))
  )

  (:action stay_nice_and_meet_friends
    :parameters (?d - day ?nd - day)
    :precondition
      (and
        (at nice)
        (current_day ?d)
        (next ?d ?nd)
        (stay_need_nice ?d)
        (friends_window ?d)
        (not (met_friends)))
    :effect
      (and
        (met_friends)
        (not (current_day ?d))
        (current_day ?nd))
  )

  (:action fly_brussels_valencia
    :parameters (?d - day ?nd - day)
    :precondition
      (and
        (at brussels)
        (current_day ?d)
        (next ?d ?nd)
        (direct brussels valencia)
        (stay_need_valencia ?d))
    :effect
      (and
        (not (at brussels))
        (at valencia)
        (not (current_day ?d))
        (current_day ?nd))
  )

  (:action fly_valencia_brussels
    :parameters (?d - day ?nd - day)
    :precondition
      (and
        (at valencia)
        (current_day ?d)
        (next ?d ?nd)
        (direct valencia brussels)
        (stay_need_brussels ?d))
    :effect
      (and
        (not (at valencia))
        (at brussels)
        (not (current_day ?d))
        (current_day ?nd))
  )

  (:action fly_brussels_nice
    :parameters (?d - day ?nd - day)
    :precondition
      (and
        (at brussels)
        (current_day ?d)
        (next ?d ?nd)
        (direct brussels nice)
        (stay_need_nice ?d))
    :effect
      (and
        (not (at brussels))
        (at nice)
        (not (current_day ?d))
        (current_day ?nd))
  )

  (:action fly_brussels_nice_and_meet_friends
    :parameters (?d - day ?nd - day)
    :precondition
      (and
        (at brussels)
        (current_day ?d)
        (next ?d ?nd)
        (direct brussels nice)
        (stay_need_nice ?d)
        (friends_window ?d)
        (not (met_friends)))
    :effect
      (and
        (not (at brussels))
        (at nice)
        (met_friends)
        (not (current_day ?d))
        (current_day ?nd))
  )

  (:action fly_nice_brussels
    :parameters (?d - day ?nd - day)
    :precondition
      (and
        (at nice)
        (current_day ?d)
        (next ?d ?nd)
        (direct nice brussels)
        (stay_need_brussels ?d))
    :effect
      (and
        (not (at nice))
        (at brussels)
        (not (current_day ?d))
        (current_day ?nd))
  )

  (:action fly_nice_brussels_to_valencia
    :parameters (?d1 - day ?d2 - day ?d3 - day)
    :precondition
      (and
        (at nice)
        (current_day ?d1)
        (next ?d1 ?d2)
        (next ?d2 ?d3)
        (direct nice brussels)
        (direct brussels valencia)
        (stay_need_brussels ?d1)
        (stay_need_valencia ?d2))
    :effect
      (and
        (not (at nice))
        (at valencia)
        (not (current_day ?d1))
        (current_day ?d3))
  )

  (:action final_stay_brussels
    :parameters (?d - day)
    :precondition
      (and
        (at brussels)
        (current_day ?d)
        (stay_need_brussels ?d))
    :effect
      (and
        (not (current_day ?d)))
  )

  (:action final_stay_valencia
    :parameters (?d - day)
    :precondition
      (and
        (at valencia)
        (current_day ?d)
        (stay_need_valencia ?d))
    :effect
      (and
        (not (current_day ?d)))
  )

  (:action final_stay_nice
    :parameters (?d - day)
    :precondition
      (and
        (at nice)
        (current_day ?d)
        (stay_need_nice ?d))
    :effect
      (and
        (not (current_day ?d)))
  )

  (:action final_stay_nice_and_meet_friends
    :parameters (?d - day)
    :precondition
      (and
        (at nice)
        (current_day ?d)
        (stay_need_nice ?d)
        (friends_window ?d)
        (not (met_friends)))
    :effect
      (and
        (met_friends)
        (not (current_day ?d)))
  )
)