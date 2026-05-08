(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types city)
  (:predicates
    (at ?c - city)
    (connected ?c1 ?c2 - city)
    (friend_met)
  )
  (:functions
    (current-day)
    (days-in-berlin)
    (days-in-warsaw)
    (days-in-bucharest)
    (total-cost)
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
      (< (current-day) 6)
    )
    :effect (and
      (increase (current-day) 1)
      (increase (days-in-berlin) 1)
      (increase (total-cost) 1)
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
      (increase (total-cost) 1)
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
      (increase (total-cost) 1)
    )

  ;; Action to meet a friend in Bucharest
  (:action meet-friend-in-bucharest)
    :parameters ()
    :precondition (and
      (at bucharest)
      (>= (current-day) 4) ; Meeting can occur on Day 5 (when current-day is 4, meaning 4 days have passed)
      (<= (current-day) 5) ; or Day 6 (when current-day is 5, meaning 5 days have passed)
      (not (friend_met))
    )
    :effect (and
      (friend_met)
    )
)