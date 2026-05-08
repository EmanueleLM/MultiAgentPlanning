(define (domain meet_john_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person timepoint meet_stage
  )

  (:constants
    m0 m1 m2 m3 m4 m5 m6 m7 m8 m9
    m10 m11 m12 m13 m14 m15 m16 m17 m18 m19
    m20 m21 m22 m23 m24 m25 m26 m27 m28 m29
    m30 m31 m32 m33 m34 m35 m36 m37 m38 m39
    m40 m41 m42 m43 m44 m45 m46 m47 m48 m49
    m50 m51 m52 m53 m54 m55 m56 m57 m58 m59
    m60 m61 m62 m63 m64 m65 m66 m67 m68 m69
    m70 m71 m72 m73 m74 m75 - meet_stage
  )

  (:predicates
    (at ?l - location)
    (person_at ?p - person ?l - location)
    (current_time ?t - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (available ?p - person ?t - timepoint)
    (travel_17 ?from - location ?to - location ?start - timepoint ?end - timepoint)
    (travel_18 ?from - location ?to - location ?start - timepoint ?end - timepoint)
    (meeting_stage ?s - meet_stage)
    (next_stage ?s1 - meet_stage ?s2 - meet_stage)
    (met ?p - person)
  )

  (:action advance_time
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action do_travel_17
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (travel_17 ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action do_travel_18
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (travel_18 ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting_minute
    :parameters (?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available ?p ?t1)
      (meeting_stage m0)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage m0))
      (meeting_stage m1)
    )
  )

  (:action continue_meeting_minute
    :parameters (?p - person ?l - location ?t1 - timepoint ?t2 - timepoint ?s1 - meet_stage ?s2 - meet_stage)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available ?p ?t1)
      (meeting_stage ?s1)
      (next_stage ?s1 ?s2)
      (not (meeting_stage m0))
      (not (meeting_stage m74))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage ?s1))
      (meeting_stage ?s2)
    )
  )

  (:action final_meeting_minute
    :parameters (?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available ?p ?t1)
      (meeting_stage m74)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage m74))
      (meeting_stage m75)
      (met ?p)
    )
  )
)