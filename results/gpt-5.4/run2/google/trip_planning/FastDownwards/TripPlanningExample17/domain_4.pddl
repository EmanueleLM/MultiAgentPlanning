(define (domain tripplanningexample17)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (current ?d - day)
    (final_day ?d - day)

    (assigned ?d - day ?c - city)

    (need_copenhagen_start)
    (need_copenhagen_end)
    (need_vienna_start)
    (need_vienna_end)
    (need_lyon_start)
    (need_lyon_end)

    (started_copenhagen)
    (finished_copenhagen)
    (started_vienna)
    (finished_vienna)
    (started_lyon)
    (finished_lyon)
  )

  (:action stay_before_copenhagen
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (at copenhagen)
      (need_copenhagen_start)
      (not (started_copenhagen))
      (assigned ?d copenhagen)
    )
    :effect (and
      (not (current ?d))
      (current ?n)
      (assigned ?n copenhagen)
      (started_copenhagen)
      (not (need_copenhagen_start))
    )
  )

  (:action stay_extend_copenhagen
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (at copenhagen)
      (started_copenhagen)
      (not (finished_copenhagen))
      (assigned ?d copenhagen)
    )
    :effect (and
      (not (current ?d))
      (current ?n)
      (assigned ?n copenhagen)
    )
  )

  (:action fly_after_copenhagen
    :parameters (?d - day ?n - day ?to - city)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (at copenhagen)
      (direct copenhagen ?to)
      (need_copenhagen_end)
      (started_copenhagen)
      (not (finished_copenhagen))
      (assigned ?d copenhagen)
      (not (= ?to copenhagen))
    )
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (at copenhagen))
      (at ?to)
      (assigned ?n ?to)
      (finished_copenhagen)
      (not (need_copenhagen_end))
    )
  )

  (:action stay_before_vienna
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (at vienna)
      (need_vienna_start)
      (not (started_vienna))
      (assigned ?d vienna)
    )
    :effect (and
      (not (current ?d))
      (current ?n)
      (assigned ?n vienna)
      (started_vienna)
      (not (need_vienna_start))
    )
  )

  (:action stay_extend_vienna
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (at vienna)
      (started_vienna)
      (not (finished_vienna))
      (assigned ?d vienna)
    )
    :effect (and
      (not (current ?d))
      (current ?n)
      (assigned ?n vienna)
    )
  )

  (:action fly_after_vienna
    :parameters (?d - day ?n - day ?to - city)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (at vienna)
      (direct vienna ?to)
      (need_vienna_end)
      (started_vienna)
      (not (finished_vienna))
      (assigned ?d vienna)
      (not (= ?to vienna))
    )
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (at vienna))
      (at ?to)
      (assigned ?n ?to)
      (finished_vienna)
      (not (need_vienna_end))
    )
  )

  (:action stay_before_lyon
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (at lyon)
      (need_lyon_start)
      (not (started_lyon))
      (assigned ?d lyon)
    )
    :effect (and
      (not (current ?d))
      (current ?n)
      (assigned ?n lyon)
      (started_lyon)
      (not (need_lyon_start))
    )
  )

  (:action stay_extend_lyon
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (at lyon)
      (started_lyon)
      (not (finished_lyon))
      (assigned ?d lyon)
    )
    :effect (and
      (not (current ?d))
      (current ?n)
      (assigned ?n lyon)
    )
  )

  (:action finish_in_lyon
    :parameters (?d - day ?n - day)
    :precondition (and
      (current ?d)
      (next ?d ?n)
      (final_day ?n)
      (at lyon)
      (need_lyon_end)
      (started_lyon)
      (not (finished_lyon))
      (assigned ?d lyon)
    )
    :effect (and
      (not (current ?d))
      (current ?n)
      (assigned ?n lyon)
      (finished_lyon)
      (not (need_lyon_end))
    )
  )
)