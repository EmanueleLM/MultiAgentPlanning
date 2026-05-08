(define (domain europe_trip_16_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited ?c - city ?d - day)
    (need_athens_1)
    (need_athens_2)
    (need_athens_3)
    (need_athens_4)
    (need_athens_5)
    (need_athens_6)
    (need_athens_7)
    (need_krakow_1)
    (need_krakow_2)
    (need_krakow_3)
    (need_krakow_4)
    (need_krakow_5)
    (need_krakow_6)
    (need_zurich_1)
    (need_zurich_2)
    (need_zurich_3)
    (need_zurich_4)
    (need_zurich_5)
    (trip_finished)
  )

  (:action visit_day
    :parameters (?c - city ?d - day)
    :precondition (and
      (current_day ?d)
      (at ?c)
      (not (visited athens ?d))
      (not (visited zurich ?d))
      (not (visited krakow ?d))
    )
    :effect (visited ?c ?d)
  )

  (:action advance_athens
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at athens)
      (visited athens ?d1)
      (need_athens_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_athens_1))
      (need_athens_2)
    )
  )

  (:action advance_athens_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at athens)
      (visited athens ?d1)
      (need_athens_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_athens_2))
      (need_athens_3)
    )
  )

  (:action advance_athens_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at athens)
      (visited athens ?d1)
      (need_athens_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_athens_3))
      (need_athens_4)
    )
  )

  (:action advance_athens_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at athens)
      (visited athens ?d1)
      (need_athens_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_athens_4))
      (need_athens_5)
    )
  )

  (:action advance_athens_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at athens)
      (visited athens ?d1)
      (need_athens_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_athens_5))
      (need_athens_6)
    )
  )

  (:action advance_athens_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at athens)
      (visited athens ?d1)
      (need_athens_6)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_athens_6))
      (need_athens_7)
    )
  )

  (:action advance_athens_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at athens)
      (visited athens ?d1)
      (need_athens_7)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_athens_7))
    )
  )

  (:action advance_krakow_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (visited krakow ?d1)
      (need_krakow_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_krakow_1))
      (need_krakow_2)
    )
  )

  (:action advance_krakow_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (visited krakow ?d1)
      (need_krakow_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_krakow_2))
      (need_krakow_3)
    )
  )

  (:action advance_krakow_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (visited krakow ?d1)
      (need_krakow_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_krakow_3))
      (need_krakow_4)
    )
  )

  (:action advance_krakow_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (visited krakow ?d1)
      (need_krakow_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_krakow_4))
      (need_krakow_5)
    )
  )

  (:action advance_krakow_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (visited krakow ?d1)
      (need_krakow_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_krakow_5))
      (need_krakow_6)
    )
  )

  (:action advance_krakow_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (visited krakow ?d1)
      (need_krakow_6)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_krakow_6))
    )
  )

  (:action advance_zurich_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at zurich)
      (visited zurich ?d1)
      (need_zurich_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_zurich_1))
      (need_zurich_2)
    )
  )

  (:action advance_zurich_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at zurich)
      (visited zurich ?d1)
      (need_zurich_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_zurich_2))
      (need_zurich_3)
    )
  )

  (:action advance_zurich_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at zurich)
      (visited zurich ?d1)
      (need_zurich_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_zurich_3))
      (need_zurich_4)
    )
  )

  (:action advance_zurich_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at zurich)
      (visited zurich ?d1)
      (need_zurich_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_zurich_4))
      (need_zurich_5)
    )
  )

  (:action advance_zurich_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at zurich)
      (visited zurich ?d1)
      (need_zurich_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (need_zurich_5))
    )
  )

  (:action fly_athens_to_zurich
    :parameters ()
    :precondition (and
      (at athens)
      (direct athens zurich)
      (current_day d8)
      (not (need_athens_1))
      (not (need_athens_2))
      (not (need_athens_3))
      (not (need_athens_4))
      (not (need_athens_5))
      (not (need_athens_6))
      (not (need_athens_7))
    )
    :effect (and
      (not (at athens))
      (at zurich)
    )
  )

  (:action fly_zurich_to_krakow
    :parameters ()
    :precondition (and
      (at zurich)
      (direct zurich krakow)
      (not (need_zurich_1))
      (not (need_zurich_2))
      (not (need_zurich_3))
      (not (need_zurich_4))
      (not (need_zurich_5))
    )
    :effect (and
      (not (at zurich))
      (at krakow)
    )
  )

  (:action finish_trip
    :parameters ()
    :precondition (and
      (current_day d16)
      (visited krakow d16)
      (not (need_athens_1))
      (not (need_athens_2))
      (not (need_athens_3))
      (not (need_athens_4))
      (not (need_athens_5))
      (not (need_athens_6))
      (not (need_athens_7))
      (not (need_krakow_1))
      (not (need_krakow_2))
      (not (need_krakow_3))
      (not (need_krakow_4))
      (not (need_krakow_5))
      (not (need_krakow_6))
      (not (need_zurich_1))
      (not (need_zurich_2))
      (not (need_zurich_3))
      (not (need_zurich_4))
      (not (need_zurich_5))
    )
    :effect (trip_finished)
  )
)