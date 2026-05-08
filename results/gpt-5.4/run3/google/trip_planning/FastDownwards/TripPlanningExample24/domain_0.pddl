(define (domain european_trip_13days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    florence_count
    amsterdam_count
    riga_count
  )

  (:constants
    florence amsterdam riga - city
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (in_city ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (workshop_day ?d - day)
    (workshop_attended)
    (day_assigned ?d - day)
    (final_day ?d - day)

    (florence_count_at ?n - florence_count)
    (florence_count_next ?n1 - florence_count ?n2 - florence_count)

    (amsterdam_count_at ?n - amsterdam_count)
    (amsterdam_count_next ?n1 - amsterdam_count ?n2 - amsterdam_count)

    (riga_count_at ?n - riga_count)
    (riga_count_next ?n1 - riga_count ?n2 - riga_count)
  )

  (:action stay_in_florence_workshop
    :parameters (?d - day ?d2 - day ?f1 - florence_count ?f2 - florence_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (in_city florence ?d)
      (day_assigned ?d)
      (workshop_day ?d2)
      (florence_count_at ?f1)
      (florence_count_next ?f1 ?f2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_city florence ?d2)
      (day_assigned ?d2)
      (not (florence_count_at ?f1))
      (florence_count_at ?f2)
      (workshop_attended)
    )
  )

  (:action stay_in_florence_nonworkshop
    :parameters (?d - day ?d2 - day ?f1 - florence_count ?f2 - florence_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (in_city florence ?d)
      (day_assigned ?d)
      (not (workshop_day ?d2))
      (florence_count_at ?f1)
      (florence_count_next ?f1 ?f2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_city florence ?d2)
      (day_assigned ?d2)
      (not (florence_count_at ?f1))
      (florence_count_at ?f2)
    )
  )

  (:action fly_amsterdam_to_florence_workshop
    :parameters (?d - day ?d2 - day ?f1 - florence_count ?f2 - florence_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (in_city amsterdam ?d)
      (connected amsterdam florence)
      (day_assigned ?d)
      (workshop_day ?d2)
      (florence_count_at ?f1)
      (florence_count_next ?f1 ?f2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_city florence ?d2)
      (day_assigned ?d2)
      (not (florence_count_at ?f1))
      (florence_count_at ?f2)
      (workshop_attended)
    )
  )

  (:action fly_amsterdam_to_florence_nonworkshop
    :parameters (?d - day ?d2 - day ?f1 - florence_count ?f2 - florence_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (in_city amsterdam ?d)
      (connected amsterdam florence)
      (day_assigned ?d)
      (not (workshop_day ?d2))
      (florence_count_at ?f1)
      (florence_count_next ?f1 ?f2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_city florence ?d2)
      (day_assigned ?d2)
      (not (florence_count_at ?f1))
      (florence_count_at ?f2)
    )
  )

  (:action stay_in_amsterdam
    :parameters (?d - day ?d2 - day ?a1 - amsterdam_count ?a2 - amsterdam_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (in_city amsterdam ?d)
      (day_assigned ?d)
      (amsterdam_count_at ?a1)
      (amsterdam_count_next ?a1 ?a2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_city amsterdam ?d2)
      (day_assigned ?d2)
      (not (amsterdam_count_at ?a1))
      (amsterdam_count_at ?a2)
    )
  )

  (:action fly_florence_to_amsterdam
    :parameters (?d - day ?d2 - day ?a1 - amsterdam_count ?a2 - amsterdam_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (in_city florence ?d)
      (connected florence amsterdam)
      (day_assigned ?d)
      (amsterdam_count_at ?a1)
      (amsterdam_count_next ?a1 ?a2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_city amsterdam ?d2)
      (day_assigned ?d2)
      (not (amsterdam_count_at ?a1))
      (amsterdam_count_at ?a2)
    )
  )

  (:action fly_riga_to_amsterdam
    :parameters (?d - day ?d2 - day ?a1 - amsterdam_count ?a2 - amsterdam_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (in_city riga ?d)
      (connected riga amsterdam)
      (day_assigned ?d)
      (amsterdam_count_at ?a1)
      (amsterdam_count_next ?a1 ?a2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_city amsterdam ?d2)
      (day_assigned ?d2)
      (not (amsterdam_count_at ?a1))
      (amsterdam_count_at ?a2)
    )
  )

  (:action stay_in_riga
    :parameters (?d - day ?d2 - day ?r1 - riga_count ?r2 - riga_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (in_city riga ?d)
      (day_assigned ?d)
      (riga_count_at ?r1)
      (riga_count_next ?r1 ?r2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_city riga ?d2)
      (day_assigned ?d2)
      (not (riga_count_at ?r1))
      (riga_count_at ?r2)
    )
  )

  (:action fly_amsterdam_to_riga
    :parameters (?d - day ?d2 - day ?r1 - riga_count ?r2 - riga_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (in_city amsterdam ?d)
      (connected amsterdam riga)
      (day_assigned ?d)
      (riga_count_at ?r1)
      (riga_count_next ?r1 ?r2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_city riga ?d2)
      (day_assigned ?d2)
      (not (riga_count_at ?r1))
      (riga_count_at ?r2)
    )
  )
)