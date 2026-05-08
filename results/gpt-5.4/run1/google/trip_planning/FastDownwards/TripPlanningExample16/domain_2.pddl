(define (domain trip_planning_example16)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (in ?c - city)
    (direct ?from - city ?to - city)

    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (last ?d - day)

    (workshop_day ?d - day)
    (workshop_attended)

    (need_prague_3)
    (need_prague_2)
    (need_prague_1)
    (done_prague)

    (need_vienna_3)
    (need_vienna_2)
    (need_vienna_1)
    (done_vienna)

    (need_porto_5)
    (need_porto_4)
    (need_porto_3)
    (need_porto_2)
    (need_porto_1)
    (done_porto)
  )

  (:action stay_prague_3
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in prague)
      (need_prague_3))
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (need_prague_3))
      (need_prague_2))
  )

  (:action stay_prague_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in prague)
      (need_prague_2))
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (need_prague_2))
      (need_prague_1))
  )

  (:action stay_prague_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in prague)
      (need_prague_1))
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (need_prague_1))
      (done_prague))
  )

  (:action stay_prague_workshop_3
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in prague)
      (workshop_day ?d)
      (not (workshop_attended))
      (need_prague_3))
    :effect (and
      (not (current ?d))
      (current ?n)
      (workshop_attended)
      (not (need_prague_3))
      (need_prague_2))
  )

  (:action stay_prague_workshop_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in prague)
      (workshop_day ?d)
      (not (workshop_attended))
      (need_prague_2))
    :effect (and
      (not (current ?d))
      (current ?n)
      (workshop_attended)
      (not (need_prague_2))
      (need_prague_1))
  )

  (:action stay_prague_workshop_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in prague)
      (workshop_day ?d)
      (not (workshop_attended))
      (need_prague_1))
    :effect (and
      (not (current ?d))
      (current ?n)
      (workshop_attended)
      (not (need_prague_1))
      (done_prague))
  )

  (:action stay_vienna_3
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in vienna)
      (need_vienna_3))
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (need_vienna_3))
      (need_vienna_2))
  )

  (:action stay_vienna_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in vienna)
      (need_vienna_2))
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (need_vienna_2))
      (need_vienna_1))
  )

  (:action stay_vienna_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in vienna)
      (need_vienna_1))
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (need_vienna_1))
      (done_vienna))
  )

  (:action stay_porto_5
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in porto)
      (need_porto_5))
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (need_porto_5))
      (need_porto_4))
  )

  (:action stay_porto_4
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in porto)
      (need_porto_4))
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (need_porto_4))
      (need_porto_3))
  )

  (:action stay_porto_3
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in porto)
      (need_porto_3))
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (need_porto_3))
      (need_porto_2))
  )

  (:action stay_porto_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in porto)
      (need_porto_2))
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (need_porto_2))
      (need_porto_1))
  )

  (:action stay_porto_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in porto)
      (need_porto_1))
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (need_porto_1))
      (done_porto))
  )

  (:action fly_prague_to_vienna
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in prague)
      (direct prague vienna)
      (need_prague_1)
      (need_vienna_3))
    :effect (and
      (not (in prague))
      (in vienna)
      (not (current ?d))
      (current ?n)
      (not (need_prague_1))
      (done_prague)
      (not (need_vienna_3))
      (need_vienna_2))
  )

  (:action fly_prague_to_vienna_workshop
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in prague)
      (direct prague vienna)
      (workshop_day ?d)
      (not (workshop_attended))
      (need_prague_1)
      (need_vienna_3))
    :effect (and
      (not (in prague))
      (in vienna)
      (not (current ?d))
      (current ?n)
      (workshop_attended)
      (not (need_prague_1))
      (done_prague)
      (not (need_vienna_3))
      (need_vienna_2))
  )

  (:action fly_vienna_to_porto
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (in vienna)
      (direct vienna porto)
      (need_vienna_1)
      (need_porto_5))
    :effect (and
      (not (in vienna))
      (in porto)
      (not (current ?d))
      (current ?n)
      (not (need_vienna_1))
      (done_vienna)
      (not (need_porto_5))
      (need_porto_4))
  )

  (:action final_stay_porto_1
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (last ?d)
      (in porto)
      (need_porto_1))
    :effect (and
      (not (need_porto_1))
      (done_porto))
  )
)