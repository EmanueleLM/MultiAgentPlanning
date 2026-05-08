(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day quota
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)

    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (visited_on ?c - city ?d - day)
    (day_recorded ?d - day)

    (start_unchosen)
    (trip_finished)
    (wedding_attended)

    (rq ?q - quota)
    (vq ?q - quota)
    (veq ?q - quota)
  )

  (:action choose_start_reykjavik
    :precondition (start_unchosen)
    :effect (and
      (not (start_unchosen))
      (at reykjavik)
    )
  )

  (:action choose_start_vienna
    :precondition (start_unchosen)
    :effect (and
      (not (start_unchosen))
      (at vienna)
    )
  )

  (:action choose_start_venice
    :precondition (start_unchosen)
    :effect (and
      (not (start_unchosen))
      (at venice)
    )
  )

  (:action stay_and_advance_reykjavik
    :parameters (?d - day ?d2 - day ?q - quota)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at reykjavik)
      (not (day_recorded ?d))
      (rq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (visited_on reykjavik ?d)
      (day_recorded ?d)
      (not (rq ?q))
    )
  )

  (:action stay_and_advance_vienna
    :parameters (?d - day ?d2 - day ?q - quota)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at vienna)
      (not (day_recorded ?d))
      (vq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (visited_on vienna ?d)
      (day_recorded ?d)
      (not (vq ?q))
    )
  )

  (:action stay_and_advance_venice
    :parameters (?d - day ?d2 - day ?q - quota)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (not (day_recorded ?d))
      (veq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (visited_on venice ?d)
      (day_recorded ?d)
      (not (veq ?q))
    )
  )

  (:action fly_and_advance_to_reykjavik
    :parameters (?d - day ?d2 - day ?from - city ?q - quota)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct_flight ?from reykjavik)
      (not (day_recorded ?d))
      (rq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at reykjavik)
      (visited_on reykjavik ?d)
      (day_recorded ?d)
      (not (rq ?q))
    )
  )

  (:action fly_and_advance_to_vienna
    :parameters (?d - day ?d2 - day ?from - city ?q - quota)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct_flight ?from vienna)
      (not (day_recorded ?d))
      (vq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at vienna)
      (visited_on vienna ?d)
      (day_recorded ?d)
      (not (vq ?q))
    )
  )

  (:action fly_and_advance_to_venice
    :parameters (?d - day ?d2 - day ?from - city ?q - quota)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct_flight ?from venice)
      (not (day_recorded ?d))
      (veq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at venice)
      (visited_on venice ?d)
      (day_recorded ?d)
      (not (veq ?q))
    )
  )

  (:action stay_and_advance_venice_wedding
    :parameters (?d - day ?d2 - day ?q - quota)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at venice)
      (not (day_recorded ?d))
      (veq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (visited_on venice ?d)
      (day_recorded ?d)
      (not (veq ?q))
      (wedding_attended)
    )
  )

  (:action fly_and_advance_to_venice_wedding
    :parameters (?d - day ?d2 - day ?from - city ?q - quota)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct_flight ?from venice)
      (not (day_recorded ?d))
      (veq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at venice)
      (visited_on venice ?d)
      (day_recorded ?d)
      (not (veq ?q))
      (wedding_attended)
    )
  )

  (:action stay_last_day_reykjavik
    :parameters (?d - day ?q - quota)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at reykjavik)
      (not (day_recorded ?d))
      (rq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (visited_on reykjavik ?d)
      (day_recorded ?d)
      (not (rq ?q))
      (trip_finished)
    )
  )

  (:action stay_last_day_vienna
    :parameters (?d - day ?q - quota)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at vienna)
      (not (day_recorded ?d))
      (vq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (visited_on vienna ?d)
      (day_recorded ?d)
      (not (vq ?q))
      (trip_finished)
    )
  )

  (:action stay_last_day_venice
    :parameters (?d - day ?q - quota)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at venice)
      (not (day_recorded ?d))
      (veq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (visited_on venice ?d)
      (day_recorded ?d)
      (not (veq ?q))
      (trip_finished)
    )
  )

  (:action stay_last_day_venice_wedding
    :parameters (?d - day ?q - quota)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at venice)
      (not (day_recorded ?d))
      (veq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (visited_on venice ?d)
      (day_recorded ?d)
      (not (veq ?q))
      (wedding_attended)
      (trip_finished)
    )
  )

  (:action fly_last_day_to_reykjavik
    :parameters (?d - day ?from - city ?q - quota)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?from)
      (direct_flight ?from reykjavik)
      (not (day_recorded ?d))
      (rq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (not (at ?from))
      (at reykjavik)
      (visited_on reykjavik ?d)
      (day_recorded ?d)
      (not (rq ?q))
      (trip_finished)
    )
  )

  (:action fly_last_day_to_vienna
    :parameters (?d - day ?from - city ?q - quota)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?from)
      (direct_flight ?from vienna)
      (not (day_recorded ?d))
      (vq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (not (at ?from))
      (at vienna)
      (visited_on vienna ?d)
      (day_recorded ?d)
      (not (vq ?q))
      (trip_finished)
    )
  )

  (:action fly_last_day_to_venice
    :parameters (?d - day ?from - city ?q - quota)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?from)
      (direct_flight ?from venice)
      (not (day_recorded ?d))
      (veq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (not (at ?from))
      (at venice)
      (visited_on venice ?d)
      (day_recorded ?d)
      (not (veq ?q))
      (trip_finished)
    )
  )

  (:action fly_last_day_to_venice_wedding
    :parameters (?d - day ?from - city ?q - quota)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?from)
      (direct_flight ?from venice)
      (not (day_recorded ?d))
      (veq ?q)
    )
    :effect (and
      (not (current_day ?d))
      (not (at ?from))
      (at venice)
      (visited_on venice ?d)
      (day_recorded ?d)
      (not (veq ?q))
      (wedding_attended)
      (trip_finished)
    )
  )
)