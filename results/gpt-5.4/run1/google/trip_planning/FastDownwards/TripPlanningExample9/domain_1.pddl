(define (domain trip_planning_example9)
  (:requirements :strips :typing)

  (:types city day count)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (count_frankfurt ?n - count)
    (count_bucharest ?n - count)
    (count_stuttgart ?n - count)
    (next_count ?n1 - count ?n2 - count)

    (workshop_day ?d - day)
    (workshop_attended)
  )

  (:action stay_and_advance_in_frankfurt
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at frankfurt)
      (count_frankfurt ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (count_frankfurt ?n1))
      (count_frankfurt ?n2)
    )
  )

  (:action stay_and_advance_in_bucharest
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (count_bucharest ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (count_bucharest ?n1))
      (count_bucharest ?n2)
    )
  )

  (:action stay_and_advance_in_stuttgart_nonworkshop
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at stuttgart)
      (count_stuttgart ?n1)
      (next_count ?n1 ?n2)
      (not (workshop_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (count_stuttgart ?n1))
      (count_stuttgart ?n2)
    )
  )

  (:action stay_and_advance_in_stuttgart_workshop
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at stuttgart)
      (count_stuttgart ?n1)
      (next_count ?n1 ?n2)
      (workshop_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (count_stuttgart ?n1))
      (count_stuttgart ?n2)
      (workshop_attended)
    )
  )

  (:action fly_to_frankfurt
    :parameters (?from - city ?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct ?from frankfurt)
      (count_frankfurt ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at frankfurt)
      (not (count_frankfurt ?n1))
      (count_frankfurt ?n2)
    )
  )

  (:action fly_to_bucharest
    :parameters (?from - city ?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct ?from bucharest)
      (count_bucharest ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at bucharest)
      (not (count_bucharest ?n1))
      (count_bucharest ?n2)
    )
  )

  (:action fly_to_stuttgart_nonworkshop
    :parameters (?from - city ?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct ?from stuttgart)
      (count_stuttgart ?n1)
      (next_count ?n1 ?n2)
      (not (workshop_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at stuttgart)
      (not (count_stuttgart ?n1))
      (count_stuttgart ?n2)
    )
  )

  (:action fly_to_stuttgart_workshop
    :parameters (?from - city ?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct ?from stuttgart)
      (count_stuttgart ?n1)
      (next_count ?n1 ?n2)
      (workshop_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at stuttgart)
      (not (count_stuttgart ?n1))
      (count_stuttgart ?n2)
      (workshop_attended)
    )
  )
)