(define (domain european_trip_13_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day bcount kcount rcount
  )

  (:constants
    barcelona krakow rome - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    b0 b1 b2 b3 b4 b5 b6 b7 - bcount
    k0 k1 k2 k3 k4 - kcount
    r0 r1 r2 r3 r4 - rcount
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (bprog ?b - bcount)
    (bnext ?b1 - bcount ?b2 - bcount)
    (kprog ?k - kcount)
    (knext ?k1 - kcount ?k2 - kcount)
    (rprog ?r - rcount)
    (rnext ?r1 - rcount ?r2 - rcount)
    (meeting_done)
    (meeting_day ?d - day)
  )

  (:action start_in_barcelona
    :parameters ()
    :precondition (and
      (not (current_day d1))
      (bprog b0)
      (kprog k0)
      (rprog r0)
    )
    :effect (and
      (at barcelona d1)
      (current_day d1)
      (not (bprog b0))
      (bprog b1)
    )
  )

  (:action start_in_krakow
    :parameters ()
    :precondition (and
      (not (current_day d1))
      (bprog b0)
      (kprog k0)
      (rprog r0)
    )
    :effect (and
      (at krakow d1)
      (current_day d1)
      (not (kprog k0))
      (kprog k1)
    )
  )

  (:action start_in_rome
    :parameters ()
    :precondition (and
      (not (current_day d1))
      (bprog b0)
      (kprog k0)
      (rprog r0)
    )
    :effect (and
      (at rome d1)
      (current_day d1)
      (not (rprog r0))
      (rprog r1)
    )
  )

  (:action stay_barcelona
    :parameters (?d1 - day ?d2 - day ?b1 - bcount ?b2 - bcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (bprog ?b1)
      (bnext ?b1 ?b2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at barcelona ?d1))
      (at barcelona ?d2)
      (not (bprog ?b1))
      (bprog ?b2)
    )
  )

  (:action stay_krakow
    :parameters (?d1 - day ?d2 - day ?k1 - kcount ?k2 - kcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow ?d1)
      (kprog ?k1)
      (knext ?k1 ?k2)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at krakow ?d1))
      (at krakow ?d2)
      (not (kprog ?k1))
      (kprog ?k2)
    )
  )

  (:action stay_krakow_meeting
    :parameters (?d1 - day ?d2 - day ?k1 - kcount ?k2 - kcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow ?d1)
      (kprog ?k1)
      (knext ?k1 ?k2)
      (meeting_day ?d2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at krakow ?d1))
      (at krakow ?d2)
      (not (kprog ?k1))
      (kprog ?k2)
      (meeting_done)
    )
  )

  (:action stay_rome
    :parameters (?d1 - day ?d2 - day ?r1 - rcount ?r2 - rcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at rome ?d1)
      (rprog ?r1)
      (rnext ?r1 ?r2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at rome ?d1))
      (at rome ?d2)
      (not (rprog ?r1))
      (rprog ?r2)
    )
  )

  (:action fly_barcelona_to_krakow
    :parameters (?d1 - day ?d2 - day ?k1 - kcount ?k2 - kcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona krakow)
      (kprog ?k1)
      (knext ?k1 ?k2)
      (not (meeting_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at barcelona ?d1))
      (at krakow ?d2)
      (not (kprog ?k1))
      (kprog ?k2)
    )
  )

  (:action fly_barcelona_to_krakow_meeting
    :parameters (?d1 - day ?d2 - day ?k1 - kcount ?k2 - kcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona krakow)
      (kprog ?k1)
      (knext ?k1 ?k2)
      (meeting_day ?d2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at barcelona ?d1))
      (at krakow ?d2)
      (not (kprog ?k1))
      (kprog ?k2)
      (meeting_done)
    )
  )

  (:action fly_krakow_to_barcelona
    :parameters (?d1 - day ?d2 - day ?b1 - bcount ?b2 - bcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow ?d1)
      (direct_flight krakow barcelona)
      (bprog ?b1)
      (bnext ?b1 ?b2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at krakow ?d1))
      (at barcelona ?d2)
      (not (bprog ?b1))
      (bprog ?b2)
    )
  )

  (:action fly_barcelona_to_rome
    :parameters (?d1 - day ?d2 - day ?r1 - rcount ?r2 - rcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at barcelona ?d1)
      (direct_flight barcelona rome)
      (rprog ?r1)
      (rnext ?r1 ?r2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at barcelona ?d1))
      (at rome ?d2)
      (not (rprog ?r1))
      (rprog ?r2)
    )
  )

  (:action fly_rome_to_barcelona
    :parameters (?d1 - day ?d2 - day ?b1 - bcount ?b2 - bcount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at rome ?d1)
      (direct_flight rome barcelona)
      (bprog ?b1)
      (bnext ?b1 ?b2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at rome ?d1))
      (at barcelona ?d2)
      (not (bprog ?b1))
      (bprog ?b2)
    )
  )
)