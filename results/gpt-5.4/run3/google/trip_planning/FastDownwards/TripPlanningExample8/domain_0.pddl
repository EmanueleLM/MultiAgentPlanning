(define (domain european_trip_16_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (spent_in ?d - day ?c - city)
    (athens_window_day ?d - day)

    (athens_need_7)
    (athens_need_6)
    (athens_need_5)
    (athens_need_4)
    (athens_need_3)
    (athens_need_2)
    (athens_need_1)

    (zurich_need_5)
    (zurich_need_4)
    (zurich_need_3)
    (zurich_need_2)
    (zurich_need_1)

    (krakow_need_6)
    (krakow_need_5)
    (krakow_need_4)
    (krakow_need_3)
    (krakow_need_2)
    (krakow_need_1)
  )

  ;; athens actions, allowed on any day

  (:action spend_athens_stay_7
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (athens_need_7))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (athens_need_7))
      (athens_need_6))
  )

  (:action spend_athens_stay_6
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (athens_need_6))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (athens_need_6))
      (athens_need_5))
  )

  (:action spend_athens_stay_5
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (athens_need_5))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (athens_need_5))
      (athens_need_4))
  )

  (:action spend_athens_stay_4
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (athens_need_4))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (athens_need_4))
      (athens_need_3))
  )

  (:action spend_athens_stay_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (athens_need_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (athens_need_3))
      (athens_need_2))
  )

  (:action spend_athens_stay_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (athens_need_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (athens_need_2))
      (athens_need_1))
  )

  (:action spend_athens_stay_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (athens_need_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (athens_need_1)))
  )

  (:action spend_athens_fly_zurich_7
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (direct_flight athens zurich)
      (athens_need_7))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (at athens))
      (at zurich)
      (not (athens_need_7))
      (athens_need_6))
  )

  (:action spend_athens_fly_zurich_6
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (direct_flight athens zurich)
      (athens_need_6))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (at athens))
      (at zurich)
      (not (athens_need_6))
      (athens_need_5))
  )

  (:action spend_athens_fly_zurich_5
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (direct_flight athens zurich)
      (athens_need_5))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (at athens))
      (at zurich)
      (not (athens_need_5))
      (athens_need_4))
  )

  (:action spend_athens_fly_zurich_4
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (direct_flight athens zurich)
      (athens_need_4))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (at athens))
      (at zurich)
      (not (athens_need_4))
      (athens_need_3))
  )

  (:action spend_athens_fly_zurich_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (direct_flight athens zurich)
      (athens_need_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (at athens))
      (at zurich)
      (not (athens_need_3))
      (athens_need_2))
  )

  (:action spend_athens_fly_zurich_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (direct_flight athens zurich)
      (athens_need_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (at athens))
      (at zurich)
      (not (athens_need_2))
      (athens_need_1))
  )

  (:action spend_athens_fly_zurich_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at athens)
      (direct_flight athens zurich)
      (athens_need_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d athens)
      (not (at athens))
      (at zurich)
      (not (athens_need_1)))
  )

  ;; zurich actions, forbidden on athens window days

  (:action spend_zurich_stay_5
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (zurich_need_5)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (zurich_need_5))
      (zurich_need_4))
  )

  (:action spend_zurich_stay_4
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (zurich_need_4)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (zurich_need_4))
      (zurich_need_3))
  )

  (:action spend_zurich_stay_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (zurich_need_3)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (zurich_need_3))
      (zurich_need_2))
  )

  (:action spend_zurich_stay_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (zurich_need_2)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (zurich_need_2))
      (zurich_need_1))
  )

  (:action spend_zurich_stay_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (zurich_need_1)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (zurich_need_1)))
  )

  (:action spend_zurich_fly_athens_5
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (direct_flight zurich athens)
      (zurich_need_5)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (at zurich))
      (at athens)
      (not (zurich_need_5))
      (zurich_need_4))
  )

  (:action spend_zurich_fly_athens_4
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (direct_flight zurich athens)
      (zurich_need_4)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (at zurich))
      (at athens)
      (not (zurich_need_4))
      (zurich_need_3))
  )

  (:action spend_zurich_fly_athens_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (direct_flight zurich athens)
      (zurich_need_3)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (at zurich))
      (at athens)
      (not (zurich_need_3))
      (zurich_need_2))
  )

  (:action spend_zurich_fly_athens_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (direct_flight zurich athens)
      (zurich_need_2)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (at zurich))
      (at athens)
      (not (zurich_need_2))
      (zurich_need_1))
  )

  (:action spend_zurich_fly_athens_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (direct_flight zurich athens)
      (zurich_need_1)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (at zurich))
      (at athens)
      (not (zurich_need_1)))
  )

  (:action spend_zurich_fly_krakow_5
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (direct_flight zurich krakow)
      (zurich_need_5)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (at zurich))
      (at krakow)
      (not (zurich_need_5))
      (zurich_need_4))
  )

  (:action spend_zurich_fly_krakow_4
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (direct_flight zurich krakow)
      (zurich_need_4)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (at zurich))
      (at krakow)
      (not (zurich_need_4))
      (zurich_need_3))
  )

  (:action spend_zurich_fly_krakow_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (direct_flight zurich krakow)
      (zurich_need_3)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (at zurich))
      (at krakow)
      (not (zurich_need_3))
      (zurich_need_2))
  )

  (:action spend_zurich_fly_krakow_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (direct_flight zurich krakow)
      (zurich_need_2)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (at zurich))
      (at krakow)
      (not (zurich_need_2))
      (zurich_need_1))
  )

  (:action spend_zurich_fly_krakow_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at zurich)
      (direct_flight zurich krakow)
      (zurich_need_1)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d zurich)
      (not (at zurich))
      (at krakow)
      (not (zurich_need_1)))
  )

  ;; krakow actions, forbidden on athens window days

  (:action spend_krakow_stay_6
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (krakow_need_6)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (krakow_need_6))
      (krakow_need_5))
  )

  (:action spend_krakow_stay_5
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (krakow_need_5)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (krakow_need_5))
      (krakow_need_4))
  )

  (:action spend_krakow_stay_4
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (krakow_need_4)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (krakow_need_4))
      (krakow_need_3))
  )

  (:action spend_krakow_stay_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (krakow_need_3)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (krakow_need_3))
      (krakow_need_2))
  )

  (:action spend_krakow_stay_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (krakow_need_2)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (krakow_need_2))
      (krakow_need_1))
  )

  (:action spend_krakow_stay_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (krakow_need_1)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (krakow_need_1)))
  )

  (:action spend_krakow_fly_zurich_6
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (direct_flight krakow zurich)
      (krakow_need_6)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (at krakow))
      (at zurich)
      (not (krakow_need_6))
      (krakow_need_5))
  )

  (:action spend_krakow_fly_zurich_5
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (direct_flight krakow zurich)
      (krakow_need_5)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (at krakow))
      (at zurich)
      (not (krakow_need_5))
      (krakow_need_4))
  )

  (:action spend_krakow_fly_zurich_4
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (direct_flight krakow zurich)
      (krakow_need_4)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (at krakow))
      (at zurich)
      (not (krakow_need_4))
      (krakow_need_3))
  )

  (:action spend_krakow_fly_zurich_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (direct_flight krakow zurich)
      (krakow_need_3)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (at krakow))
      (at zurich)
      (not (krakow_need_3))
      (krakow_need_2))
  )

  (:action spend_krakow_fly_zurich_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (direct_flight krakow zurich)
      (krakow_need_2)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (at krakow))
      (at zurich)
      (not (krakow_need_2))
      (krakow_need_1))
  )

  (:action spend_krakow_fly_zurich_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at krakow)
      (direct_flight krakow zurich)
      (krakow_need_1)
      (not (athens_window_day ?d)))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (spent_in ?d krakow)
      (not (at krakow))
      (at zurich)
      (not (krakow_need_1)))
  )
)