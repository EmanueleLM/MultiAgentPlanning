(define (domain trip_planning_example16)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (used_day ?d - day)

    (workshop_day ?d - day)
    (attended_workshop)

    (prague_days_0)
    (prague_days_1)
    (prague_days_2)
    (prague_days_3)

    (vienna_days_0)
    (vienna_days_1)
    (vienna_days_2)
    (vienna_days_3)

    (porto_days_0)
    (porto_days_1)
    (porto_days_2)
    (porto_days_3)
    (porto_days_4)
    (porto_days_5)
  )

  (:action stay_prague_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (not (used_day ?d)) (prague_days_0))
    :effect (and
      (used_day ?d) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_0)) (prague_days_1))
  )

  (:action stay_prague_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (not (used_day ?d)) (prague_days_1))
    :effect (and
      (used_day ?d) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_1)) (prague_days_2))
  )

  (:action stay_prague_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (not (used_day ?d)) (prague_days_2))
    :effect (and
      (used_day ?d) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_2)) (prague_days_3))
  )

  (:action stay_prague_workshop_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (workshop_day ?d)
      (not (used_day ?d)) (not (attended_workshop)) (prague_days_0))
    :effect (and
      (used_day ?d) (attended_workshop) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_0)) (prague_days_1))
  )

  (:action stay_prague_workshop_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (workshop_day ?d)
      (not (used_day ?d)) (not (attended_workshop)) (prague_days_1))
    :effect (and
      (used_day ?d) (attended_workshop) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_1)) (prague_days_2))
  )

  (:action stay_prague_workshop_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (workshop_day ?d)
      (not (used_day ?d)) (not (attended_workshop)) (prague_days_2))
    :effect (and
      (used_day ?d) (attended_workshop) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_2)) (prague_days_3))
  )

  (:action stay_vienna_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (not (used_day ?d)) (vienna_days_0))
    :effect (and
      (used_day ?d) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_0)) (vienna_days_1))
  )

  (:action stay_vienna_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (not (used_day ?d)) (vienna_days_1))
    :effect (and
      (used_day ?d) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_1)) (vienna_days_2))
  )

  (:action stay_vienna_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (not (used_day ?d)) (vienna_days_2))
    :effect (and
      (used_day ?d) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_2)) (vienna_days_3))
  )

  (:action stay_porto_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at porto) (not (used_day ?d)) (porto_days_0))
    :effect (and
      (used_day ?d) (not (current_day ?d)) (current_day ?n)
      (not (porto_days_0)) (porto_days_1))
  )

  (:action stay_porto_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at porto) (not (used_day ?d)) (porto_days_1))
    :effect (and
      (used_day ?d) (not (current_day ?d)) (current_day ?n)
      (not (porto_days_1)) (porto_days_2))
  )

  (:action stay_porto_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at porto) (not (used_day ?d)) (porto_days_2))
    :effect (and
      (used_day ?d) (not (current_day ?d)) (current_day ?n)
      (not (porto_days_2)) (porto_days_3))
  )

  (:action stay_porto_3
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at porto) (not (used_day ?d)) (porto_days_3))
    :effect (and
      (used_day ?d) (not (current_day ?d)) (current_day ?n)
      (not (porto_days_3)) (porto_days_4))
  )

  (:action stay_porto_4
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at porto) (not (used_day ?d)) (porto_days_4))
    :effect (and
      (used_day ?d) (not (current_day ?d)) (current_day ?n)
      (not (porto_days_4)) (porto_days_5))
  )

  (:action fly_prague_to_vienna_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (direct_flight prague vienna)
      (not (used_day ?d)) (vienna_days_0))
    :effect (and
      (used_day ?d) (not (at prague)) (at vienna) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_0)) (vienna_days_1))
  )

  (:action fly_prague_to_vienna_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (direct_flight prague vienna)
      (not (used_day ?d)) (vienna_days_1))
    :effect (and
      (used_day ?d) (not (at prague)) (at vienna) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_1)) (vienna_days_2))
  )

  (:action fly_prague_to_vienna_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (direct_flight prague vienna)
      (not (used_day ?d)) (vienna_days_2))
    :effect (and
      (used_day ?d) (not (at prague)) (at vienna) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_2)) (vienna_days_3))
  )

  (:action fly_prague_to_vienna_workshop_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (direct_flight prague vienna) (workshop_day ?d)
      (not (used_day ?d)) (not (attended_workshop)) (vienna_days_0))
    :effect (and
      (used_day ?d) (attended_workshop) (not (at prague)) (at vienna) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_0)) (vienna_days_1))
  )

  (:action fly_prague_to_vienna_workshop_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (direct_flight prague vienna) (workshop_day ?d)
      (not (used_day ?d)) (not (attended_workshop)) (vienna_days_1))
    :effect (and
      (used_day ?d) (attended_workshop) (not (at prague)) (at vienna) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_1)) (vienna_days_2))
  )

  (:action fly_prague_to_vienna_workshop_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at prague) (direct_flight prague vienna) (workshop_day ?d)
      (not (used_day ?d)) (not (attended_workshop)) (vienna_days_2))
    :effect (and
      (used_day ?d) (attended_workshop) (not (at prague)) (at vienna) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_2)) (vienna_days_3))
  )

  (:action fly_vienna_to_prague_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (direct_flight vienna prague)
      (not (used_day ?d)) (prague_days_0))
    :effect (and
      (used_day ?d) (not (at vienna)) (at prague) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_0)) (prague_days_1))
  )

  (:action fly_vienna_to_prague_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (direct_flight vienna prague)
      (not (used_day ?d)) (prague_days_1))
    :effect (and
      (used_day ?d) (not (at vienna)) (at prague) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_1)) (prague_days_2))
  )

  (:action fly_vienna_to_prague_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (direct_flight vienna prague)
      (not (used_day ?d)) (prague_days_2))
    :effect (and
      (used_day ?d) (not (at vienna)) (at prague) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_2)) (prague_days_3))
  )

  (:action fly_vienna_to_prague_workshop_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (direct_flight vienna prague) (workshop_day ?d)
      (not (used_day ?d)) (not (attended_workshop)) (prague_days_0))
    :effect (and
      (used_day ?d) (attended_workshop) (not (at vienna)) (at prague) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_0)) (prague_days_1))
  )

  (:action fly_vienna_to_prague_workshop_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (direct_flight vienna prague) (workshop_day ?d)
      (not (used_day ?d)) (not (attended_workshop)) (prague_days_1))
    :effect (and
      (used_day ?d) (attended_workshop) (not (at vienna)) (at prague) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_1)) (prague_days_2))
  )

  (:action fly_vienna_to_prague_workshop_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (direct_flight vienna prague) (workshop_day ?d)
      (not (used_day ?d)) (not (attended_workshop)) (prague_days_2))
    :effect (and
      (used_day ?d) (attended_workshop) (not (at vienna)) (at prague) (not (current_day ?d)) (current_day ?n)
      (not (prague_days_2)) (prague_days_3))
  )

  (:action fly_vienna_to_porto_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (direct_flight vienna porto)
      (not (used_day ?d)) (porto_days_0))
    :effect (and
      (used_day ?d) (not (at vienna)) (at porto) (not (current_day ?d)) (current_day ?n)
      (not (porto_days_0)) (porto_days_1))
  )

  (:action fly_vienna_to_porto_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (direct_flight vienna porto)
      (not (used_day ?d)) (porto_days_1))
    :effect (and
      (used_day ?d) (not (at vienna)) (at porto) (not (current_day ?d)) (current_day ?n)
      (not (porto_days_1)) (porto_days_2))
  )

  (:action fly_vienna_to_porto_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (direct_flight vienna porto)
      (not (used_day ?d)) (porto_days_2))
    :effect (and
      (used_day ?d) (not (at vienna)) (at porto) (not (current_day ?d)) (current_day ?n)
      (not (porto_days_2)) (porto_days_3))
  )

  (:action fly_vienna_to_porto_3
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (direct_flight vienna porto)
      (not (used_day ?d)) (porto_days_3))
    :effect (and
      (used_day ?d) (not (at vienna)) (at porto) (not (current_day ?d)) (current_day ?n)
      (not (porto_days_3)) (porto_days_4))
  )

  (:action fly_vienna_to_porto_4
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at vienna) (direct_flight vienna porto)
      (not (used_day ?d)) (porto_days_4))
    :effect (and
      (used_day ?d) (not (at vienna)) (at porto) (not (current_day ?d)) (current_day ?n)
      (not (porto_days_4)) (porto_days_5))
  )

  (:action fly_porto_to_vienna_0
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at porto) (direct_flight porto vienna)
      (not (used_day ?d)) (vienna_days_0))
    :effect (and
      (used_day ?d) (not (at porto)) (at vienna) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_0)) (vienna_days_1))
  )

  (:action fly_porto_to_vienna_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at porto) (direct_flight porto vienna)
      (not (used_day ?d)) (vienna_days_1))
    :effect (and
      (used_day ?d) (not (at porto)) (at vienna) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_1)) (vienna_days_2))
  )

  (:action fly_porto_to_vienna_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d) (next_day ?d ?n) (at porto) (direct_flight porto vienna)
      (not (used_day ?d)) (vienna_days_2))
    :effect (and
      (used_day ?d) (not (at porto)) (at vienna) (not (current_day ?d)) (current_day ?n)
      (not (vienna_days_2)) (vienna_days_3))
  )

  (:action last_stay_prague_0
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at prague) (not (used_day ?d)) (prague_days_0))
    :effect (and
      (used_day ?d) (not (prague_days_0)) (prague_days_1))
  )

  (:action last_stay_prague_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at prague) (not (used_day ?d)) (prague_days_1))
    :effect (and
      (used_day ?d) (not (prague_days_1)) (prague_days_2))
  )

  (:action last_stay_prague_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at prague) (not (used_day ?d)) (prague_days_2))
    :effect (and
      (used_day ?d) (not (prague_days_2)) (prague_days_3))
  )

  (:action last_stay_vienna_0
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at vienna) (not (used_day ?d)) (vienna_days_0))
    :effect (and
      (used_day ?d) (not (vienna_days_0)) (vienna_days_1))
  )

  (:action last_stay_vienna_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at vienna) (not (used_day ?d)) (vienna_days_1))
    :effect (and
      (used_day ?d) (not (vienna_days_1)) (vienna_days_2))
  )

  (:action last_stay_vienna_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at vienna) (not (used_day ?d)) (vienna_days_2))
    :effect (and
      (used_day ?d) (not (vienna_days_2)) (vienna_days_3))
  )

  (:action last_stay_porto_0
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at porto) (not (used_day ?d)) (porto_days_0))
    :effect (and
      (used_day ?d) (not (porto_days_0)) (porto_days_1))
  )

  (:action last_stay_porto_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at porto) (not (used_day ?d)) (porto_days_1))
    :effect (and
      (used_day ?d) (not (porto_days_1)) (porto_days_2))
  )

  (:action last_stay_porto_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at porto) (not (used_day ?d)) (porto_days_2))
    :effect (and
      (used_day ?d) (not (porto_days_2)) (porto_days_3))
  )

  (:action last_stay_porto_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at porto) (not (used_day ?d)) (porto_days_3))
    :effect (and
      (used_day ?d) (not (porto_days_3)) (porto_days_4))
  )

  (:action last_stay_porto_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at porto) (not (used_day ?d)) (porto_days_4))
    :effect (and
      (used_day ?d) (not (porto_days_4)) (porto_days_5))
  )

  (:action last_fly_prague_to_vienna_0
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at prague) (direct_flight prague vienna)
      (not (used_day ?d)) (vienna_days_0))
    :effect (and
      (used_day ?d) (not (at prague)) (at vienna)
      (not (vienna_days_0)) (vienna_days_1))
  )

  (:action last_fly_prague_to_vienna_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at prague) (direct_flight prague vienna)
      (not (used_day ?d)) (vienna_days_1))
    :effect (and
      (used_day ?d) (not (at prague)) (at vienna)
      (not (vienna_days_1)) (vienna_days_2))
  )

  (:action last_fly_prague_to_vienna_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at prague) (direct_flight prague vienna)
      (not (used_day ?d)) (vienna_days_2))
    :effect (and
      (used_day ?d) (not (at prague)) (at vienna)
      (not (vienna_days_2)) (vienna_days_3))
  )

  (:action last_fly_vienna_to_prague_0
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at vienna) (direct_flight vienna prague)
      (not (used_day ?d)) (prague_days_0))
    :effect (and
      (used_day ?d) (not (at vienna)) (at prague)
      (not (prague_days_0)) (prague_days_1))
  )

  (:action last_fly_vienna_to_prague_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at vienna) (direct_flight vienna prague)
      (not (used_day ?d)) (prague_days_1))
    :effect (and
      (used_day ?d) (not (at vienna)) (at prague)
      (not (prague_days_1)) (prague_days_2))
  )

  (:action last_fly_vienna_to_prague_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at vienna) (direct_flight vienna prague)
      (not (used_day ?d)) (prague_days_2))
    :effect (and
      (used_day ?d) (not (at vienna)) (at prague)
      (not (prague_days_2)) (prague_days_3))
  )

  (:action last_fly_vienna_to_porto_0
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at vienna) (direct_flight vienna porto)
      (not (used_day ?d)) (porto_days_0))
    :effect (and
      (used_day ?d) (not (at vienna)) (at porto)
      (not (porto_days_0)) (porto_days_1))
  )

  (:action last_fly_vienna_to_porto_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at vienna) (direct_flight vienna porto)
      (not (used_day ?d)) (porto_days_1))
    :effect (and
      (used_day ?d) (not (at vienna)) (at porto)
      (not (porto_days_1)) (porto_days_2))
  )

  (:action last_fly_vienna_to_porto_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at vienna) (direct_flight vienna porto)
      (not (used_day ?d)) (porto_days_2))
    :effect (and
      (used_day ?d) (not (at vienna)) (at porto)
      (not (porto_days_2)) (porto_days_3))
  )

  (:action last_fly_vienna_to_porto_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at vienna) (direct_flight vienna porto)
      (not (used_day ?d)) (porto_days_3))
    :effect (and
      (used_day ?d) (not (at vienna)) (at porto)
      (not (porto_days_3)) (porto_days_4))
  )

  (:action last_fly_vienna_to_porto_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at vienna) (direct_flight vienna porto)
      (not (used_day ?d)) (porto_days_4))
    :effect (and
      (used_day ?d) (not (at vienna)) (at porto)
      (not (porto_days_4)) (porto_days_5))
  )

  (:action last_fly_porto_to_vienna_0
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at porto) (direct_flight porto vienna)
      (not (used_day ?d)) (vienna_days_0))
    :effect (and
      (used_day ?d) (not (at porto)) (at vienna)
      (not (vienna_days_0)) (vienna_days_1))
  )

  (:action last_fly_porto_to_vienna_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at porto) (direct_flight porto vienna)
      (not (used_day ?d)) (vienna_days_1))
    :effect (and
      (used_day ?d) (not (at porto)) (at vienna)
      (not (vienna_days_1)) (vienna_days_2))
  )

  (:action last_fly_porto_to_vienna_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d) (last_day ?d) (at porto) (direct_flight porto vienna)
      (not (used_day ?d)) (vienna_days_2))
    :effect (and
      (used_day ?d) (not (at porto)) (at vienna)
      (not (vienna_days_2)) (vienna_days_3))
  )
)