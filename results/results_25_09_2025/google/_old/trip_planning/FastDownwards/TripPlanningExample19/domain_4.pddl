(define (domain orchestrated_trip)
  (:requirements :strips :typing :negative-preconditions :action-costs :equality)
  (:types city day number)

  (:predicates
    (in ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (occupied ?d - day)
    (meeting-allowed ?d - day)
    (is-nice ?c - city)
    (met-friends)
    (city-count ?c - city ?n - number)
    (total-count ?n - number)
    (succ ?n1 - number ?n2 - number)
  )

  (:functions
    (total-cost)
  )

  (:action assign-day-stay
    :parameters (?c - city ?d1 - day ?d2 - day ?curCityN - number ?nextCityN - number ?curTotalN - number ?nextTotalN - number)
    :precondition (and
      (in ?c ?d1)
      (next ?d1 ?d2)
      (not (occupied ?d2))
      (city-count ?c ?curCityN)
      (succ ?curCityN ?nextCityN)
      (total-count ?curTotalN)
      (succ ?curTotalN ?nextTotalN)
    )
    :effect (and
      (in ?c ?d2)
      (occupied ?d2)
      (not (city-count ?c ?curCityN))
      (city-count ?c ?nextCityN)
      (not (total-count ?curTotalN))
      (total-count ?nextTotalN)
      (increase (total-cost) 1)
    )
  )

  (:action assign-day-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?curToN - number ?nextToN - number ?curTotalN - number ?nextTotalN - number)
    :precondition (and
      (in ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (occupied ?d2))
      (city-count ?to ?curToN)
      (succ ?curToN ?nextToN)
      (total-count ?curTotalN)
      (succ ?curTotalN ?nextTotalN)
    )
    :effect (and
      (in ?to ?d2)
      (occupied ?d2)
      (not (city-count ?to ?curToN))
      (city-count ?to ?nextToN)
      (not (total-count ?curTotalN))
      (total-count ?nextTotalN)
      (increase (total-cost) 1)
    )
  )

  (:action meet-friends-in-nice
    :parameters (?c - city ?d - day)
    :precondition (and
      (in ?c ?d)
      (is-nice ?c)
      (meeting-allowed ?d)
      (not (met-friends))
    )
    :effect (and
      (met-friends)
    )
  )
)