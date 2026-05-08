(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
    florence_count amsterdam_count riga_count
  )

  (:constants
    florence amsterdam riga - city
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (workshop_eligible_day ?d - day)
    (workshop_attended)

    (florence_next ?from - florence_count ?to - florence_count)
    (amsterdam_next ?from - amsterdam_count ?to - amsterdam_count)
    (riga_next ?from - riga_count ?to - riga_count)

    (florence_count_at ?fc - florence_count)
    (amsterdam_count_at ?ac - amsterdam_count)
    (riga_count_at ?rc - riga_count)
  )

  (:action stay_same_day_florence
    :parameters (?d - day ?d_next - day ?fc_from - florence_count ?fc_to - florence_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at florence)
      (florence_count_at ?fc_from)
      (florence_next ?fc_from ?fc_to)
      (not (workshop_eligible_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (florence_count_at ?fc_from))
      (florence_count_at ?fc_to)
    )
  )

  (:action stay_same_day_amsterdam
    :parameters (?d - day ?d_next - day ?ac_from - amsterdam_count ?ac_to - amsterdam_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at amsterdam)
      (amsterdam_count_at ?ac_from)
      (amsterdam_next ?ac_from ?ac_to)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (amsterdam_count_at ?ac_from))
      (amsterdam_count_at ?ac_to)
    )
  )

  (:action stay_same_day_riga
    :parameters (?d - day ?d_next - day ?rc_from - riga_count ?rc_to - riga_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at riga)
      (riga_count_at ?rc_from)
      (riga_next ?rc_from ?rc_to)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (riga_count_at ?rc_from))
      (riga_count_at ?rc_to)
    )
  )

  (:action stay_florence_workshop_day
    :parameters (?d - day ?d_next - day ?fc_from - florence_count ?fc_to - florence_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at florence)
      (workshop_eligible_day ?d)
      (florence_count_at ?fc_from)
      (florence_next ?fc_from ?fc_to)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (florence_count_at ?fc_from))
      (florence_count_at ?fc_to)
      (workshop_attended)
    )
  )

  (:action fly_and_stay_day_to_florence
    :parameters (?d - day ?d_next - day ?from - city ?fc_from - florence_count ?fc_to - florence_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct ?from florence)
      (florence_count_at ?fc_from)
      (florence_next ?fc_from ?fc_to)
      (not (workshop_eligible_day ?d))
    )
    :effect (and
      (not (at ?from))
      (at florence)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (florence_count_at ?fc_from))
      (florence_count_at ?fc_to)
    )
  )

  (:action fly_and_stay_day_to_amsterdam
    :parameters (?d - day ?d_next - day ?from - city ?ac_from - amsterdam_count ?ac_to - amsterdam_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct ?from amsterdam)
      (amsterdam_count_at ?ac_from)
      (amsterdam_next ?ac_from ?ac_to)
    )
    :effect (and
      (not (at ?from))
      (at amsterdam)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (amsterdam_count_at ?ac_from))
      (amsterdam_count_at ?ac_to)
    )
  )

  (:action fly_and_stay_day_to_riga
    :parameters (?d - day ?d_next - day ?from - city ?rc_from - riga_count ?rc_to - riga_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct ?from riga)
      (riga_count_at ?rc_from)
      (riga_next ?rc_from ?rc_to)
    )
    :effect (and
      (not (at ?from))
      (at riga)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (riga_count_at ?rc_from))
      (riga_count_at ?rc_to)
    )
  )

  (:action fly_to_florence_workshop_day
    :parameters (?d - day ?d_next - day ?from - city ?fc_from - florence_count ?fc_to - florence_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct ?from florence)
      (workshop_eligible_day ?d)
      (florence_count_at ?fc_from)
      (florence_next ?fc_from ?fc_to)
    )
    :effect (and
      (not (at ?from))
      (at florence)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (florence_count_at ?fc_from))
      (florence_count_at ?fc_to)
      (workshop_attended)
    )
  )
)