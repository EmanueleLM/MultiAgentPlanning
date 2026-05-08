(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)        ; person is in city during day
    (next ?d1 - day ?d2 - day)                ; d2 follows d1
    (show-day ?d - day)                       ; day is a show day in Krakow
    (attended ?d - day)                       ; show on day has been attended
  )

  ;---------------------------
  ; Actions of the itinerary_planner agent
  ;---------------------------

  ; Stay in Lyon across consecutive days
  (:action itinerary_planner-stay-in-lyon
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p lyon ?d1)
      (next ?d1 ?d2)
      (not (at ?p frankfurt ?d2))
      (not (at ?p krakow ?d2))
    )
    :effect (and
      (at ?p lyon ?d2)
    )
  )

  ; Stay in Frankfurt across consecutive days (allowed but will violate goals if used)
  (:action itinerary_planner-stay-in-frankfurt
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p frankfurt ?d1)
      (next ?d1 ?d2)
      (not (at ?p lyon ?d2))
      (not (at ?p krakow ?d2))
    )
    :effect (and
      (at ?p frankfurt ?d2)
    )
  )

  ; Stay in Krakow across consecutive days
  (:action itinerary_planner-stay-in-krakow
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p krakow ?d1)
      (next ?d1 ?d2)
      (not (at ?p lyon ?d2))
      (not (at ?p frankfurt ?d2))
    )
    :effect (and
      (at ?p krakow ?d2)
    )
  )

  ; Attend show in Krakow on a show day
  (:action itinerary_planner-attend-show
    :parameters (?p - person ?d - day)
    :precondition (and
      (at ?p krakow ?d)
      (show-day ?d)
      (not (attended ?d))
    )
    :effect (and
      (attended ?d)
    )
  )

  ;---------------------------
  ; Actions of the flight_connector agent
  ; Direct flight legs (each leg is one non-stop direct flight and moves presence from previous day -> next day)
  ; These actions model allowed direct single-leg moves executed between consecutive days.
  ;---------------------------

  ; Lyon -> Frankfurt (direct)
  (:action flight_connector-fly-lyon-frankfurt
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p lyon ?d1)
      (next ?d1 ?d2)
      (not (at ?p frankfurt ?d2))
      (not (at ?p krakow ?d2))
    )
    :effect (and
      (at ?p frankfurt ?d2)
    )
  )

  ; Frankfurt -> Lyon (direct)
  (:action flight_connector-fly-frankfurt-lyon
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p frankfurt ?d1)
      (next ?d1 ?d2)
      (not (at ?p lyon ?d2))
      (not (at ?p krakow ?d2))
    )
    :effect (and
      (at ?p lyon ?d2)
    )
  )

  ; Frankfurt -> Krakow (direct)
  (:action flight_connector-fly-frankfurt-krakow
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p frankfurt ?d1)
      (next ?d1 ?d2)
      (not (at ?p krakow ?d2))
      (not (at ?p lyon ?d2))
    )
    :effect (and
      (at ?p krakow ?d2)
    )
  )

  ; Krakow -> Frankfurt (direct)
  (:action flight_connector-fly-krakow-frankfurt
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p krakow ?d1)
      (next ?d1 ?d2)
      (not (at ?p frankfurt ?d2))
      (not (at ?p lyon ?d2))
    )
    :effect (and
      (at ?p frankfurt ?d2)
    )
  )

  ;---------------------------
  ; Composite same-day transfer via Frankfurt (explicitly models two direct legs executed within one calendar day)
  ; This action encodes the allowed same-day two-leg itinerary Lyon -> Frankfurt -> Krakow that results in being in Krakow on the next day slot,
  ; while consuming the single day boundary (previous day -> next day). No direct Lyon->Krakow non-stop action is provided anywhere in the domain.
  ;---------------------------

  (:action flight_connector-transfer-lyon-via-frankfurt-to-krakow
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p lyon ?d1)
      (next ?d1 ?d2)
      ; ensure destination day not already assigned to another city
      (not (at ?p lyon ?d2))
      (not (at ?p frankfurt ?d2))
      (not (at ?p krakow ?d2))
    )
    :effect (and
      ; result: arrive Krakow on the next day (represents two direct legs LYS->FRA and FRA->KRK executed same calendar day)
      (at ?p krakow ?d2)
    )
  )
)