(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:predicates
    (at ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (spent ?c - city ?d - day)

    (start_unset)

    (dubrovnik_count ?n - count)
    (frankfurt_count ?n - count)
    (krakow_count ?n - count)
    (count_next ?n1 - count ?n2 - count)
  )

  (:action choose_start_frankfurt
    :parameters ()
    :precondition (and
      (start_unset)
      (current d1)
      (not (at frankfurt d1))
      (not (at krakow d1))
      (not (at dubrovnik d1))
    )
    :effect (and
      (not (start_unset))
      (at frankfurt d1)
    )
  )

  (:action choose_start_krakow
    :parameters ()
    :precondition (and
      (start_unset)
      (current d1)
      (not (at frankfurt d1))
      (not (at krakow d1))
      (not (at dubrovnik d1))
    )
    :effect (and
      (not (start_unset))
      (at krakow d1)
    )
  )

  (:action choose_start_dubrovnik
    :parameters ()
    :precondition (and
      (start_unset)
      (current d1)
      (not (at frankfurt d1))
      (not (at krakow d1))
      (not (at dubrovnik d1))
    )
    :effect (and
      (not (start_unset))
      (at dubrovnik d1)
    )
  )

  (:action stay_in_dubrovnik
    :parameters (?d - day ?dn - day ?cd - count ?nd - count)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at dubrovnik ?d)
      (not (start_unset))
      (dubrovnik_count ?cd)
      (count_next ?cd ?nd)
    )
    :effect (and
      (not (current ?d))
      (current ?dn)
      (spent dubrovnik ?d)
      (at dubrovnik ?dn)
      (not (dubrovnik_count ?cd))
      (dubrovnik_count ?nd)
    )
  )

  (:action stay_in_frankfurt
    :parameters (?d - day ?dn - day ?cf - count ?nf - count)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at frankfurt ?d)
      (not (start_unset))
      (frankfurt_count ?cf)
      (count_next ?cf ?nf)
    )
    :effect (and
      (not (current ?d))
      (current ?dn)
      (spent frankfurt ?d)
      (at frankfurt ?dn)
      (not (frankfurt_count ?cf))
      (frankfurt_count ?nf)
    )
  )

  (:action stay_in_krakow
    :parameters (?d - day ?dn - day ?ck - count ?nk - count)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at krakow ?d)
      (not (start_unset))
      (krakow_count ?ck)
      (count_next ?ck ?nk)
    )
    :effect (and
      (not (current ?d))
      (current ?dn)
      (spent krakow ?d)
      (at krakow ?dn)
      (not (krakow_count ?ck))
      (krakow_count ?nk)
    )
  )

  (:action fly_dubrovnik_to_frankfurt
    :parameters (?d - day ?dn - day ?cf - count ?nf - count)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at dubrovnik ?d)
      (direct dubrovnik frankfurt)
      (not (start_unset))
      (frankfurt_count ?cf)
      (count_next ?cf ?nf)
      (not (at frankfurt ?d))
    )
    :effect (and
      (not (current ?d))
      (current ?dn)
      (spent frankfurt ?d)
      (at frankfurt ?dn)
      (not (frankfurt_count ?cf))
      (frankfurt_count ?nf)
    )
  )

  (:action fly_frankfurt_to_dubrovnik
    :parameters (?d - day ?dn - day ?cd - count ?nd - count)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at frankfurt ?d)
      (direct frankfurt dubrovnik)
      (not (start_unset))
      (dubrovnik_count ?cd)
      (count_next ?cd ?nd)
      (not (at dubrovnik ?d))
    )
    :effect (and
      (not (current ?d))
      (current ?dn)
      (spent dubrovnik ?d)
      (at dubrovnik ?dn)
      (not (dubrovnik_count ?cd))
      (dubrovnik_count ?nd)
    )
  )

  (:action fly_frankfurt_to_krakow
    :parameters (?d - day ?dn - day ?ck - count ?nk - count)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at frankfurt ?d)
      (direct frankfurt krakow)
      (not (start_unset))
      (krakow_count ?ck)
      (count_next ?ck ?nk)
      (not (at krakow ?d))
    )
    :effect (and
      (not (current ?d))
      (current ?dn)
      (spent krakow ?d)
      (at krakow ?dn)
      (not (krakow_count ?ck))
      (krakow_count ?nk)
    )
  )

  (:action fly_krakow_to_frankfurt
    :parameters (?d - day ?dn - day ?cf - count ?nf - count)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at krakow ?d)
      (direct krakow frankfurt)
      (not (start_unset))
      (frankfurt_count ?cf)
      (count_next ?cf ?nf)
      (not (at frankfurt ?d))
    )
    :effect (and
      (not (current ?d))
      (current ?dn)
      (spent frankfurt ?d)
      (at frankfurt ?dn)
      (not (frankfurt_count ?cf))
      (frankfurt_count ?nf)
    )
  )
)