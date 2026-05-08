(define (domain tripplanningexample29)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (occupied ?c - city ?d - day)

    (started)
    (finished)

    (need_f_1)
    (need_f_2)
    (need_f_3)

    (need_d_1)
    (need_d_2)
    (need_d_3)
    (need_d_4)
    (need_d_5)
    (need_d_6)
    (need_d_7)

    (need_k_1)
    (need_k_2)
  )

  (:action start_at_frankfurt
    :parameters ()
    :precondition (and
      (current d1)
      (not (started))
      (not (finished))
      (not (at frankfurt))
      (not (at krakow))
      (not (at dubrovnik))
      (need_f_1)
    )
    :effect (and
      (started)
      (at frankfurt)
      (occupied frankfurt d1)
      (not (need_f_1))
      (need_f_2))
  )

  (:action start_at_krakow
    :parameters ()
    :precondition (and
      (current d1)
      (not (started))
      (not (finished))
      (not (at frankfurt))
      (not (at krakow))
      (not (at dubrovnik))
      (need_k_1)
    )
    :effect (and
      (started)
      (at krakow)
      (occupied krakow d1)
      (not (need_k_1))
      (need_k_2))
  )

  (:action start_at_dubrovnik
    :parameters ()
    :precondition (and
      (current d1)
      (not (started))
      (not (finished))
      (not (at frankfurt))
      (not (at krakow))
      (not (at dubrovnik))
      (need_d_1)
    )
    :effect (and
      (started)
      (at dubrovnik)
      (occupied dubrovnik d1)
      (not (need_d_1))
      (need_d_2))
  )

  (:action stay_frankfurt_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (need_f_2)
      (not (occupied frankfurt ?d2))
    )
    :effect (and
      (occupied frankfurt ?d2)
      (not (need_f_2))
      (need_f_3)
      (not (current ?d1))
      (current ?d2))
  )

  (:action stay_frankfurt_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (need_f_3)
      (not (occupied frankfurt ?d2))
    )
    :effect (and
      (occupied frankfurt ?d2)
      (not (need_f_3))
      (not (current ?d1))
      (current ?d2))
  )

  (:action stay_dubrovnik_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_d_2)
      (not (occupied dubrovnik ?d2))
    )
    :effect (and
      (occupied dubrovnik ?d2)
      (not (need_d_2))
      (need_d_3)
      (not (current ?d1))
      (current ?d2))
  )

  (:action stay_dubrovnik_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_d_3)
      (not (occupied dubrovnik ?d2))
    )
    :effect (and
      (occupied dubrovnik ?d2)
      (not (need_d_3))
      (need_d_4)
      (not (current ?d1))
      (current ?d2))
  )

  (:action stay_dubrovnik_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_d_4)
      (not (occupied dubrovnik ?d2))
    )
    :effect (and
      (occupied dubrovnik ?d2)
      (not (need_d_4))
      (need_d_5)
      (not (current ?d1))
      (current ?d2))
  )

  (:action stay_dubrovnik_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_d_5)
      (not (occupied dubrovnik ?d2))
    )
    :effect (and
      (occupied dubrovnik ?d2)
      (not (need_d_5))
      (need_d_6)
      (not (current ?d1))
      (current ?d2))
  )

  (:action stay_dubrovnik_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_d_6)
      (not (occupied dubrovnik ?d2))
    )
    :effect (and
      (occupied dubrovnik ?d2)
      (not (need_d_6))
      (need_d_7)
      (not (current ?d1))
      (current ?d2))
  )

  (:action stay_dubrovnik_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_d_7)
      (not (occupied dubrovnik ?d2))
    )
    :effect (and
      (occupied dubrovnik ?d2)
      (not (need_d_7))
      (not (current ?d1))
      (current ?d2))
  )

  (:action stay_krakow_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (need_k_2)
      (not (occupied krakow ?d2))
    )
    :effect (and
      (occupied krakow ?d2)
      (not (need_k_2))
      (not (current ?d1))
      (current ?d2))
  )

  (:action fly_frankfurt_to_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (direct frankfurt krakow)
      (need_k_1)
      (not (occupied krakow ?d2))
    )
    :effect (and
      (not (at frankfurt))
      (at krakow)
      (occupied krakow ?d2)
      (not (need_k_1))
      (need_k_2)
      (not (current ?d1))
      (current ?d2))
  )

  (:action fly_frankfurt_to_dubrovnik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (direct frankfurt dubrovnik)
      (need_d_1)
      (not (occupied dubrovnik ?d2))
    )
    :effect (and
      (not (at frankfurt))
      (at dubrovnik)
      (occupied dubrovnik ?d2)
      (not (need_d_1))
      (need_d_2)
      (not (current ?d1))
      (current ?d2))
  )

  (:action fly_krakow_to_frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (direct krakow frankfurt)
      (need_f_1)
      (not (occupied frankfurt ?d2))
    )
    :effect (and
      (not (at krakow))
      (at frankfurt)
      (occupied frankfurt ?d2)
      (not (need_f_1))
      (need_f_2)
      (not (current ?d1))
      (current ?d2))
  )

  (:action fly_dubrovnik_to_frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (direct dubrovnik frankfurt)
      (need_f_1)
      (not (occupied frankfurt ?d2))
    )
    :effect (and
      (not (at dubrovnik))
      (at frankfurt)
      (occupied frankfurt ?d2)
      (not (need_f_1))
      (need_f_2)
      (not (current ?d1))
      (current ?d2))
  )

  (:action fly_frankfurt_to_krakow_final
    :parameters ()
    :precondition (and
      (started)
      (not (finished))
      (current d9)
      (at frankfurt)
      (direct frankfurt krakow)
      (need_k_1)
      (not (need_f_1))
      (not (need_f_2))
      (not (need_f_3))
      (not (need_d_1))
      (not (need_d_2))
      (not (need_d_3))
      (not (need_d_4))
      (not (need_d_5))
      (not (need_d_6))
      (not (need_d_7))
      (not (occupied krakow d10))
    )
    :effect (and
      (not (at frankfurt))
      (at krakow)
      (occupied krakow d10)
      (not (need_k_1))
      (need_k_2)
      (not (current d9))
      (current d10)
      (finished))
  )

  (:action stay_krakow_final
    :parameters ()
    :precondition (and
      (started)
      (not (finished))
      (current d9)
      (at krakow)
      (need_k_2)
      (not (need_f_1))
      (not (need_f_2))
      (not (need_f_3))
      (not (need_d_1))
      (not (need_d_2))
      (not (need_d_3))
      (not (need_d_4))
      (not (need_d_5))
      (not (need_d_6))
      (not (need_d_7))
      (not (occupied krakow d10))
    )
    :effect (and
      (occupied krakow d10)
      (not (need_k_2))
      (not (current d9))
      (current d10)
      (finished))
  )
)