(define (domain tripplanningexample8)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (current_city ?c - city)
    (today ?d - day)

    (visited_athens ?d - day)
    (visited_krakow ?d - day)
    (visited_zurich ?d - day)

    (need_athens_7)
    (need_athens_6)
    (need_athens_5)
    (need_athens_4)
    (need_athens_3)
    (need_athens_2)
    (need_athens_1)
    (need_athens_0)

    (need_krakow_6)
    (need_krakow_5)
    (need_krakow_4)
    (need_krakow_3)
    (need_krakow_2)
    (need_krakow_1)
    (need_krakow_0)

    (need_zurich_5)
    (need_zurich_4)
    (need_zurich_3)
    (need_zurich_2)
    (need_zurich_1)
    (need_zurich_0)

    (athens_window_done)
  )

  (:action stay_athens_need_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (need_athens_7)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_athens ?d2)
      (not (need_athens_7))
      (need_athens_6)
    )
  )

  (:action stay_athens_need_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (need_athens_6)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_athens ?d2)
      (not (need_athens_6))
      (need_athens_5)
    )
  )

  (:action stay_athens_need_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (need_athens_5)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_athens ?d2)
      (not (need_athens_5))
      (need_athens_4)
    )
  )

  (:action stay_athens_need_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (need_athens_4)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_athens ?d2)
      (not (need_athens_4))
      (need_athens_3)
    )
  )

  (:action stay_athens_need_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (need_athens_3)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_athens ?d2)
      (not (need_athens_3))
      (need_athens_2)
    )
  )

  (:action stay_athens_need_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (need_athens_2)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_athens ?d2)
      (not (need_athens_2))
      (need_athens_1)
    )
  )

  (:action stay_athens_need_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (need_athens_1)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_athens ?d2)
      (not (need_athens_1))
      (need_athens_0)
    )
  )

  (:action stay_athens_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (need_athens_0)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_athens ?d2)
    )
  )

  (:action stay_krakow_need_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (need_krakow_6)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_krakow ?d2)
      (not (need_krakow_6))
      (need_krakow_5)
    )
  )

  (:action stay_krakow_need_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (need_krakow_5)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_krakow ?d2)
      (not (need_krakow_5))
      (need_krakow_4)
    )
  )

  (:action stay_krakow_need_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (need_krakow_4)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_krakow ?d2)
      (not (need_krakow_4))
      (need_krakow_3)
    )
  )

  (:action stay_krakow_need_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (need_krakow_3)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_krakow ?d2)
      (not (need_krakow_3))
      (need_krakow_2)
    )
  )

  (:action stay_krakow_need_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (need_krakow_2)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_krakow ?d2)
      (not (need_krakow_2))
      (need_krakow_1)
    )
  )

  (:action stay_krakow_need_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (need_krakow_1)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_krakow ?d2)
      (not (need_krakow_1))
      (need_krakow_0)
    )
  )

  (:action stay_krakow_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (need_krakow_0)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_krakow ?d2)
    )
  )

  (:action stay_zurich_need_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (need_zurich_5)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_zurich ?d2)
      (not (need_zurich_5))
      (need_zurich_4)
    )
  )

  (:action stay_zurich_need_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (need_zurich_4)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_zurich ?d2)
      (not (need_zurich_4))
      (need_zurich_3)
    )
  )

  (:action stay_zurich_need_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (need_zurich_3)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_zurich ?d2)
      (not (need_zurich_3))
      (need_zurich_2)
    )
  )

  (:action stay_zurich_need_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (need_zurich_2)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_zurich ?d2)
      (not (need_zurich_2))
      (need_zurich_1)
    )
  )

  (:action stay_zurich_need_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (need_zurich_1)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_zurich ?d2)
      (not (need_zurich_1))
      (need_zurich_0)
    )
  )

  (:action stay_zurich_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (need_zurich_0)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_zurich ?d2)
    )
  )

  (:action fly_athens_to_zurich_need_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (direct athens zurich)
      (need_zurich_5)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city athens))
      (current_city zurich)
      (visited_zurich ?d2)
      (not (need_zurich_5))
      (need_zurich_4)
    )
  )

  (:action fly_athens_to_zurich_need_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (direct athens zurich)
      (need_zurich_4)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city athens))
      (current_city zurich)
      (visited_zurich ?d2)
      (not (need_zurich_4))
      (need_zurich_3)
    )
  )

  (:action fly_athens_to_zurich_need_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (direct athens zurich)
      (need_zurich_3)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city athens))
      (current_city zurich)
      (visited_zurich ?d2)
      (not (need_zurich_3))
      (need_zurich_2)
    )
  )

  (:action fly_athens_to_zurich_need_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (direct athens zurich)
      (need_zurich_2)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city athens))
      (current_city zurich)
      (visited_zurich ?d2)
      (not (need_zurich_2))
      (need_zurich_1)
    )
  )

  (:action fly_athens_to_zurich_need_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (direct athens zurich)
      (need_zurich_1)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city athens))
      (current_city zurich)
      (visited_zurich ?d2)
      (not (need_zurich_1))
      (need_zurich_0)
    )
  )

  (:action fly_athens_to_zurich_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city athens)
      (direct athens zurich)
      (need_zurich_0)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city athens))
      (current_city zurich)
      (visited_zurich ?d2)
    )
  )

  (:action fly_zurich_to_athens_need_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich athens)
      (need_athens_7)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city athens)
      (visited_athens ?d2)
      (not (need_athens_7))
      (need_athens_6)
    )
  )

  (:action fly_zurich_to_athens_need_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich athens)
      (need_athens_6)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city athens)
      (visited_athens ?d2)
      (not (need_athens_6))
      (need_athens_5)
    )
  )

  (:action fly_zurich_to_athens_need_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich athens)
      (need_athens_5)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city athens)
      (visited_athens ?d2)
      (not (need_athens_5))
      (need_athens_4)
    )
  )

  (:action fly_zurich_to_athens_need_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich athens)
      (need_athens_4)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city athens)
      (visited_athens ?d2)
      (not (need_athens_4))
      (need_athens_3)
    )
  )

  (:action fly_zurich_to_athens_need_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich athens)
      (need_athens_3)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city athens)
      (visited_athens ?d2)
      (not (need_athens_3))
      (need_athens_2)
    )
  )

  (:action fly_zurich_to_athens_need_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich athens)
      (need_athens_2)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city athens)
      (visited_athens ?d2)
      (not (need_athens_2))
      (need_athens_1)
    )
  )

  (:action fly_zurich_to_athens_need_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich athens)
      (need_athens_1)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city athens)
      (visited_athens ?d2)
      (not (need_athens_1))
      (need_athens_0)
    )
  )

  (:action fly_zurich_to_athens_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich athens)
      (need_athens_0)
      (not (visited_athens ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city athens)
      (visited_athens ?d2)
    )
  )

  (:action fly_zurich_to_krakow_need_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich krakow)
      (need_krakow_6)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city krakow)
      (visited_krakow ?d2)
      (not (need_krakow_6))
      (need_krakow_5)
    )
  )

  (:action fly_zurich_to_krakow_need_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich krakow)
      (need_krakow_5)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city krakow)
      (visited_krakow ?d2)
      (not (need_krakow_5))
      (need_krakow_4)
    )
  )

  (:action fly_zurich_to_krakow_need_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich krakow)
      (need_krakow_4)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city krakow)
      (visited_krakow ?d2)
      (not (need_krakow_4))
      (need_krakow_3)
    )
  )

  (:action fly_zurich_to_krakow_need_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich krakow)
      (need_krakow_3)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city krakow)
      (visited_krakow ?d2)
      (not (need_krakow_3))
      (need_krakow_2)
    )
  )

  (:action fly_zurich_to_krakow_need_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich krakow)
      (need_krakow_2)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city krakow)
      (visited_krakow ?d2)
      (not (need_krakow_2))
      (need_krakow_1)
    )
  )

  (:action fly_zurich_to_krakow_need_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich krakow)
      (need_krakow_1)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city krakow)
      (visited_krakow ?d2)
      (not (need_krakow_1))
      (need_krakow_0)
    )
  )

  (:action fly_zurich_to_krakow_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city zurich)
      (direct zurich krakow)
      (need_krakow_0)
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city zurich))
      (current_city krakow)
      (visited_krakow ?d2)
    )
  )

  (:action fly_krakow_to_zurich_need_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (direct krakow zurich)
      (need_zurich_5)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city krakow))
      (current_city zurich)
      (visited_zurich ?d2)
      (not (need_zurich_5))
      (need_zurich_4)
    )
  )

  (:action fly_krakow_to_zurich_need_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (direct krakow zurich)
      (need_zurich_4)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city krakow))
      (current_city zurich)
      (visited_zurich ?d2)
      (not (need_zurich_4))
      (need_zurich_3)
    )
  )

  (:action fly_krakow_to_zurich_need_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (direct krakow zurich)
      (need_zurich_3)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city krakow))
      (current_city zurich)
      (visited_zurich ?d2)
      (not (need_zurich_3))
      (need_zurich_2)
    )
  )

  (:action fly_krakow_to_zurich_need_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (direct krakow zurich)
      (need_zurich_2)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city krakow))
      (current_city zurich)
      (visited_zurich ?d2)
      (not (need_zurich_2))
      (need_zurich_1)
    )
  )

  (:action fly_krakow_to_zurich_need_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (direct krakow zurich)
      (need_zurich_1)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city krakow))
      (current_city zurich)
      (visited_zurich ?d2)
      (not (need_zurich_1))
      (need_zurich_0)
    )
  )

  (:action fly_krakow_to_zurich_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (current_city krakow)
      (direct krakow zurich)
      (need_zurich_0)
      (not (visited_zurich ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (current_city krakow))
      (current_city zurich)
      (visited_zurich ?d2)
    )
  )

  (:action mark_athens_window
    :parameters ()
    :precondition (and
      (visited_athens day_1)
      (visited_athens day_2)
      (visited_athens day_3)
      (visited_athens day_4)
      (visited_athens day_5)
      (visited_athens day_6)
      (visited_athens day_7)
      (not (athens_window_done))
    )
    :effect (and
      (athens_window_done)
    )
  )
)