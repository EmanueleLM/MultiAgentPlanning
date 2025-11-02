(define (domain TripPlanningExample18)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day quota)
  (:constants
    Amsterdam Vilnius Bucharest - city
  )
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (assigned ?d - day)
    (visited ?c - city)
    (quota_for ?q - quota ?c - city)
    (available ?q - quota)
    (used ?q - quota)
    (in_window ?d - day)
    (met_friends)
  )

  (:action assign_day1
    :parameters (?c - city ?d - day ?q - quota)
    :precondition (and
      (at ?c ?d)
      (not (assigned ?d))
      (available ?q)
      (quota_for ?q ?c)
    )
    :effect (and
      (assigned ?d)
      (used ?q)
      (not (available ?q))
      (visited ?c)
    )
  )

  (:action stay_step
    :parameters (?c - city ?d - day ?dn - day ?q - quota)
    :precondition (and
      (at ?c ?d)
      (next ?d ?dn)
      (assigned ?d)
      (not (assigned ?dn))
      (available ?q)
      (quota_for ?q ?c)
    )
    :effect (and
      (at ?c ?dn)
      (assigned ?dn)
      (used ?q)
      (not (available ?q))
      (visited ?c)
    )
  )

  (:action fly_step
    :parameters (?c - city ?c2 - city ?d - day ?dn - day ?q - quota)
    :precondition (and
      (at ?c ?d)
      (next ?d ?dn)
      (assigned ?d)
      (not (assigned ?dn))
      (direct ?c ?c2)
      (available ?q)
      (quota_for ?q ?c2)
    )
    :effect (and
      (at ?c2 ?dn)
      (assigned ?dn)
      (used ?q)
      (not (available ?q))
      (visited ?c2)
    )
  )

  (:action meet_friends_on_day
    :parameters (?d - day)
    :precondition (and
      (in_window ?d)
      (at Bucharest ?d)
      (not (met_friends))
    )
    :effect (and
      (met_friends)
    )
  )
)