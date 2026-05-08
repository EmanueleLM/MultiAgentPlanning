(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city
    day
    traveler
    f_day_count_token
    r_day_count_token
    s_day_count_token
  )

  (:constants frankfurt reykjavik split - city)

  (:predicates
    (at ?t - traveler ?c - city)
    (connected ?c1 - city ?c2 - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (visited ?c - city)

    ; Stay counters for Frankfurt
    (frankfurt_stay_current ?n - f_day_count_token)
    (next_f_stay_token ?n1 - f_day_count_token ?n2 - f_day_count_token)

    ; Stay counters for Reykjavik
    (reykjavik_stay_current ?n - r_day_count_token)
    (next_r_stay_token ?n1 - r_day_count_token ?n2 - r_day_count_token)

    ; Stay counters for Split
    (split_stay_current ?n - s_day_count_token)
    (next_s_stay_token ?n1 - s_day_count_token ?n2 - s_day_count_token)

    ; Workshop day markers
    (workshop_day ?d - day)
  )

  (:functions
    (total-cost)
  )

  (:action fly
    :parameters (?t - traveler ?from - city ?to - city ?d_current - day ?d_next - day)
    :precondition (and
      (at ?t ?from)
      (connected ?from ?to)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      ; Workshop constraints:
      ; If current day is a workshop day, the traveler must be in Reykjavik to fly
      (or (not (workshop_day ?d_current)) (= ?from reykjavik))
      ; If next day is a workshop day, the traveler must fly to Reykjavik
      (or (not (workshop_day ?d_next)) (= ?to reykjavik))
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      (not (current_day ?d_current))
      (current_day ?d_next)
      (visited ?to)
      (increase (total-cost) 1)
    )
  )

  (:action stay_in_frankfurt
    :parameters (?t - traveler ?d_current - day ?d_next - day ?f_curr - f_day_count_token ?f_next - f_day_count_token)
    :precondition (and
      (at ?t frankfurt)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (frankfurt_stay_current ?f_curr)
      (next_f_stay_token ?f_curr ?f_next)
      ; Workshop constraints:
      ; Cannot stay in Frankfurt if it's a workshop day or if the next day is a workshop day
      (not (workshop_day ?d_current))
      (not (workshop_day ?d_next))
    )
    :effect (and
      (not (current_day ?d_current))
      (current_day ?d_next)
      (not (frankfurt_stay_current ?f_curr))
      (frankfurt_stay_current ?f_next)
      (increase (total-cost) 1)
    )
  )

  (:action stay_in_reykjavik
    :parameters (?t - traveler ?d_current - day ?d_next - day ?r_curr - r_day_count_token ?r_next - r_day_count_token)
    :precondition (and
      (at ?t reykjavik)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (reykjavik_stay_current ?r_curr)
      (next_r_stay_token ?r_curr ?r_next)
      ; Workshop constraints for Reykjavik: always true if (at ?t reykjavik)
    )
    :effect (and
      (not (current_day ?d_current))
      (current_day ?d_next)
      (not (reykjavik_stay_current ?r_curr))
      (reykjavik_stay_current ?r_next)
      (increase (total-cost) 1)
    )
  )

  (:action stay_in_split
    :parameters (?t - traveler ?d_current - day ?d_next - day ?s_curr - s_day_count_token ?s_next - s_day_count_token)
    :precondition (and
      (at ?t split)
      (current_day ?d_current)
      (next_day ?d_current ?d_next)
      (split_stay_current ?s_curr)
      (next_s_stay_token ?s_curr ?s_next)
      ; Workshop constraints:
      ; Cannot stay in Split if it's a workshop day or if the next day is a workshop day
      (not (workshop_day ?d_current))
      (not (workshop_day ?d_next))
    )
    :effect (and
      (not (current_day ?d_current))
      (current_day ?d_next)
      (not (split_stay_current ?s_curr))
      (split_stay_current ?s_next)
      (increase (total-cost) 1)
    )
  )
)