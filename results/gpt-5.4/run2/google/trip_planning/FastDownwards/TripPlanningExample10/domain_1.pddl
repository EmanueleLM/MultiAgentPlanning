(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day count3 count5)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (final_day ?d - day)

    (direct_flight ?from - city ?to - city)

    (counted ?d - day)
    (stayed_in ?d - day ?c - city)

    (next_count3 ?c1 - count3 ?c2 - count3)
    (next_count5 ?c1 - count5 ?c2 - count5)

    (oslo_days ?n - count3)
    (dublin_days ?n - count3)
    (valencia_days ?n - count5)

    (relative_window ?d - day)
    (visited_relatives)

    (trip_complete)
  )

  (:action stay
    :parameters (?from - day ?to - day ?c - city ?o1 ?o2 - count3 ?d1 ?d2 - count3 ?v1 ?v2 - count5)
    :precondition
      (and
        (current_day ?from)
        (next_day ?from ?to)
        (at ?c)
        (not (counted ?from))
        (not (final_day ?from))
        (not (trip_complete))

        (or_dummy_false)
      )
    :effect
      (and)
  )

  (:action stay_oslo
    :parameters (?from - day ?to - day ?n1 ?n2 - count3)
    :precondition
      (and
        (current_day ?from)
        (next_day ?from ?to)
        (at oslo)
        (oslo_days ?n1)
        (next_count3 ?n1 ?n2)
        (not (counted ?from))
        (not (final_day ?from))
        (not (trip_complete))
      )
    :effect
      (and
        (stayed_in ?from oslo)
        (counted ?from)
        (not (current_day ?from))
        (current_day ?to)
        (not (oslo_days ?n1))
        (oslo_days ?n2)
      )
  )

  (:action stay_dublin
    :parameters (?from - day ?to - day ?n1 ?n2 - count3)
    :precondition
      (and
        (current_day ?from)
        (next_day ?from ?to)
        (at dublin)
        (dublin_days ?n1)
        (next_count3 ?n1 ?n2)
        (not (counted ?from))
        (not (final_day ?from))
        (not (trip_complete))
      )
    :effect
      (and
        (stayed_in ?from dublin)
        (counted ?from)
        (not (current_day ?from))
        (current_day ?to)
        (not (dublin_days ?n1))
        (dublin_days ?n2)
      )
  )

  (:action stay_valencia
    :parameters (?from - day ?to - day ?n1 ?n2 - count5)
    :precondition
      (and
        (current_day ?from)
        (next_day ?from ?to)
        (at valencia)
        (valencia_days ?n1)
        (next_count5 ?n1 ?n2)
        (not (counted ?from))
        (not (final_day ?from))
        (not (trip_complete))
      )
    :effect
      (and
        (stayed_in ?from valencia)
        (counted ?from)
        (not (current_day ?from))
        (current_day ?to)
        (not (valencia_days ?n1))
        (valencia_days ?n2)
      )
  )

  (:action stay_valencia_and_visit_relatives
    :parameters (?from - day ?to - day ?n1 ?n2 - count5)
    :precondition
      (and
        (current_day ?from)
        (next_day ?from ?to)
        (at valencia)
        (valencia_days ?n1)
        (next_count5 ?n1 ?n2)
        (relative_window ?from)
        (not (counted ?from))
        (not (final_day ?from))
        (not (trip_complete))
        (not (visited_relatives))
      )
    :effect
      (and
        (stayed_in ?from valencia)
        (counted ?from)
        (visited_relatives)
        (not (current_day ?from))
        (current_day ?to)
        (not (valencia_days ?n1))
        (valencia_days ?n2)
      )
  )

  (:action fly_oslo_dublin
    :parameters ()
    :precondition
      (and
        (at oslo)
        (direct_flight oslo dublin)
        (not (trip_complete))
      )
    :effect
      (and
        (not (at oslo))
        (at dublin)
      )
  )

  (:action fly_dublin_oslo
    :parameters ()
    :precondition
      (and
        (at dublin)
        (direct_flight dublin oslo)
        (not (trip_complete))
      )
    :effect
      (and
        (not (at dublin))
        (at oslo)
      )
  )

  (:action fly_dublin_valencia
    :parameters ()
    :precondition
      (and
        (at dublin)
        (direct_flight dublin valencia)
        (not (trip_complete))
      )
    :effect
      (and
        (not (at dublin))
        (at valencia)
      )
  )

  (:action fly_valencia_dublin
    :parameters ()
    :precondition
      (and
        (at valencia)
        (direct_flight valencia dublin)
        (not (trip_complete))
      )
    :effect
      (and
        (not (at valencia))
        (at dublin)
      )
  )

  (:action finish_oslo
    :parameters (?d - day ?n1 ?n2 - count3)
    :precondition
      (and
        (current_day ?d)
        (final_day ?d)
        (at oslo)
        (oslo_days ?n1)
        (next_count3 ?n1 ?n2)
        (not (counted ?d))
        (not (trip_complete))
      )
    :effect
      (and
        (stayed_in ?d oslo)
        (counted ?d)
        (trip_complete)
        (not (current_day ?d))
        (not (oslo_days ?n1))
        (oslo_days ?n2)
      )
  )

  (:action finish_dublin
    :parameters (?d - day ?n1 ?n2 - count3)
    :precondition
      (and
        (current_day ?d)
        (final_day ?d)
        (at dublin)
        (dublin_days ?n1)
        (next_count3 ?n1 ?n2)
        (not (counted ?d))
        (not (trip_complete))
      )
    :effect
      (and
        (stayed_in ?d dublin)
        (counted ?d)
        (trip_complete)
        (not (current_day ?d))
        (not (dublin_days ?n1))
        (dublin_days ?n2)
      )
  )

  (:action finish_valencia
    :parameters (?d - day ?n1 ?n2 - count5)
    :precondition
      (and
        (current_day ?d)
        (final_day ?d)
        (at valencia)
        (valencia_days ?n1)
        (next_count5 ?n1 ?n2)
        (not (counted ?d))
        (not (trip_complete))
      )
    :effect
      (and
        (stayed_in ?d valencia)
        (counted ?d)
        (trip_complete)
        (not (current_day ?d))
        (not (valencia_days ?n1))
        (valencia_days ?n2)
      )
  )

  (:action finish_valencia_and_visit_relatives
    :parameters (?d - day ?n1 ?n2 - count5)
    :precondition
      (and
        (current_day ?d)
        (final_day ?d)
        (at valencia)
        (valencia_days ?n1)
        (next_count5 ?n1 ?n2)
        (relative_window ?d)
        (not (counted ?d))
        (not (trip_complete))
        (not (visited_relatives))
      )
    :effect
      (and
        (stayed_in ?d valencia)
        (counted ?d)
        (visited_relatives)
        (trip_complete)
        (not (current_day ?d))
        (not (valencia_days ?n1))
        (valencia_days ?n2)
      )
  )
)