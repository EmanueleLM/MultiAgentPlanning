(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city)
  (:predicates
    (at ?c - city)
    (connected ?c1 ?c2 - city)
    (friend_met)
  )
  (:fluents
    (current-day)
    (days-in-berlin)
    (days-in-warsaw)
    (days-in-bucharest)
  )

  ;; Action to fly between cities
  (:action fly)
    :parameters (?from ?to - city)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )

  ;; Action to stay in Berlin for a day
  (:action stay-in-berlin)
    :parameters ()
    :precondition (and
      (at berlin)
      (< (current-day) 6) ; Cannot stay if current day is already 6 (i.e., Day 6 has passed)
    )
    :effect (and
      (increase (current-day) 1)
      (increase (days-in-berlin) 1)
    )

  ;; Action to stay in Warsaw for a day
  (:action stay-in-warsaw)
    :parameters ()
    :precondition (and
      (at warsaw)
      (< (current-day) 6)
    )
    :effect (and
      (increase (current-day) 1)
      (increase (days-in-warsaw) 1)
    )

  ;; Action to stay in Bucharest for a day
  (:action stay-in-bucharest)
    :parameters ()
    :precondition (and
      (at bucharest)
      (< (current-day) 6)
    )
    :effect (and
      (increase (current-day) 1)
      (increase (days-in-bucharest) 1)
    )

  ;; Action to meet a friend in Bucharest
  (:action meet-friend-in-bucharest)
    :parameters ()
    :precondition (and
      (at bucharest)
      (>= (current-day) 4) ; Meeting can occur on Day 5 (current-day becomes 4 after Day 4 stay)
      (<= (current-day) 5) ; or Day 6 (current-day becomes 5 after Day 5 stay)
      (not (friend_met))
    )
    :effect (and
      (friend_met)
    )
)