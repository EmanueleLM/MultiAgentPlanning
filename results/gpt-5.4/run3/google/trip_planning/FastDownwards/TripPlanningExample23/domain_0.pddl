(define (domain european_trip_8_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    timepoint
    dayslot
    count
  )

  (:predicates
    (at ?c - city)
    (current_tp ?t - timepoint)
    (next_tp ?from - timepoint ?to - timepoint)
    (tp_slot ?tp - timepoint ?ds - dayslot)
    (direct ?from - city ?to - city)

    (slot_free ?ds - dayslot)
    (occupied ?ds - dayslot ?c - city)

    (workshop_day ?ds - dayslot)
    (workshop_satisfied)

    (next_count_london ?from - count ?to - count)
    (next_count_bucharest ?from - count ?to - count)
    (next_count_riga ?from - count ?to - count)

    (london_count ?n - count)
    (bucharest_count ?n - count)
    (riga_count ?n - count)
  )

  (:action stay_london
    :parameters (?tp - timepoint ?tp_next - timepoint ?ds - dayslot ?n_from - count ?n_to - count)
    :precondition (and
      (at london)
      (current_tp ?tp)
      (next_tp ?tp ?tp_next)
      (tp_slot ?tp ?ds)
      (slot_free ?ds)
      (london_count ?n_from)
      (next_count_london ?n_from ?n_to)
    )
    :effect (and
      (not (current_tp ?tp))
      (current_tp ?tp_next)
      (occupied ?ds london)
      (not (slot_free ?ds))
      (not (london_count ?n_from))
      (london_count ?n_to)
    )
  )

  (:action stay_bucharest
    :parameters (?tp - timepoint ?tp_next - timepoint ?ds - dayslot ?n_from - count ?n_to - count)
    :precondition (and
      (at bucharest)
      (current_tp ?tp)
      (next_tp ?tp ?tp_next)
      (tp_slot ?tp ?ds)
      (slot_free ?ds)
      (bucharest_count ?n_from)
      (next_count_bucharest ?n_from ?n_to)
    )
    :effect (and
      (not (current_tp ?tp))
      (current_tp ?tp_next)
      (occupied ?ds bucharest)
      (not (slot_free ?ds))
      (not (bucharest_count ?n_from))
      (bucharest_count ?n_to)
    )
  )

  (:action stay_riga_nonworkshop
    :parameters (?tp - timepoint ?tp_next - timepoint ?ds - dayslot ?n_from - count ?n_to - count)
    :precondition (and
      (at riga)
      (current_tp ?tp)
      (next_tp ?tp ?tp_next)
      (tp_slot ?tp ?ds)
      (slot_free ?ds)
      (not (workshop_day ?ds))
      (riga_count ?n_from)
      (next_count_riga ?n_from ?n_to)
    )
    :effect (and
      (not (current_tp ?tp))
      (current_tp ?tp_next)
      (occupied ?ds riga)
      (not (slot_free ?ds))
      (not (riga_count ?n_from))
      (riga_count ?n_to)
    )
  )

  (:action stay_riga_workshop
    :parameters (?tp - timepoint ?tp_next - timepoint ?ds - dayslot ?n_from - count ?n_to - count)
    :precondition (and
      (at riga)
      (current_tp ?tp)
      (next_tp ?tp ?tp_next)
      (tp_slot ?tp ?ds)
      (slot_free ?ds)
      (workshop_day ?ds)
      (riga_count ?n_from)
      (next_count_riga ?n_from ?n_to)
    )
    :effect (and
      (not (current_tp ?tp))
      (current_tp ?tp_next)
      (occupied ?ds riga)
      (not (slot_free ?ds))
      (not (riga_count ?n_from))
      (riga_count ?n_to)
      (workshop_satisfied)
    )
  )

  (:action fly_london_bucharest
    :parameters (?tp - timepoint ?tp_next - timepoint ?ds - dayslot ?n_from - count ?n_to - count)
    :precondition (and
      (at london)
      (current_tp ?tp)
      (next_tp ?tp ?tp_next)
      (tp_slot ?tp ?ds)
      (slot_free ?ds)
      (direct london bucharest)
      (london_count ?n_from)
      (next_count_london ?n_from ?n_to)
    )
    :effect (and
      (not (at london))
      (at bucharest)
      (not (current_tp ?tp))
      (current_tp ?tp_next)
      (occupied ?ds london)
      (not (slot_free ?ds))
      (not (london_count ?n_from))
      (london_count ?n_to)
    )
  )

  (:action fly_bucharest_london
    :parameters (?tp - timepoint ?tp_next - timepoint ?ds - dayslot ?n_from - count ?n_to - count)
    :precondition (and
      (at bucharest)
      (current_tp ?tp)
      (next_tp ?tp ?tp_next)
      (tp_slot ?tp ?ds)
      (slot_free ?ds)
      (direct bucharest london)
      (bucharest_count ?n_from)
      (next_count_bucharest ?n_from ?n_to)
    )
    :effect (and
      (not (at bucharest))
      (at london)
      (not (current_tp ?tp))
      (current_tp ?tp_next)
      (occupied ?ds bucharest)
      (not (slot_free ?ds))
      (not (bucharest_count ?n_from))
      (bucharest_count ?n_to)
    )
  )

  (:action fly_bucharest_riga
    :parameters (?tp - timepoint ?tp_next - timepoint ?ds - dayslot ?n_from - count ?n_to - count)
    :precondition (and
      (at bucharest)
      (current_tp ?tp)
      (next_tp ?tp ?tp_next)
      (tp_slot ?tp ?ds)
      (slot_free ?ds)
      (direct bucharest riga)
      (bucharest_count ?n_from)
      (next_count_bucharest ?n_from ?n_to)
    )
    :effect (and
      (not (at bucharest))
      (at riga)
      (not (current_tp ?tp))
      (current_tp ?tp_next)
      (occupied ?ds bucharest)
      (not (slot_free ?ds))
      (not (bucharest_count ?n_from))
      (bucharest_count ?n_to)
    )
  )

  (:action fly_riga_bucharest_nonworkshop
    :parameters (?tp - timepoint ?tp_next - timepoint ?ds - dayslot ?n_from - count ?n_to - count)
    :precondition (and
      (at riga)
      (current_tp ?tp)
      (next_tp ?tp ?tp_next)
      (tp_slot ?tp ?ds)
      (slot_free ?ds)
      (not (workshop_day ?ds))
      (direct riga bucharest)
      (riga_count ?n_from)
      (next_count_riga ?n_from ?n_to)
    )
    :effect (and
      (not (at riga))
      (at bucharest)
      (not (current_tp ?tp))
      (current_tp ?tp_next)
      (occupied ?ds riga)
      (not (slot_free ?ds))
      (not (riga_count ?n_from))
      (riga_count ?n_to)
    )
  )

  (:action fly_riga_bucharest_workshop
    :parameters (?tp - timepoint ?tp_next - timepoint ?ds - dayslot ?n_from - count ?n_to - count)
    :precondition (and
      (at riga)
      (current_tp ?tp)
      (next_tp ?tp ?tp_next)
      (tp_slot ?tp ?ds)
      (slot_free ?ds)
      (workshop_day ?ds)
      (direct riga bucharest)
      (riga_count ?n_from)
      (next_count_riga ?n_from ?n_to)
    )
    :effect (and
      (not (at riga))
      (at bucharest)
      (not (current_tp ?tp))
      (current_tp ?tp_next)
      (occupied ?ds riga)
      (not (slot_free ?ds))
      (not (riga_count ?n_from))
      (riga_count ?n_to)
      (workshop_satisfied)
    )
  )
)